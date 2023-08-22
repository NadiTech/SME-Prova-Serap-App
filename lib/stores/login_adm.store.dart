import 'package:appserap/interfaces/loggable.interface.dart';
import 'package:appserap/services/api.dart';
import 'package:appserap/stores/usuario.store.dart';
import 'package:appserap/utils/firebase.util.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_adm.store.g.dart';

@LazySingleton()
class LoginAdmStore = _LoginAdmStoreBase with _$LoginAdmStore;

abstract class _LoginAdmStoreBase with Store, Loggable {
  final AutenticacaoAdminService _autenticacaoAdminService;
  final UsuarioStore _usuarioStore;
  final SharedPreferences _sharedPreferences;

  _LoginAdmStoreBase(
    this._autenticacaoAdminService,
    this._usuarioStore,
    this._sharedPreferences,
  );

  Future<bool> loginByToken(String codigo) async {
    try {
      var responseLogin = await _autenticacaoAdminService.loginByCodigoAutenticacao(
        codigo: codigo,
      );

      if (responseLogin.isSuccessful) {
        var body = responseLogin.body!;
        _usuarioStore.token = body.token;
        _usuarioStore.tokenDataHoraExpiracao = body.dataHoraExpiracao;
        _usuarioStore.ultimoLogin = body.ultimoLogin;
        _usuarioStore.isAdmin = true;

        Map<String, dynamic> decodedToken = JwtDecoder.decode(body.token);

        _usuarioStore.atualizarDadosAdm(
          codigoEOL: decodedToken['LOGIN'],
          nome: decodedToken['NOME'],
          token: body.token,
          isAdmin: true,
        );

        await _sharedPreferences.setString('token', body.token);
        fine('Login realizado com sucesso');
        fine('Token: ${body.token}');

        return true;
      }
    } catch (e, stack) {
      await recordError(e, stack, reason: "Erro ao realiar o login");
    }

    return false;
  }
}
