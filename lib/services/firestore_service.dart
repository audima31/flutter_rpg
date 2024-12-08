import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/characters.dart';

class FirestoreService {
//Untuk menghubungkan ke Firebasenya
  static final db =
      FirebaseFirestore.instance.collection('characters').withConverter(
            //Mengambil data dari Firestore, menggunakan function dari factory Character.fromFirestore di characters.dart
            fromFirestore: Character.fromFirestore,
            //Mengirim data dari Flutter ke Firebase
            toFirestore: (Character c, _) => c.toFirestore(),
          );
  //Kenapa tidak menggunakan, db.add() db.remove() db.update() ?
  //Karena sudah menggunakan withConverter(fromFirestore dan toFirestore), dan dihubungkan dengan function dari factory Character.fromFirestore di characters.dart
  //Kalau ingin menggunakan db.add(), itu dilakukan kalo secara manual dan hal ini kurang efektif

  //get charachter data (once)
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    //Akan mengembalikan data dalam bentuk QuerySnapshot dan menggunakan factory Character.fromFirestore
    //Character.fromFirestore itu diambil dari factory Character.fromFirestore di characters.dart
    //Fungsi dari factory Character.fromFirestore di characters.dart adalah berisikan logic untuk mengambil data dari Firestore
    return db.get();
  }

  //add a new character
  //void karena fuction tidak mengembalikan data , sedangkan function Get akan mengembalikan data
  static Future<void> addCharacter(Character character) async {
    await db.doc(character.id).set(character);
  }

  //update a character
  static Future<void> updateCharacter(Character character) async {
    try {
      await db.doc(character.id).update({
        'stats': character.statsAsMap,
        'points': character.points,
        'skills': character.skills.map((skill) => skill.id).toList(),
        'isFav': character.isFav,
      });
      print('Data berhasil diperbarui');
    } catch (e) {
      print('Gagal memperbarui data: $e');
      rethrow; // Melempar ulang exception jika perlu ditangani di tingkat pemanggil
    }
  }

  //delete a character
  static Future<void> deleteCharacter(Character character) async {
    await db.doc(character.id).delete();
  }
}
