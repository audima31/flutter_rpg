import 'package:cloud_firestore/cloud_firestore.dart';
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

  //Character to Firestore (map)
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((skill) => skill.id).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  //Character from Firestore (map)
  factory Character.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    //Get data from snapshot
    final data = snapshot.data()!;

    //make character instance
    Character character = Character(
      id: snapshot.id,
      name: data['name'],
      vocation:
          Vocation.values.firstWhere((v) => v.toString() == data['vocation']),
      slogan: data['slogan'],
    );

    //update skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkill(skill);
    }

    //set isFav
    if (data['isFav'] == true) {
      character.toogleIsFav();
    }

    //assign stats & points (setStats dikirim ke stats.dart)
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}

//dummy character data
// List<Character> characters = [
//   Character(
//     id: '1',
//     name: 'John Doe',
//     vocation: Vocation.ninja,
//     slogan: 'Ninja!',
//   ),
//   Character(
//     id: '2',
//     name: 'Jonny',
//     vocation: Vocation.wizard,
//     slogan: 'Kapumf!',
//   ),
//   Character(
//     id: '3',
//     name: 'Klara',
//     vocation: Vocation.junkie,
//     slogan: 'Light me up!',
//   ),
//   Character(
//     id: '4',
//     name: 'Crimson',
//     vocation: Vocation.raider,
//     slogan: 'Fire in the hole!',
//   ),
// ];
