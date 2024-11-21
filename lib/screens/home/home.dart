import 'package:flutter/material.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Characters List :'),
              const StyledHeading('Characeter list'),
              const StyledTitle('Character Name'),
              FilledButton(
                onPressed: () {},
                child: const Text("Select Character"),
              )
            ],
          ),
        ));
  }
}
