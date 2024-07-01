import 'dart:io';
import 'dart:convert';
import '../models/Tarea.dart';

class Tareaservice {
  String _path;
  Tareaservice(this._path);

  bool addTarea(Tarea? tarea) {
    if (tarea == null) return false;
    var listaTareas = getTareas();
    if (listaTareas.any((e) => (e.titulo == tarea.titulo))) {
      print("La tarea ya existe");
      return false;
    }
    tarea.id = getIndexCount() + 1;
    listaTareas.add(tarea);

    var result = saveTareas(listaTareas);
    if (!result) return false;
    return true;
  }

  List<Tarea> getTareas() {
    File file = File(_path);
    List<dynamic> jsonData = jsonDecode(file.readAsStringSync());
    return jsonData.map((jsonData) => Tarea.fromJson(jsonData)).toList();
  }

  bool saveTareas(List<Tarea> listaTareas) {
    try {
      File file = new File(_path);
      file.writeAsStringSync(
          jsonEncode(listaTareas.map((element) => element.toJson()).toList()),
          mode: FileMode.write);
      return true;
    } catch (e) {
      print("error al agregar tarea, exception: $e");
      return false;
    }
  }

  void initFile() {
    File file = File(_path);
    var result = file.existsSync();
    if (result) {
      return;
    }
    List<Map<String, dynamic>> tareas = [];
    file.writeAsStringSync(jsonEncode(tareas));
  }

  int getIndexCount() {
    var tareas = getTareas();
    if (tareas.isEmpty) {
      return -1;
    }
    return tareas.indexOf(tareas.last);
  }

  bool deleteTarea(int id) {
    List<Tarea> tareas = getTareas();
    tareas.removeWhere((element) => element.id == id);

    return saveTareas(tareas);
  }

  Tarea getTarea(int id) {
    var tareas = getTareas();
    return tareas.firstWhere((e) => e.id == id);
  }

  void completeTrea(int id) {
    var tareas = getTareas();
    var tarea =tareas.firstWhere((e) => e.id == id);
    tarea.completado = true;

    saveTareas(tareas);
  }
}
