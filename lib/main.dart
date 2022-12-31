import 'package:flutter/material.dart';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/services.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
part 'main.g.dart';

@HiveType(typeId: 0)
class DecisionMap{

  @HiveField(0)
  late int ID;

  @HiveField(1)
  late int yesID;

  @HiveField(2)
  late int noID;

  @HiveField(3)
  late String description;
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
      ..ID = int.parse(itemInRow[0])
      ..genre = itemInRow[1]
      ..quote = itemInRow[2];
    int key = int.parse(itemInRow[0]);
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
  int selectedValue = 1;


  @override
  void initState()  {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

    });
  }

  void quoteGeneratorHandler() {
    setState(() {
      if (selectedValue == 1) {
        quoteText = "this worked first";
      }

      if (selectedValue == 2) {
        quoteText = "this worked second";
      }

      if (selectedValue == 3) {
        quoteText = "this worked third";
      }

      if (selectedValue == 4) {
        quoteText = "this worked forth";
      }

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
                      onPressed: () {
                        quoteGeneratorHandler();
                      },
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
                  }),
          ),

                ]),
          ),
        ),
      ),
    );
  }

  }
