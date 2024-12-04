import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/models/vacation.dart';

//Center Data Store
class CharacterStore extends ChangeNotifier {
  //Define global state
  final List<Character> _characters = [
    Character(
      id: '1',
      name: 'John Doe',
      vocation: Vocation.ninja,
      slogan: 'Ninja!',
    ),
    Character(
      id: '2',
      name: 'Jonny',
      vocation: Vocation.wizard,
      slogan: 'Kapumf!',
    ),
    Character(
      id: '3',
      name: 'Klara',
      vocation: Vocation.junkie,
      slogan: 'Light me up!',
    ),
    Character(
      id: '4',
      name: 'Crimson',
      vocation: Vocation.raider,
      slogan: 'Fire in the hole!',
    ),
  ];

  get characters => _characters;

  // add character
  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }

// save (update) character

// remove character

// initially fetch character
}
