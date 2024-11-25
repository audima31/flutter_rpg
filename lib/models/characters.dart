import 'package:flutter_rpg/models/skills.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vacation.dart';

class Character with Stats {
  //constructor
  Character({
    required this.name,
    required this.id,
    required this.vocation,
    required this.slogan,
  });

  // Field
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String id;
  final String slogan;
  bool _isFav = false;

// getters berguna untuk mengambil data dari class or mixin
// Dengan menggunakan get, dapet mengakses nilai yang private, tetapi tidak bisa diubah
  bool get isFav => _isFav;

//methode
  void toogleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

//dummy character data
List<Character> characters = [
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
