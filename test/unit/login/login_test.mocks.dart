// Mocks generated by Mockito 5.3.0 from annotations
// in appserap/test/unit/login/login_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appserap/services/api.dart' as _i3;
import 'package:appserap/services/rest/admin.service.dart' as _i6;
import 'package:appserap/services/rest/auth.admin.service.dart' as _i7;
import 'package:appserap/services/rest/download.service.dart' as _i5;
import 'package:appserap/services/rest/log.service.dart' as _i8;
import 'package:appserap/services/rest/usuario.service.dart' as _i4;
import 'package:chopper/chopper.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeChopperClient_0 extends _i1.SmartFake implements _i2.ChopperClient {
  _FakeChopperClient_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAutenticacaoService_1 extends _i1.SmartFake
    implements _i3.AutenticacaoService {
  _FakeAutenticacaoService_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeProvaService_2 extends _i1.SmartFake implements _i3.ProvaService {
  _FakeProvaService_2(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeQuestaoService_3 extends _i1.SmartFake
    implements _i3.QuestaoService {
  _FakeQuestaoService_3(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAlternativaService_4 extends _i1.SmartFake
    implements _i3.AlternativaService {
  _FakeAlternativaService_4(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeArquivoService_5 extends _i1.SmartFake
    implements _i3.ArquivoService {
  _FakeArquivoService_5(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeVersaoService_6 extends _i1.SmartFake implements _i3.VersaoService {
  _FakeVersaoService_6(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeQuestaoRespostaService_7 extends _i1.SmartFake
    implements _i3.QuestaoRespostaService {
  _FakeQuestaoRespostaService_7(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeUsuarioService_8 extends _i1.SmartFake
    implements _i4.UsuarioService {
  _FakeUsuarioService_8(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeOrientacaoInicialService_9 extends _i1.SmartFake
    implements _i3.OrientacaoInicialService {
  _FakeOrientacaoInicialService_9(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeContextoProvaService_10 extends _i1.SmartFake
    implements _i3.ContextoProvaService {
  _FakeContextoProvaService_10(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeDownloadService_11 extends _i1.SmartFake
    implements _i5.DownloadService {
  _FakeDownloadService_11(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAdminService_12 extends _i1.SmartFake implements _i6.AdminService {
  _FakeAdminService_12(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeAutenticacaoAdminService_13 extends _i1.SmartFake
    implements _i7.AutenticacaoAdminService {
  _FakeAutenticacaoAdminService_13(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeLogService_14 extends _i1.SmartFake implements _i8.LogService {
  _FakeLogService_14(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i3.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ChopperClient get chopper => (super.noSuchMethod(
          Invocation.getter(#chopper),
          returnValue: _FakeChopperClient_0(this, Invocation.getter(#chopper)))
      as _i2.ChopperClient);
  @override
  _i3.AutenticacaoService get auth =>
      (super.noSuchMethod(Invocation.getter(#auth),
              returnValue:
                  _FakeAutenticacaoService_1(this, Invocation.getter(#auth)))
          as _i3.AutenticacaoService);
  @override
  _i3.ProvaService get prova => (super.noSuchMethod(Invocation.getter(#prova),
          returnValue: _FakeProvaService_2(this, Invocation.getter(#prova)))
      as _i3.ProvaService);
  @override
  _i3.QuestaoService get questao => (super.noSuchMethod(
          Invocation.getter(#questao),
          returnValue: _FakeQuestaoService_3(this, Invocation.getter(#questao)))
      as _i3.QuestaoService);
  @override
  _i3.AlternativaService get alternativa => (super.noSuchMethod(
          Invocation.getter(#alternativa),
          returnValue:
              _FakeAlternativaService_4(this, Invocation.getter(#alternativa)))
      as _i3.AlternativaService);
  @override
  _i3.ArquivoService get arquivo => (super.noSuchMethod(
          Invocation.getter(#arquivo),
          returnValue: _FakeArquivoService_5(this, Invocation.getter(#arquivo)))
      as _i3.ArquivoService);
  @override
  _i3.VersaoService get versao => (super.noSuchMethod(
          Invocation.getter(#versao),
          returnValue: _FakeVersaoService_6(this, Invocation.getter(#versao)))
      as _i3.VersaoService);
  @override
  _i3.QuestaoRespostaService get questaoResposta =>
      (super.noSuchMethod(Invocation.getter(#questaoResposta),
              returnValue: _FakeQuestaoRespostaService_7(
                  this, Invocation.getter(#questaoResposta)))
          as _i3.QuestaoRespostaService);
  @override
  _i4.UsuarioService get usuario => (super.noSuchMethod(
          Invocation.getter(#usuario),
          returnValue: _FakeUsuarioService_8(this, Invocation.getter(#usuario)))
      as _i4.UsuarioService);
  @override
  _i3.OrientacaoInicialService get orientacoesIniciais =>
      (super.noSuchMethod(Invocation.getter(#orientacoesIniciais),
              returnValue: _FakeOrientacaoInicialService_9(
                  this, Invocation.getter(#orientacoesIniciais)))
          as _i3.OrientacaoInicialService);
  @override
  _i3.ContextoProvaService get contextoProva =>
      (super.noSuchMethod(Invocation.getter(#contextoProva),
              returnValue: _FakeContextoProvaService_10(
                  this, Invocation.getter(#contextoProva)))
          as _i3.ContextoProvaService);
  @override
  _i5.DownloadService get download =>
      (super.noSuchMethod(Invocation.getter(#download),
              returnValue:
                  _FakeDownloadService_11(this, Invocation.getter(#download)))
          as _i5.DownloadService);
  @override
  _i6.AdminService get admin => (super.noSuchMethod(Invocation.getter(#admin),
          returnValue: _FakeAdminService_12(this, Invocation.getter(#admin)))
      as _i6.AdminService);
  @override
  _i7.AutenticacaoAdminService get adminAuth =>
      (super.noSuchMethod(Invocation.getter(#adminAuth),
              returnValue: _FakeAutenticacaoAdminService_13(
                  this, Invocation.getter(#adminAuth)))
          as _i7.AutenticacaoAdminService);
  @override
  _i8.LogService get log => (super.noSuchMethod(Invocation.getter(#log),
          returnValue: _FakeLogService_14(this, Invocation.getter(#log)))
      as _i8.LogService);
}
