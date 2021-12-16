import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle headline4 = Theme.of(context).textTheme.headline4!;
    final String url = Uri(
            scheme: "mailto",
            path: "mansonx13@gmail.com",
            query: "subject=Need Flutter developer&body=Please contact me")
        .toString();

    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://media-exp1.licdn.com/dms/image/C4E03AQGxw6ju5BDz7A/profile-displayphoto-shrink_200_200/0/1623834587381?e=1643846400&v=beta&t=8PbTyJyf6gIVm7LjCReSURQlF5YSzP35-v5FAOPtZ7U"),
              radius: 80,
            ),
            Text("Mohamed Ibrahim",
                style: GoogleFonts.pacifico(
                    textStyle: headline4, color: Colors.white)),
            Text(
              "SOFTWARE ENGINEER",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 16),

            ),
            const SizedBox(
              child: Divider(
                color: Colors.white,
              ),
              width: 120,
              height: 10,
            ),
            Card(
              child: InkWell(
                child: const ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  tileColor: Colors.white,
                  title: Text("+20100 832 5807"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onTap: () {
                  _launchUrl("tel:+20100 832 5807");
                },
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
            ),
            Card(
              child: InkWell(
                child: const ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.teal,
                  ),
                  tileColor: Colors.white,
                  title: Text("mansonx13@gmail.com"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                onTap: () {
                  _launchUrl(url);
                },
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
            ),
          ],
        ),
      ),
    );
  }
}

_launchUrl(var url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Couldn't launch $url";
  }
}
