import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urgh/resumeAPI.dart';

import 'job.dart';

class projects extends StatelessWidget
{
  const projects({super.key});

  @override
  Widget build(BuildContext context) {
    const hash = "L[I5V%WqWBj[~qa\$WBay-;WBWCay";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
                        TextButton(onPressed: (){}, child: Text("projects",  style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: primaryColor
                        ),)),
                        TextButton(onPressed: (){Navigator.pushNamed(context, "/about");}, child: const Text("about"),),
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





          ]
        )
    );
  }

  Widget generateProjectCard(BuildContext context, Job job){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth
    ) ;
  }
}