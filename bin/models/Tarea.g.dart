// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tarea.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tarea _$TareaFromJson(Map<String, dynamic> json) => Tarea(
      (json['id'] as num?)?.toInt(),
      json['titulo'] as String,
      json['descripcion'] as String,
      DateTime.parse(json['fechaVencimiento'] as String),
    )..completado = json['completado'] as bool;

Map<String, dynamic> _$TareaToJson(Tarea instance) => <String, dynamic>{
      'id': instance.id,
      'titulo': instance.titulo,
      'descripcion': instance.descripcion,
      'fechaVencimiento': instance.fechaVencimiento.toIso8601String(),
      'completado': instance.completado,
    };
