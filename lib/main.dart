import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:urgh/projects.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

import 'about.dart';
import 'asciiLogo.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'June Philip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == "/projects") {
          return PageRouteBuilder(
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
              settings: settings,
              pageBuilder: (_, __, ___) => const projects());
              }
        if (settings.name == "/about") {
          return PageRouteBuilder(
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
              settings: settings,
              pageBuilder: (_, __, ___) => const about());
        }
              // default route
              return PageRouteBuilder(
              transitionDuration: Duration.zero,
              settings: settings,
          pageBuilder: (_, __, ___) => const indexPage(title: "June Philip"));
      },

    );
  }
}

class indexPage extends StatefulWidget {
  const indexPage({super.key, required this.title});
  final String title;

  @override
  State<indexPage> createState() => _indexPageState();
}

class _indexPageState extends State<indexPage> {
  @override
  Widget build(BuildContext context) {
    const hash = "L[I5V%WqWBj[~qa\$WBay-;WBWCay";
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: screenWidth,
        // leading: Padding(
        //   padding: const EdgeInsets.fromLTRB(8.0,8.0,0,0),
        //   child: OverflowBar(
        //     children: [
        //       Row(
        //           mainAxisSize: MainAxisSize.max,
        //           children: [
        //             TextButton(onPressed: ()=>  Navigator.pushNamed(context, '/projects')
        //               , child: const Text("projects"),),
        //             TextButton(onPressed: (){Navigator.pushNamed(context, '/about');}, child: const Text("about"),),
        //           ]
        //       ),
        //     ],
        //   )
        // ),
      ),
      body:
      RotatedBox(
        quarterTurns: screenWidth > 900 ? 0 : 1,
          child: Stack(
            children: [
              const BlurHash(hash: hash),
              Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                      child: Image.asset('logo.png'),
                  )
              )
            ]
          ),
        )
    );
  }

}