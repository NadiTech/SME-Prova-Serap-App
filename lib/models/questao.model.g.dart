// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questao.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questao _$QuestaoFromJson(Map<String, dynamic> json) => Questao(
      id: json['id'] as int,
      titulo: json['titulo'] as String?,
      descricao: json['descricao'] as String,
      tipo: $enumDecode(_$EnumTipoQuestaoEnumMap, json['tipo']),
      quantidadeAlternativas: json['quantidadeAlternativas'] as int,
      caderno: json['caderno'] as String,
    );

Map<String, dynamic> _$QuestaoToJson(Questao instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descricao': instance.descricao,
      'tipo': _$EnumTipoQuestaoEnumMap[instance.tipo]!,
      'quantidadeAlternativas': instance.quantidadeAlternativas,
      'caderno': instance.caderno,
    };

const _$EnumTipoQuestaoEnumMap = {
  EnumTipoQuestao.NAO_CADASTRADO: 0,
  EnumTipoQuestao.MULTIPLA_ESCOLHA: 1,
  EnumTipoQuestao.RESPOSTA_CONTRUIDA: 2,
};
