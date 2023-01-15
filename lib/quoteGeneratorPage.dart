import 'package:flutter/material.dart';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/services.dart';

import 'package:hive/hive.dart';
import 'dart:math';


import 'package:hive_flutter/adapters.dart';
part 'main.g.dart';

@HiveType(typeId: 0)
class DecisionMap{

  @HiveField(0)
  late int genre;

  @HiveField(1)
  late int ID;

  @HiveField(2)
  late String quote;
}

late Box<DecisionMap> box;

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();   //HIVE SETUP
  Hive.registerAdapter(DecisionMapAdapter());
  box = await Hive.openBox<DecisionMap>('decisionMap');

  String csv = "decision_map.csv"; //path to csv file asset
  String fileData = await rootBundle.loadString(csv);
  List <String> rows = fileData.split("\n");

  for (int i = 0; i < rows.length; i++)  {
    //selects an item from row and places
    String row = rows[i];
    List <String> itemInRow = row.split(",");

    DecisionMap decMap = DecisionMap()
      ..genre = int.parse(itemInRow[0])
      ..ID = int.parse(itemInRow[1])
      ..quote = itemInRow[2];
    int key = int.parse(itemInRow[1]);
    box.put(key,decMap);
  }

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

  late String quoteText = "Please select the type of quote you would like and hit the button!";
  late int genre = 1;
  late int ID;
  late String quote = "";

  @override
  void initState()  {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {


      });
    });
  }

  int randomNumberMinMax(int min, int max){
    int randomminmax = min + Random().nextInt(max - min);
    return randomminmax;
  }

  void quoteGeneratorHandler() {
    setState(() {

      if (genre == 1) {
        ID = randomNumberMinMax(1, 21);
        DecisionMap? current = box.get(ID);
        if(current != null) {
          quoteText = current.quote;
        }
      }

      if (genre == 2) {
        ID = randomNumberMinMax(21, 41);
        DecisionMap? current = box.get(ID);
        if(current != null) {
          quoteText = current.quote;
        }
      }

      if (genre == 3) {
        ID = randomNumberMinMax(41, 61);
        DecisionMap? current = box.get(ID);
        if(current != null) {
          quoteText = current.quote;
        }
      }

      if (genre == 4) {
        ID = randomNumberMinMax(61, 81);
        DecisionMap? current = box.get(ID);
        if(current != null) {
          quoteText = current.quote;
        }
      }


    });
  }
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double fullWidth = width * 1; //50 % width of screen

    double height = MediaQuery.of(context).size.height;
    double fullHeight = height * 1;

    return Scaffold(

        body: Container(
          height: fullHeight * 1,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1557682268-e3955ed5d83f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Y29sb3VyZWQlMjBiYWNrZ3JvdW5kfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"),
                fit: BoxFit.cover),
          ),


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
                      onPressed: () {
                        quoteGeneratorHandler();
                      },
                      color: const Color(0xff4CC9F0),
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
                    alignment: const Alignment(0.0, -0.7),
                  child: Container(
                    height: 175.0,
                    width: 800.0,
                    color: Colors.transparent,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xff4CC9F0),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: Center(
                          child: Text(quoteText,
                            style: const TextStyle(color: Colors.black, fontSize: 34),
                            textAlign: TextAlign.center,),
                        )),
                  ),
                  ),

          Align(
              alignment: const Alignment(-0.8, 0.0),
            child: Container(
              height: 175.0,
              width: 300.0,
              color: Colors.transparent,
              child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff4CC9F0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Center(
                    child: DropdownButton(
                        dropdownColor: Colors.blue,
                        value: genre,
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
                            child: Text("Love"),
                          ),
                          DropdownMenuItem(
                            value: 4,
                            child: Text("Sad"),
                          ),
                        ],
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 38,
                          color: Color(0xff000000),
                        ),

                        onChanged: (value) {
                          setState(() {
                            genre = value!;
                          });
                        }),
                  )),
            ),

          ),

                ]),
          ),
        ),
      ),
    );
  }

  }
