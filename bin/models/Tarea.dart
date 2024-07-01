import 'package:json_annotation/json_annotation.dart';

part 'Tarea.g.dart';

@JsonSerializable()
class Tarea {
  int? id;
  String titulo;
  String descripcion;
  DateTime fechaVencimiento;
  bool completado = false;
  String get getTitulo => this.titulo;
  get getId => this.id;

  set setId(id) => this.id = id;

  set setTitulo(titulo) => this.titulo = titulo;

  get getDescripcion => this.descripcion;

  set setDescripcion(descripcion) => this.descripcion = descripcion;

  get getFechaVencimiento => this.fechaVencimiento;

  set setFechaVencimiento(fechaVencimiento) =>
      this.fechaVencimiento = fechaVencimiento;

  get getCompletado => this.completado;

  set setCompletado(completado) => this.completado = completado;

  Tarea(this.id, this.titulo, this.descripcion, this.fechaVencimiento);

  factory Tarea.fromJson(Map<String, dynamic> json) => _$TareaFromJson(json);

  Map<String, dynamic> toJson() => _$TareaToJson(this);
}
