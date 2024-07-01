/*
Ejercicio 1: Revertir Palabras en una Cadena

Escribe una función que tome una cadena y revierta las palabras en la cadena, manteniendo el orden de las palabras originales.

Entrada: "Hello World from Dart"
Salida: "olleH dlroW morf traD"
 */

String ReverseWords(String input) {
  List<String> list = input.split('');
  print(list);
  String result = list.reversed.toString();
  print(result);
  result = result.replaceAll("(", '');
  result = result.replaceAll(")", '');
  result = result.replaceAll(", ", '');
  return result;
}

String ReverseWordsWithArrays(String input) {
  var list = input.split('').reversed.toList();
  String result = '';
  for (int i = list.length - 1; i >= 0; i--) {
    result = list[i] + result;
  }
  return result;
}

/*
Ejercicio 2: Encontrar Palabras Palíndromas

Escribe una función que identifique y devuelva todas las palabras palíndromas en una cadena dada.

Entrada: "Madam Arora teaches malayalam"
Salida: ["Madam", "Arora", "malayalam"]
 */

List<String> findPalindromesb2(String input) {
  List<String> inputSplited = input.split(' ');
  List<String> palindromes = [];
  inputSplited.forEach((element) {
    if (isPalindrome(element)) palindromes.add(element);
  });
  return palindromes;
}

bool isPalindrome(String input) {
  int count = input.length % 2 == 0 ? (input.length ~/ 2) : (input.length ~/ 2);
  for (int i = 0; i < count; i++) {
    if (!(input[i].toLowerCase() ==
        input[input.length - 1 - i].toLowerCase())) {
      return false;
    }
  }
  return true;
}

List<String> findPalindromes(String input) {
  return input.split(' ').where((word) {
    String lowerWord = word.toLowerCase();
    return lowerWord == lowerWord.split('').reversed.join('');
  }).toList();
}

Map<String, int> charFrequency(String input) {
  Map<String, int> frequency = {};
  for (var char in input.split('')) {
    frequency[char] = (frequency[char] ?? 0) + 1;
  }
  return frequency;
}
