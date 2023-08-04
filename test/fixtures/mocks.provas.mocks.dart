// Mocks generated by Mockito 5.4.2 from annotations
// in appserap/test/fixtures/mocks.provas.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:appserap/dtos/prova.response.dto.dart' as _i5;
import 'package:appserap/dtos/prova_anterior.response.dto.dart' as _i9;
import 'package:appserap/dtos/prova_detalhes.response.dto.dart' as _i6;
import 'package:appserap/dtos/prova_detalhes_caderno.response.dto.dart' as _i7;
import 'package:appserap/dtos/questao_resposta.dto.dart' as _i11;
import 'package:appserap/dtos/questao_resposta.response.dto.dart' as _i8;
import 'package:appserap/services/rest/prova.service.dart' as _i3;
import 'package:appserap/services/rest/questao_resposta.service.dart' as _i10;
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
  _FakeChopperClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeType_1 extends _i1.SmartFake implements Type {
  _FakeType_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2<BodyType> extends _i1.SmartFake
    implements _i2.Response<BodyType> {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProvaService].
///
/// See the documentation for Mockito's code generation for more information.
class MockProvaService extends _i1.Mock implements _i3.ProvaService {
  MockProvaService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ChopperClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeChopperClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.ChopperClient);
  @override
  set client(_i2.ChopperClient? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Type get definitionType => (super.noSuchMethod(
        Invocation.getter(#definitionType),
        returnValue: _FakeType_1(
          this,
          Invocation.getter(#definitionType),
        ),
      ) as Type);
  @override
  _i4.Future<_i2.Response<List<_i5.ProvaResponseDTO>>> getProvas() =>
      (super.noSuchMethod(
        Invocation.method(
          #getProvas,
          [],
        ),
        returnValue: _i4.Future<_i2.Response<List<_i5.ProvaResponseDTO>>>.value(
            _FakeResponse_2<List<_i5.ProvaResponseDTO>>(
          this,
          Invocation.method(
            #getProvas,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Response<List<_i5.ProvaResponseDTO>>>);
  @override
  _i4.Future<_i2.Response<_i6.ProvaDetalhesResponseDTO>> getResumoProva(
          {required int? idProva}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getResumoProva,
          [],
          {#idProva: idProva},
        ),
        returnValue:
            _i4.Future<_i2.Response<_i6.ProvaDetalhesResponseDTO>>.value(
                _FakeResponse_2<_i6.ProvaDetalhesResponseDTO>(
          this,
          Invocation.method(
            #getResumoProva,
            [],
            {#idProva: idProva},
          ),
        )),
      ) as _i4.Future<_i2.Response<_i6.ProvaDetalhesResponseDTO>>);
  @override
  _i4.Future<
      _i2.Response<_i7.ProvaDetalhesCadernoResponseDTO>> getResumoProvaCaderno({
    required int? idProva,
    required String? caderno,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getResumoProvaCaderno,
          [],
          {
            #idProva: idProva,
            #caderno: caderno,
          },
        ),
        returnValue:
            _i4.Future<_i2.Response<_i7.ProvaDetalhesCadernoResponseDTO>>.value(
                _FakeResponse_2<_i7.ProvaDetalhesCadernoResponseDTO>(
          this,
          Invocation.method(
            #getResumoProvaCaderno,
            [],
            {
              #idProva: idProva,
              #caderno: caderno,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response<_i7.ProvaDetalhesCadernoResponseDTO>>);
  @override
  _i4.Future<_i2.Response<int>> getStatusProva({required int? idProva}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStatusProva,
          [],
          {#idProva: idProva},
        ),
        returnValue: _i4.Future<_i2.Response<int>>.value(_FakeResponse_2<int>(
          this,
          Invocation.method(
            #getStatusProva,
            [],
            {#idProva: idProva},
          ),
        )),
      ) as _i4.Future<_i2.Response<int>>);
  @override
  _i4.Future<_i2.Response<bool>> setStatusProva({
    required int? idProva,
    required int? status,
    required int? tipoDispositivo,
    int? dataInicio,
    int? dataFim,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStatusProva,
          [],
          {
            #idProva: idProva,
            #status: status,
            #tipoDispositivo: tipoDispositivo,
            #dataInicio: dataInicio,
            #dataFim: dataFim,
          },
        ),
        returnValue: _i4.Future<_i2.Response<bool>>.value(_FakeResponse_2<bool>(
          this,
          Invocation.method(
            #setStatusProva,
            [],
            {
              #idProva: idProva,
              #status: status,
              #tipoDispositivo: tipoDispositivo,
              #dataInicio: dataInicio,
              #dataFim: dataFim,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response<bool>>);
  @override
  _i4.Future<_i2.Response<List<_i8.QuestaoRespostaResponseDTO>>>
      getRespostasPorProvaId({required int? idProva}) => (super.noSuchMethod(
            Invocation.method(
              #getRespostasPorProvaId,
              [],
              {#idProva: idProva},
            ),
            returnValue: _i4.Future<
                    _i2.Response<List<_i8.QuestaoRespostaResponseDTO>>>.value(
                _FakeResponse_2<List<_i8.QuestaoRespostaResponseDTO>>(
              this,
              Invocation.method(
                #getRespostasPorProvaId,
                [],
                {#idProva: idProva},
              ),
            )),
          ) as _i4.Future<_i2.Response<List<_i8.QuestaoRespostaResponseDTO>>>);
  @override
  _i4.Future<_i2.Response<List<_i9.ProvaAnteriorResponseDTO>>>
      getProvasAnteriores() => (super.noSuchMethod(
            Invocation.method(
              #getProvasAnteriores,
              [],
            ),
            returnValue: _i4
                .Future<_i2.Response<List<_i9.ProvaAnteriorResponseDTO>>>.value(
                _FakeResponse_2<List<_i9.ProvaAnteriorResponseDTO>>(
              this,
              Invocation.method(
                #getProvasAnteriores,
                [],
              ),
            )),
          ) as _i4.Future<_i2.Response<List<_i9.ProvaAnteriorResponseDTO>>>);
}

/// A class which mocks [QuestaoRespostaService].
///
/// See the documentation for Mockito's code generation for more information.
class MockQuestaoRespostaService extends _i1.Mock
    implements _i10.QuestaoRespostaService {
  MockQuestaoRespostaService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ChopperClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeChopperClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.ChopperClient);
  @override
  set client(_i2.ChopperClient? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Type get definitionType => (super.noSuchMethod(
        Invocation.getter(#definitionType),
        returnValue: _FakeType_1(
          this,
          Invocation.getter(#definitionType),
        ),
      ) as Type);
  @override
  _i4.Future<_i2.Response<_i8.QuestaoRespostaResponseDTO>>
      getRespostaPorQuestaoId({required int? questaoId}) => (super.noSuchMethod(
            Invocation.method(
              #getRespostaPorQuestaoId,
              [],
              {#questaoId: questaoId},
            ),
            returnValue:
                _i4.Future<_i2.Response<_i8.QuestaoRespostaResponseDTO>>.value(
                    _FakeResponse_2<_i8.QuestaoRespostaResponseDTO>(
              this,
              Invocation.method(
                #getRespostaPorQuestaoId,
                [],
                {#questaoId: questaoId},
              ),
            )),
          ) as _i4.Future<_i2.Response<_i8.QuestaoRespostaResponseDTO>>);
  @override
  _i4.Future<_i2.Response<bool>> postResposta({
    required String? chaveAPI,
    required List<_i11.QuestaoRespostaDTO>? respostas,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #postResposta,
          [],
          {
            #chaveAPI: chaveAPI,
            #respostas: respostas,
          },
        ),
        returnValue: _i4.Future<_i2.Response<bool>>.value(_FakeResponse_2<bool>(
          this,
          Invocation.method(
            #postResposta,
            [],
            {
              #chaveAPI: chaveAPI,
              #respostas: respostas,
            },
          ),
        )),
      ) as _i4.Future<_i2.Response<bool>>);
}
