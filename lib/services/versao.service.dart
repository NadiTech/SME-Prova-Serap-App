import 'package:appserap/utils/api.util.dart';
import 'package:get_it/get_it.dart';

class VersaoService {
  final _api = GetIt.I.get<ApiUtil>();

  Future<String> obterVersaoDoApp() async {
    var versao = "Versão: 0";
    try {
      final response = await _api.dio.get('/v1/versoes/front');
      if (response.statusCode == 200) {
        versao = response.data.toString();
      }
    } catch (e) {
      print(e);
    }
    return versao;
  }
}
