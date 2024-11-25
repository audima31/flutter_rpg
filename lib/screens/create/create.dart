import 'package:flutter/material.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Create New Character"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.code,
                color: AppColors.primaryAccent,
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: StyledHeading('Welcome, new players!'),
            ),
            const Center(
              child: const StyledText(
                  'Create a name & slogan for your character. '),
            ),
            const SizedBox(
              height: 30,
            ),

// INPUT FOR NAME AND SLOGAN -----------------
            const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character name')),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character slogan')),
            )
          ],
        ),
      ),
    );
  }
}
