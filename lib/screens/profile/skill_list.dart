import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/models/skills.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  //variable late digunakan untuk memastikan bahwa variable ini akan ada nilainya dulu, baru diinisialisasi
  late List<Skill> availableSkills;
  late Skill selectedSkill;

  @override
  void initState() {
    //Untuk mengambil data vocation pada file skills.dart, kemudian disamakan sesuai dengan vocation pada character.dart
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkills[0];
    }

    if (widget.character.skills.isNotEmpty) {
      selectedSkill = widget.character.skills.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.secondaryColor.withOpacity(0.5),
        child: Column(
          children: [
            const StyledHeading('Choose an active skill'),
            const StyledText('Skill are unique to your vocation.'),
            const SizedBox(height: 20),
            Row(
                children: availableSkills.map((skill) {
              print('Skill yang didapat ---- : ${skill} ');

              return Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(2),
                color:
                    skill == selectedSkill ? Colors.yellow : Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      //func updateSkill dari characters.dart
                      widget.character.updateSkill(skill);
                      selectedSkill = skill;
                    });
                  },
                  child: Image.asset(
                    'assets/img/skills/${skill.image}',
                    width: 70,
                  ),
                ),
              );
            }).toList() //dari character.dart, disana ada vocation, abis itu ambil vocation.image
                ),
            const SizedBox(height: 10),
            StyledText(selectedSkill.name),
          ],
        ),
      ),
    );
  }
}
