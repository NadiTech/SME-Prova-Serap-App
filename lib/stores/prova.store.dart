import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:appserap/enums/download_status.enum.dart';
import 'package:appserap/enums/prova_status.enum.dart';
import 'package:appserap/interfaces/loggable.interface.dart';
import 'package:appserap/main.ioc.dart';
import 'package:appserap/managers/download.manager.dart';
import 'package:appserap/models/prova.model.dart';
import 'package:appserap/services/api.dart';
import 'package:appserap/stores/prova_resposta.store.dart';
import 'package:appserap/stores/prova_tempo_exeucao.store.dart';
import 'package:appserap/ui/widgets/dialog/dialogs.dart';
import 'package:appserap/utils/assets.util.dart';
import 'package:appserap/workers/sincronizar_resposta.worker.dart';

part 'prova.store.g.dart';

class ProvaStore = _ProvaStoreBase with _$ProvaStore;

abstract class _ProvaStoreBase with Store, Loggable, Disposable {
  List<ReactionDisposer> _reactions = [];

  @observable
  ObservableStream<ConnectivityResult> conexaoStream = ObservableStream(Connectivity().onConnectivityChanged);

  late GerenciadorDownload gerenciadorDownload;

  int id;

  @observable
  Prova prova;

  _ProvaStoreBase({
    required this.id,
    required this.prova,
    required this.respostas,
  }) {
    gerenciadorDownload = GerenciadorDownload(idProva: id);
  }

  @observable
  ProvaRespostaStore respostas;

  @observable
  EnumDownloadStatus downloadStatus = EnumDownloadStatus.NAO_INICIADO;

  @observable
  EnumProvaStatus status = EnumProvaStatus.NAO_INICIADA;

  @observable
  double tempoPrevisto = 0;

  @observable
  double progressoDownload = 0;

  @observable
  String icone = AssetsUtil.iconeProva;

  @observable
  ProvaTempoExecucaoStore? tempoExecucaoStore;

  @action
  iniciarDownload() async {
    downloadStatus = EnumDownloadStatus.BAIXANDO;

    await gerenciadorDownload.configure();

    gerenciadorDownload.onStatusChange((downloadStatus, progressoDownload) {
      this.downloadStatus = downloadStatus;
      this.progressoDownload = progressoDownload;
    });

    gerenciadorDownload.onTempoPrevistoChange((tempoPrevisto) {
      this.tempoPrevisto = tempoPrevisto;
    });

    await gerenciadorDownload.startDownload();

    prova = await gerenciadorDownload.getProva();
  }

  setupReactions() {
    _reactions = [
      reaction((_) => downloadStatus, onStatusChange),
      reaction((_) => conexaoStream.value, onChangeConexao),
    ];
  }

  dispose() {
    for (var _reaction in _reactions) {
      _reaction();
    }
  }

  @action
  Future onChangeConexao(ConnectivityResult? resultado) async {
    if (downloadStatus == EnumDownloadStatus.CONCLUIDO) {
      return;
    }

    if (resultado != ConnectivityResult.none) {
      iniciarDownload();
    } else {
      downloadStatus = EnumDownloadStatus.PAUSADO;
      gerenciadorDownload.pause();
    }
  }

  @action
  onStatusChange(EnumDownloadStatus statusDownload) {
    switch (statusDownload) {
      case EnumDownloadStatus.NAO_INICIADO:
      case EnumDownloadStatus.CONCLUIDO:
        icone = AssetsUtil.iconeProva;
        break;
      case EnumDownloadStatus.BAIXANDO:
        icone = AssetsUtil.iconeProvaDownload;
        break;
      case EnumDownloadStatus.ERRO:
      case EnumDownloadStatus.PAUSADO:
        icone = AssetsUtil.iconeProvaErroDownload;
        break;
    }
  }

  @action
  iniciarProva() async {
    setStatusProva(EnumProvaStatus.INICIADA);

    await GetIt.I.get<ApiService>().prova.setStatusProva(idProva: id, status: EnumProvaStatus.INICIADA.index);

    _configurarTempoExecucao();

    await saveProva();
  }

  /// Configura o tempo de execução da prova
  _configurarTempoExecucao() {
    tempoExecucaoStore = ProvaTempoExecucaoStore(
      // TODO definir o horario da prova e salvar
      dataHoraInicioProva: DateTime.now(),
      duracaoProva: Duration(
        seconds: prova.questoes.length,
      ),
    );
    tempoExecucaoStore!.iniciarProva();
  }

  @action
  setStatusProva(EnumProvaStatus provaStatus) {
    prova.status = provaStatus;
    status = provaStatus;
  }

  saveProva() async {
    SharedPreferences prefs = GetIt.I.get();

    await prefs.setString('prova_${prova.id}', jsonEncode(prova.toJson()));
  }

  @action
  Future<bool> finalizarProva(BuildContext context) async {
    try {
      ConnectivityResult resultado = await (Connectivity().checkConnectivity());

      if (resultado == ConnectivityResult.none) {
        // Se estiver sem internet alterar status para pendente (worker ira sincronizar)

        setStatusProva(EnumProvaStatus.PENDENTE);
        await saveProva();

        var retorno = await mostrarDialogSemInternet(context);
        return retorno ?? false;
      } else {
        // Atualiza para finalizada
        setStatusProva(EnumProvaStatus.FINALIZADA);
        await saveProva();

        await SincronizarRespostasWorker().sincronizar();

        // Sincroniza com a api
        var response = await GetIt.I.get<ApiService>().prova.setStatusProva(
              idProva: id,
              status: EnumProvaStatus.FINALIZADA.index,
            );

        if (response.isSuccessful) {
          var retorno = await mostrarDialogProvaEnviada(context);
          return retorno ?? false;
        } else {
          switch (response.statusCode) {
            case 411:
              // Remove prova do cache
              SharedPreferences prefs = ServiceLocator.get();
              await prefs.remove('prova_${prova.id}');

              // Remove respostas da prova do cache
              for (var questoes in prova.questoes) {
                await prefs.remove('resposta_${questoes.id}');
              }

              mostrarDialogProvaJaEnviada(context);
              break;
          }
        }
      }

      return true;
    } catch (e) {
      severe(e);
      return false;
    }
  }

  @override
  onDispose() {
    tempoExecucaoStore?.onDispose();
  }
}
