import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Xylophone',
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  List<ColorBar> generate() {
    var colors = <Color>[
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple
    ];
    var bars = <ColorBar>[];
    for (var i = 0; i < 7; i++) {
      bars.add(ColorBar(
        color: colors[i],
        audioNumber: i + 1,
      ));
    }

    return bars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: generate(),
    ));
  }
}

class ColorBar extends StatefulWidget {
  const ColorBar({Key? key, required this.color, required this.audioNumber})
      : super(key: key);

  final Color color;
  final int audioNumber;

  @override
  State<ColorBar> createState() => _ColorBar();
}

class _ColorBar extends State<ColorBar> {
  AudioCache player = AudioCache();

  void playAudio(int n) {
    player.play('audio/note$n.wav');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => widget.color)),
          onPressed: () {
            playAudio(widget.audioNumber);
          },
          child: const Text(''),
        )
    );
  }
}
