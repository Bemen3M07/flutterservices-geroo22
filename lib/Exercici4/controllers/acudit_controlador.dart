// lib/controllers/acudit_controlador.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/acudit.dart';
import 'dart:math';

class JokeController {
  static const String apiUrl = "https://api.sampleapis.com/jokes/goodJokes";

  Future<Joke> fetchJoke() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jokes = jsonDecode(response.body);
      if (jokes.isNotEmpty) {
        final randomIndex = Random().nextInt(jokes.length); // 🔥 Triem un index aleatori
        final randomJoke = jokes[randomIndex];
        return Joke.fromJson(randomJoke);
      }
    }
    throw Exception("No s'ha pogut carregar l'acudit");
  }
}