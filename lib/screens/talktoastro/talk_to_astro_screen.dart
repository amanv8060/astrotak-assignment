import 'package:flutter/material.dart';

class TalkToAstro extends StatefulWidget {
  const TalkToAstro({Key? key}) : super(key: key);

  @override
  _TalkToAstroState createState() => _TalkToAstroState();
}

class _TalkToAstroState extends State<TalkToAstro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Astro screen"),
      ),
    );
  }
}
