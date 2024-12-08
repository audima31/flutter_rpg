import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/models/vacation.dart';
import 'package:flutter_rpg/services/firestore_service.dart';

//Center Data Store
class CharacterStore extends ChangeNotifier {
  //Global State
  final List<Character> _characters = [];

  get characters => _characters;

//CRUD dibawah berhubungan dengan function dari firestore_service.dart agar terhubung dengan firestore

  //fetch character
  void fetchCharactersOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }

      notifyListeners();
    }
  }

  // add character (create function) -
  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);

    _characters.add(character);
    notifyListeners();
  }

  // save (update) character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  // remove character
  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character);

    _characters.remove(character);
    notifyListeners();
  }
}
