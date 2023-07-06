import 'package:rest_test/Model/character.dart';
import 'package:rest_test/rest_test.dart';

void main(List<String> arguments) async {
  Character? test1Http = await fetchSingleCharacterHttp();
  print("SINGLE Character from http package");
  print(test1Http.toString());
  Character? test1Dio = await fetchSingleCharacterDio();
  print("SINGLE Character from dio package");
  print(test1Dio.toString());
  List<Character>? testMultiHttp = await fetchMultipleCharacterHttp();
  print("MULTIPLE Character from http package");
  testMultiHttp?.forEach((character) {
    print(character.toString());
  });
  List<Character>? testMultiDio = await fetchMultipleCharacterDio();
  print("MULTIPLE Character from dio package");
  testMultiDio?.forEach((character) {
    print(character.toString());
  });
  List<Character>? testAllHttp = await fetchAllCharactersHttp(1);
  print("All Character from http package");
  testAllHttp?.forEach((character) {
    print(character.toString());
  });
  List<Character>? testAllDio = await fetchAllCharactersDio(1);
  print("All Character from dio package");
  testAllDio?.forEach((character) {
    print(character.toString());
  });
}
