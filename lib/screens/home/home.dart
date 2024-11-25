import 'package:flutter/material.dart';
import 'package:flutter_rpg/screens/home/character_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Your Characters"), centerTitle: true),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //KEK .map nya React
              Expanded(
                child: ListView.builder(
                  //characters dari data dummy yang ada di characters.dart
                  itemCount: characters.length,
                  itemBuilder: (_, index) {
                    return CharacterCard(characters[index]);
                  },
                ),
              ),
              StyledButton(
                onPressed: () {},
                child: const StyledHeading("Select Character"),
              )
            ],
          ),
        ));
  }
}
