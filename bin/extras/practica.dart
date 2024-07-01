import 'dart:ffi';
import 'dart:math' as mathLibrary;
import 'package:hello_dart/hello_dart.dart';
import 'package:hello_dart/Ejercicios.dart';

void principal() {
  print('Hello world: ${calculate()}!');

  print(ReverseWords('hola pepe'));

  print(ReverseWordsWithArrays("hola pepe"));

  print(findPalindromesb2("Madam Arora teaches malayalam"));
  print(findPalindromes("Madam Arora teaches malayalam"));

  var result = charFrequency("abracadabra");
  bool result2;
  result.forEach((key, value) {
    print("$key: $value");
  });

  mathLibrary.Rectangle r = mathLibrary.Rectangle(0, 0, 10, 10);
  print(r.left);
  Map<String, int> num = {'a': 0, 'b': 1};

  Function num2 = (key) => num[key] ?? 0;

  var dateNow = DateTime.now();
  dateNow.hour > 18
      ? print('Buenas noches! ${dateNow}')
      : print('Sigue siendo de dia');

  var lista = [1, 2, 3, 4, 5];
  lista.forEach((e) => {});

  //Instrucciones en cascada
  lista
    ..add(3)
    ..add(4);
  print(lista);

  print(lista);
  var resultMap = lista.map((p) => p * p);
  print(resultMap);
  throw new MyException();
}

void AddList(List<int> list) {
  list.add(3);
}

class Persona {
  String nombre;
  Persona hijo;
  String get getNombre => this.nombre;

  set setNombre(String nombre) => this.nombre = nombre;

  get getHijo => this.hijo;

  set setHijo(hijo) => this.hijo = hijo;
  Persona(this.nombre, this.hijo);
}

//funciones con argumentos nulos y no declarables obligatoriamente
void prueba(String nombre, [int? num]) {
  prueba("hola", null);
}

//funcion con argumento no posicional.
void prueba2(String nombre, {int? num}) {}

//My exceptions here
class MyException implements Exception {
  @override
  String toString() {
    return 'Error al ejecutar el programa';
  }
}
