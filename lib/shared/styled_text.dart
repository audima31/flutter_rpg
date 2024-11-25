import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

//Reusable Styled Text Widget
class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
    // style: GoogleFonts.kanit(
    //     textStyle: Theme.of(context).textTheme.bodyMedium));
  }
}

class StyledHeading extends StatelessWidget {
  const StyledHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(), style: Theme.of(context).textTheme.headlineMedium,
      // style: GoogleFonts.kanit(
      //     textStyle: Theme.of(context).textTheme.headlineMedium),
    );
  }
}

class StyledTitle extends StatelessWidget {
  const StyledTitle(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(), style: Theme.of(context).textTheme.titleMedium,
      // style:
      //     GoogleFonts.kanit(textStyle: Theme.of(context).textTheme.titleMedium),
    );
  }
}
