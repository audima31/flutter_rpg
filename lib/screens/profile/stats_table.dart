import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/characters.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;
  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //available points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  //fungsi widget. => untuk dapat mengakses character
                  color:
                      widget.character.points > 0 ? Colors.yellow : Colors.grey,
                ),
                const SizedBox(
                  width: 20,
                ),
                const StyledText('Stats points available: '),
                const Expanded(
                  child: SizedBox(
                    width: 20,
                  ),
                ),
                StyledHeading(widget.character.points.toString())
              ],
            ),
          ),

          //stats table (Basic Table in Flutter)
          Table(
            children: widget.character.statsAsFormattedList.map((index) {
              return TableRow(
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.5)),
                  children: [
                    //stats title
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: StyledHeading(index['title']!),
                        )),

                    //stats value
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(index['value']!),
                      ),
                    ),

                    //Icon Increase
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.character.increaseStat(index['title']!);
                              });
                            },
                            icon: Icon(
                              Icons.arrow_upward,
                              color: AppColors.textColor,
                            ),
                          ),
                        )),

                    //Table Decrease
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.character.decreaseStat(index['title']!);
                            });
                          },
                          icon: Icon(
                            Icons.arrow_downward,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                    )
                  ]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
