import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urgh/resumeAPI.dart';

import 'job.dart';

class about extends StatelessWidget
{
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    const hash = "L[I5V%WqWBj[~qa\$WBay-;WBWCay";
    double screenWidth = MediaQuery.of(context).size.width;
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: screenWidth * 0.8,
          leading: Padding(
              padding: const EdgeInsets.fromLTRB(8.0,8.0,0,0),
              child: OverflowBar(
                children: [
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        TextButton(onPressed: (){Navigator.pushNamed(context, "/projects");}, child: const Text("projects")),
                        TextButton(onPressed: (){}, child: Text("about",  style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: primaryColor
                        ))),
                      ]
                  ),
                ],
              )
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,8.0,8.0,0),
              child: TextButton(onPressed: ()=> Navigator.pop(context), child: const Text("home")),
            ),
          ],
        ),
        body:
        Stack(
            children: [
              const BlurHash(hash: hash),
              Center(
                 child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: FutureBuilder<String>(
                          future: resumeAPI().getAboutAsync(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return Text(snapshot.data ?? "No data");
                            }
                          },
                        ),
                      ),
                    ]
              )),
            ]
        )
    );
  }
}