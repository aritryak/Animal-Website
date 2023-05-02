// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class AmericanRedFox extends StatefulWidget {
  const AmericanRedFox({super.key});

  @override
  State<AmericanRedFox> createState() => _AmericanRedFoxState();
}

class _AmericanRedFoxState extends State<AmericanRedFox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:   [
          bgImage,
          Column(
            children: const [
              
            ],
          ),
        ],
      ),
    );
  }

  // background image 
  Widget get bgImage =>  const Image(image: AssetImage('assets/redfox.jpg'));

 
  
}
