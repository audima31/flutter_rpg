import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/vacation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  //INPUT FORM HANDLER -----------------------------------------------------------
  //Controller untuk mengambil data input
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  //Fungsi dispose untuk memastikan agar data yang diterima akan hilang, jika sudah tidak diakses lagi, dengan tujuan untuk membuat aplikasi memiliki memeori yang efektif
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  //Handling vocation selection
  Vocation selectedVocation = Vocation.raider;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  //Submit handler
  void handleSubmit() {
    //trim() untuk menghapus semua spasi di awal dan akhir
    if (_nameController.text.trim().isEmpty) {
      print('name must not be empty');
      return;
    }

    if (_sloganController.text.trim().isEmpty) {
      print('slogan must not be empty');
      return;
    }
    print(_nameController.text);
    print(_sloganController.text);
  }
  //END INPUT FORM HANDLER -----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Create New Character"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
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
                child:
                    StyledText('Create a name & slogan for your character. '),
              ),
              const SizedBox(
                height: 30,
              ),

              // INPUT FOR NAME AND SLOGAN -------------------------------------------------------------------------------
              TextField(
                controller: _nameController,
                style: TextStyle(color: AppColors.textColor),
                cursorColor: AppColors.primaryColor,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_2),
                    label: StyledText('Character name')),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _sloganController,
                style: TextStyle(color: AppColors.textColor),
                cursorColor: AppColors.primaryColor,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.chat),
                    label: StyledText('Character slogan')),
              ),
              const SizedBox(
                height: 30,
              ),
              //Select vocation title
              Center(
                child: Icon(Icons.code, color: AppColors.primaryAccent),
              ),

              const SizedBox(height: 15),

              const Center(
                child: StyledHeading('Choose a Vocation'),
              ),

              const Center(
                child: StyledText('This detemines your available skills.'),
              ),

              const SizedBox(
                height: 30,
              ),

              VocationCard(
                  onTap: updateVocation,
                  selected: selectedVocation == Vocation.raider,
                  vocation: Vocation.raider),
              VocationCard(
                  onTap: updateVocation,
                  selected: selectedVocation == Vocation.ninja,
                  vocation: Vocation.ninja),
              VocationCard(
                  onTap: updateVocation,
                  selected: selectedVocation == Vocation.junkie,
                  vocation: Vocation.junkie),
              VocationCard(
                  onTap: updateVocation,
                  selected: selectedVocation == Vocation.wizard,
                  vocation: Vocation.wizard),
              //Button Create Character----------------------------------------
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading("Create Character"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
