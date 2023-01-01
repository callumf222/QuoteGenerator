import 'package:flutter/material.dart';

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

  @override
  void initState()  {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {


      });
    });
  }

  void quoteGeneratorPageHandler(){
    setState(() {

    });
}


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff101820),

        body: Align(
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
                    alignment: const Alignment(0.0, -0.4),
                    child: MaterialButton(
                      onPressed: () {
                        quoteGeneratorPageHandler();
                      },
                      color: const Color(0xfffee715),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      textColor: const Color(0xff000000),
                      height: height * 0.25,
                      minWidth: width * 1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Text(
                        "Generate quotes",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: const Alignment(0.0, 0.22),
                    child: MaterialButton(
                      onPressed: () {
                        quoteGeneratorPageHandler();
                      },
                      color: const Color(0xffffffff),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      textColor: const Color(0xff000000),
                      height: height * 0.25,
                      minWidth: width * 1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Text(
                        "Make you own quotes",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: const Alignment(0.0, 0.84),
                    child: MaterialButton(
                      onPressed: () {
                        quoteGeneratorPageHandler();
                      },
                      color: const Color(0xff111111),
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      textColor: const Color(0xff000000),
                      height: height * 0.25,
                      minWidth: width * 1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: const Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),



                ]),
          ),
        ),
    );
  }

}