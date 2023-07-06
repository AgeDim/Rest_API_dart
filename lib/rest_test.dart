import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'Model/character.dart';

Future<Character?> fetchSingleCharacterHttp() async {
  try {
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character/3'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Character.fromJson(jsonData);
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error fetching character: $error');
    return null;
  }
}

Future<Character?> fetchSingleCharacterDio() async {
  final dio = Dio();
  try {
    final response =
        await dio.get('https://rickandmortyapi.com/api/character/3');
    if (response.statusCode == 200) {
      final jsonData = response.data;
      return Character.fromJson(jsonData);
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error fetching character: $error');
    return null;
  }
}

Future<List<Character>?> fetchMultipleCharacterHttp() async {
  try {
    List<Character> resultList = [];
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character/1,183'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      for (final character in jsonData) {
        resultList.add(Character.fromJson(character));
      }
      return resultList;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error fetching character: $error');
    return null;
  }
}

Future<List<Character>?> fetchMultipleCharacterDio() async {
  final dio = Dio();
  List<Character> resultList = [];
  try {
    final response =
        await dio.get('https://rickandmortyapi.com/api/character/1,183');
    if (response.statusCode == 200) {
      final jsonData = response.data.toList();
      for (final character in jsonData) {
        resultList.add(Character.fromJson(character));
      }
      return resultList;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error fetching character: $error');
    return null;
  }
}

Future<List<Character>?> fetchAllCharactersHttp(int page) async {
  try {
    List<Character> resultList = [];
    final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      for (final character in jsonData['results']) {
        resultList.add(Character.fromJson(character));
      }
      return resultList;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error fetching character: $error');
    return null;
  }
}

Future<List<Character>?> fetchAllCharactersDio(int page) async {
  final dio = Dio();
  List<Character> resultList = [];
  try {
    final response =
        await dio.get('https://rickandmortyapi.com/api/character/?page=$page');
    if (response.statusCode == 200) {
      final jsonData = response.data;
      for (final character in jsonData['results']) {
        resultList.add(Character.fromJson(character));
      }
      return resultList;
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    print('Error fetching character: $error');
    return null;
  }
}
