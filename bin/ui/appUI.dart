import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import '../models/Tarea.dart';
import '../services/TareaService.dart';
import 'package:intl/intl.dart';

class AppManager {
  Tareaservice _service;
  AppManager(this._service);

  void initUI() {
    menu();
  }

  void menu() {
    String op;
    do {
      print('----------------------------');
      print(" Sistema de gestión de Tareas en Dart");
      print('----------------------------');
      print("1. Crear Tarea");
      print("2. Listar Tareas");
      print("3. Eliminar Tarea");
      print("4. Marcar Tarea como completada");
      print("5. Salir");
      print('----------------------------');
      print("Ingrese una opción");
      op = stdin.readLineSync()!;
      switch (op) {
        case "1":
          var tareaToSave = readTarea();
          _service.addTarea(tareaToSave);
          break;
        case "2":
          printTareas(_service.getTareas());
          break;
        case "3":
          int idToDelete = deleteTarea();
          _service.deleteTarea(idToDelete);
          break;
        case "":
          int idToComplete = completeTarea();
          _service.completeTrea(idToComplete);
          break;
        case "5":
          exit(0);
          break;
        default:
          print("\nOpción inválida\n");
          break;
      }
    } while (op != 5);
  }

  void printTareas(List<Tarea> tareas) {
    if(tareas.isEmpty) 
    {
      print("\nNo hay tareas\n");
      return;
    }
    print("\n");
    for (var element in tareas) {
      printTarea(element);
    }
    print("\n");
  }

  void printTarea(Tarea tarea) {
    print(
        "Id : ${tarea.id} | Título : ${tarea.titulo} | Descripción : ${tarea.descripcion} | Vencimiento : ${DateFormat('yyyy-MM-dd').format(tarea.fechaVencimiento)} | Completada : ${tarea.completado?'Completa':'Pendiente'}");
  }

  Tarea readTarea() {
    print("Ingrese el título de la tarea");
    String title = stdin.readLineSync()!;
    print("Ingrese la descripción de la tarea");
    String description = stdin.readLineSync()!;

    return new Tarea(
        null, title, description, DateTime.now().add(const Duration(days: 15)));
  }

  int deleteTarea() {
    print("Ingrese el id de la tarea a eliminar");
    int? result = int.tryParse(stdin.readLineSync()!);
    while(result == null) {
      print("Id inválido");
      print("Ingrese el id de la tarea a eliminar");
      result = int.tryParse(stdin.readLineSync()!);
    }
    return result;
  }

  int completeTarea() {
    print("Ingrese el id de la tarea a completar");
    int? result = int.tryParse(stdin.readLineSync()!);
    while(result == null) {
      print("Id inválido");
      print("Ingrese el id de la tarea a completar");
      result = int.tryParse(stdin.readLineSync()!);
    }
    return result;
  }
}
