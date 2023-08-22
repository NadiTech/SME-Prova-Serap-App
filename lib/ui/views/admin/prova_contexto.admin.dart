import 'package:appserap/main.ioc.dart';
import 'package:appserap/main.route.gr.dart';
import 'package:appserap/stores/admin_prova_contexto.store.dart';
import 'package:appserap/ui/widgets/apresentacao/apresentacao_contexto.admin.widget.dart';
import 'package:appserap/utils/tema.util.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

@RoutePage()
class AdminProvaContextoView extends StatefulWidget {
  final int idProva;
  final bool possuiBIB;
  AdminProvaContextoView({
    Key? key,
    @PathParam('idProva')  required this.idProva,
    @PathParam('possuiBIB') required this.possuiBIB,
  }) : super(key: key);

  @override
  State<AdminProvaContextoView> createState() => _AdminProvaContextoViewState();
}

class _AdminProvaContextoViewState extends State<AdminProvaContextoView> {
  var store = sl<AdminProvaContextoViewStore>();

  @override
  void initState() {
    super.initState();
    store.carregarContexto(widget.idProva);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: TemaUtil.corDeFundo,
        body: Padding(
          padding: getPadding(),
          child: Observer(
            builder: (_) {
              if (store.carregando) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ApresentacaoContextoAdminWidget(
                listaDePaginasContexto: store.contextosProva,
                textoBotaoAvancar: "PRÓXIMA DICA",
                textoBotaoPular: "IR PARA A PROVA",
                regraMostrarTodosOsBotoesAoIniciar: false,
                regraMostrarApenasBotaoPoximo: true,
                onDone: () {
                  if (widget.possuiBIB) {
                    context.router.push(AdminProvaCadernoViewRoute(idProva: widget.idProva));
                  } else {
                    context.router.push(AdminProvaResumoViewRoute(idProva: widget.idProva));
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  EdgeInsets getPadding([EdgeInsets mobile = EdgeInsets.zero]) {
    if (kIsWeb) {
      return EdgeInsets.symmetric(
        horizontal: (MediaQuery.of(context).size.width - 600 - (24 * 2)) / 2,
      );
    } else {
      return mobile;
    }
  }
}
