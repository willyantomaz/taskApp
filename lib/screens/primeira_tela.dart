import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/screens/initial_screen.dart';

import '../data/task_inherited.dart';

class MyFirstWidget extends StatelessWidget {
  const MyFirstWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //travar tela
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return Container(
      color: const Color(0xff7591ba),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              // ClipRRect() -- corta a imagem para ficar arredondada, diferente do broderRadius q apenas limita a imagem a ficar em um container redondo.
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(80),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://empregos.maringa.com/storage/recrutador/OgFDy08eeqRmpUvYQmRtRJS0UVHEW3fE0LNYhwXAfhLRsfAV.png?id=1277'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 200,
            child: Column(
              children: [
                Expanded(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          // builder: (context) => TaskInherited(child: const InitialScreen()),
                          builder: (contextNew) => InitialScreen(
                            taskContext: context,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: const Text("Aperte"),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
