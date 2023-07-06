import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'Model/character.dart';
import 'Model/location.dart';
import 'Model/origin.dart';

Future<Character?> fetchSingleCharacterHttp() async {
  try {
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character/3'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Character(
        id: jsonData['id'],
        name: jsonData['name'],
        status: jsonData['status'],
        species: jsonData['species'],
        type: jsonData['type'],
        gender: jsonData['gender'],
        origin: Origin(
          name: jsonData['origin']['name'],
          url: jsonData['origin']['url'],
        ),
        location: Location(
          name: jsonData['location']['name'],
          url: jsonData['location']['url'],
        ),
        image: jsonData['image'],
        episode: List<String>.from(jsonData['episode']),
        url: jsonData['url'],
        created: jsonData['created'],
      );
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
      return Character(
        id: jsonData['id'],
        name: jsonData['name'],
        status: jsonData['status'],
        species: jsonData['species'],
        type: jsonData['type'],
        gender: jsonData['gender'],
        origin: Origin(
          name: jsonData['origin']['name'],
          url: jsonData['origin']['url'],
        ),
        location: Location(
          name: jsonData['location']['name'],
          url: jsonData['location']['url'],
        ),
        image: jsonData['image'],
        episode: List<String>.from(jsonData['episode']),
        url: jsonData['url'],
        created: jsonData['created'],
      );
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
        resultList.add(Character(
          id: character['id'],
          name: character['name'],
          status: character['status'],
          species: character['species'],
          type: character['type'],
          gender: character['gender'],
          origin: Origin(
            name: character['origin']['name'],
            url: character['origin']['url'],
          ),
          location: Location(
            name: character['location']['name'],
            url: character['location']['url'],
          ),
          image: character['image'],
          episode: List<String>.from(character['episode']),
          url: character['url'],
          created: character['created'],
        ));
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
        resultList.add(Character(
          id: character['id'],
          name: character['name'],
          status: character['status'],
          species: character['species'],
          type: character['type'],
          gender: character['gender'],
          origin: Origin(
            name: character['origin']['name'],
            url: character['origin']['url'],
          ),
          location: Location(
            name: character['location']['name'],
            url: character['location']['url'],
          ),
          image: character['image'],
          episode: List<String>.from(character['episode']),
          url: character['url'],
          created: character['created'],
        ));
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
        resultList.add(Character(
          id: character['id'],
          name: character['name'],
          status: character['status'],
          species: character['species'],
          type: character['type'],
          gender: character['gender'],
          origin: Origin(
            name: character['origin']['name'],
            url: character['origin']['url'],
          ),
          location: Location(
            name: character['location']['name'],
            url: character['location']['url'],
          ),
          image: character['image'],
          episode: List<String>.from(character['episode']),
          url: character['url'],
          created: character['created'],
        ));
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
        resultList.add(Character(
          id: character['id'],
          name: character['name'],
          status: character['status'],
          species: character['species'],
          type: character['type'],
          gender: character['gender'],
          origin: Origin(
            name: character['origin']['name'],
            url: character['origin']['url'],
          ),
          location: Location(
            name: character['location']['name'],
            url: character['location']['url'],
          ),
          image: character['image'],
          episode: List<String>.from(character['episode']),
          url: character['url'],
          created: character['created'],
        ));
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
