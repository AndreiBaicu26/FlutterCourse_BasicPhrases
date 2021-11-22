import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioCache audioCache = AudioCache();
  List<Phrase> texts = const <Phrase>[
    Phrase('salut_ro.mp3', 'salut'),
    Phrase('salut_fr.mp3', 'salut (franceza)'),
    Phrase('manumesc_ro.mp3', 'ma numesc'),
    Phrase('manumesc_fr.mp3', 'ma numesc (franceza)'),
    Phrase('cefaci_ro.mp3', 'ce faci'),
    Phrase('cefaci_fr.mp3', 'ce faci (franceza)'),
    Phrase('flutterecool_ro.mp3', 'flutter e cool'),
    Phrase('flutterecool_fr.mp3', 'flutter e cool (franceza)'),
  ];

  void playSound(int index) {
    String filename = texts[index].fileName;
    audioCache.play(filename);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Phrases"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          crossAxisCount: 2,
        ),
        itemCount: texts.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              playSound(index);
            },
            child: Ink(
              child: Center(
                child: Text(
                  texts[index].text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.red,
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.blue,
                    Colors.lightBlue,
                  ],
                ),
                border: Border.all(color: Colors.blue),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Phrase {
  const Phrase(this.fileName, this.text);

  final String fileName;
  final String text;
}
