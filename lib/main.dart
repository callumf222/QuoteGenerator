import 'package:flutter/material.dart';

import 'package:animated_background/animated_background.dart';

void main() async {

  runApp (
    const MaterialApp(
      home: MyFlutterApp(),
    ),
  );
}

class MyFlutterApp extends StatefulWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

class MyFlutterState extends State<MyFlutterApp> with TickerProviderStateMixin {

  late String quoteText = "Quote";
  int selectedValue = 1;

  @override
  void initState()  {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff101820),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            spawnMaxRadius: 50,
            spawnMinSpeed: 10.00,
            particleCount: 30,
            spawnMaxSpeed: 40,
            minOpacity: 0.3,
            spawnOpacity: 0.4,
            baseColor: Colors.blue,
          ),
        ),
        vsync: this,

        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Stack(
                alignment: Alignment.topLeft,
                children: [

                 Align(
                      alignment: const Alignment(0.0, 0.4),
                      child: MaterialButton(
                        onPressed: () {},
                        color: const Color(0xfffee715),
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        textColor: const Color(0xff000000),
                        height: 40,
                        minWidth: 140,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: const Text(
                          "Press to generate quote",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: const Alignment(0.0, -0.6),
                      child: Text(
                        quoteText,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 34,
                          color: Color(0xfffee715),
                        ),
                      ),
                    ),


                  Align(
                      alignment: const Alignment(-0.8, -0.3),
                      child: DropdownButton(
                          dropdownColor: Colors.blue,

                      value: selectedValue,
                      items: const [
                        DropdownMenuItem(
                          value: 1,
                          child: Text("Motivational"),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text("Powerful"),
                        ),
                        DropdownMenuItem(
                          value: 3,
                          child: Text("Rich"),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text("Sad"),
                        ),
                      ],
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 24,
                              color: Color(0xfffee715),
                          ),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                        });
                      })


                  ),
                ]),
    ),
    ),
      ),
          );



  }
}