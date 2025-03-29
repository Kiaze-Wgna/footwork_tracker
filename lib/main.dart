import 'dart:async';
import 'package:flutter/material.dart';
import "dart:math";
import 'package:flutter_svg/flutter_svg.dart';

bool practicestart=false;
int practicecount=0;
int practicetype=0;

//Global Theme
final globalTheme=ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 0, 0)),
  useMaterial3: true,
);

//Global Bars&Menus
//topBar
PreferredSizeWidget topBar({String text="FootworkTracker"}){
  return AppBar(
    backgroundColor: Color.fromARGB(255, 92, 190, 74),
    title: Text(text),
  );
}

//bottomBar
Widget bottomBar(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Flexible(
        child:GestureDetector(
          child:Image.asset("Assets/Images/Button Home.png"),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
              ),
            (route) => false
            ); 
          },
        ),
      ),
      Flexible(
        child:GestureDetector(
          child:Image.asset("Assets/Images/Button Practice.png"),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => const PracticeScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
              ),
            (route) => false
            ); 
          },
        ),
      ),
      Flexible(
        child:GestureDetector(
          child:Image.asset("Assets/Images/Button Tips.png"),
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => const TipsScreen(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero
              ),
            (route) => false
            ); 
          },
        ),
      ),
    ]
  );
}

//sideMenu
Widget sideMenu(BuildContext context){
  return Container(
    width: 250,
    child: Drawer(
      backgroundColor: Color.fromARGB(255, 154, 224, 142),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 5, height: 50),
          Flexible(
            child:GestureDetector(
              child:Image.asset("Assets/Images/Menu.png"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero
                  ),
                (route) => false
                ); 
              },
            ),
          ),
          Flexible(
            child:GestureDetector(
              child:Image.asset("Assets/Images/Menu Home.png"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero
                  ),
                (route) => false
                ); 
              },
            ),
          ),
          //for the individual practices
          Flexible(
            child:GestureDetector(
              child:Image.asset("Assets/Images/Menu SixCorners.png"),
              onTap: () {
                practicetype=1;
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => PracticeGenerator(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero
                  ),
                (route) => false
                );
              },
            ),
          ),

          Flexible(
            child:GestureDetector(
              child:Image.asset("Assets/Images/Menu FourCorners.png"),
              onTap: () {
                practicetype=2;
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => PracticeGenerator(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero
                  ),
                (route) => false
                );
              },
            ),
          ),
          
          Flexible(
            child:GestureDetector(
              child:Image.asset("Assets/Images/Menu EightCorners.png"),
              onTap: () {
                practicetype=3;
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => PracticeGenerator(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero
                  ),
                (route) => false
                );
              },
            ),
          ),

          Flexible(
            child:GestureDetector(
              child:Image.asset("Assets/Images/Menu SmashDefense.png"),
              onTap: () {
                practicetype=4;
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => PracticeGenerator(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero
                  ),
                (route) => false
                );
              },
            ),
          ),

          Flexible(
            child:GestureDetector(
              child:Image.asset("Assets/Images/Menu CenterToCorners.png"),
              onTap: () {
                practicetype=5;
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => PracticeGenerator(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero
                  ),
                (route) => false
                );
              },
            ),
          ),

          //footwork camera
          Flexible(
            child:GestureDetector(
              child:Image.asset("Assets/Images/Menu Practice.png"),
              onTap: () {

              },
            ),
          ),

          Flexible(
            child:GestureDetector(
              child:Image.asset("Assets/Images/Menu Tips.png"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => const TipsScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero
                  ),
                (route) => false
                ); 
              },
            ),
          ),
        ]
      )
    )
    
  );
}

void main() {
  runApp(MaterialApp(home: HomeScreen(),));
}

//Homescreen Code
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme
      theme: globalTheme,
      //main build thing
      home:Scaffold(
        //top bar
        appBar: topBar(),
        //main content
        body:Container(
          alignment: Alignment.topCenter,
          child:Text("Home",style:TextStyle(fontSize: 50))
        ),
        //bottom bar
        bottomNavigationBar:bottomBar(context),
        //menu select
        drawer: sideMenu(context)
      ),
    );
  }
}

//PracticeScreen Code
class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme
      theme: globalTheme,
      //main build thing
      home:Scaffold(
        //top bar
        appBar: topBar(),
        //main content
        body:ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Center(
              child:Text("Practice",style:TextStyle(fontSize: 50))//align to center
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/SixCornersPractice.png"),
              onTap: () {
                practicetype=1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PracticeGenerator()),
                );
              },
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/FourCornersPractice.png"),
              onTap: () {
                practicetype=2;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PracticeGenerator()),
                );
              },
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/EightCornersPractice.png"),
              onTap: () {
                practicetype=3;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PracticeGenerator()),
                );
              },
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/SmashDefense.png"),
              onTap: () {
                practicetype=4;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PracticeGenerator()),
                );
              },
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/CentreToCorners.png"),
              onTap: () {
                practicetype=5;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PracticeGenerator()),
                );
              },
            ),const SizedBox(height: 20),
          ]
        ),
        //bottom bar
        bottomNavigationBar:bottomBar(context),
        //menu select
        drawer: sideMenu(context)
      ),
    );
  }
}

//TipsScreen Code
class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme
      theme: globalTheme,
      //main build thing
      home:Scaffold(
        //top bar
        appBar: topBar(),
        //main content
        body:Container(
          alignment: Alignment.topCenter,
          child:Text("Tips",style:TextStyle(fontSize: 50)),
        ),
        //bottom bar
        bottomNavigationBar:bottomBar(context),
        //menu select
        drawer: sideMenu(context)
      ),
    );
  }
}

//PracticeGenerator Code

class PracticeGenerator extends StatefulWidget{
  const PracticeGenerator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PracticeGenerator createState() => _PracticeGenerator();
}


class _PracticeGenerator extends State<PracticeGenerator> {
  List<String> practiceList = [];
  int rhythm = 0; // Variable to change
  bool showButton = true;//to show/hide the button
  String currentPractice = "Assets/Images/start.svg";
  Timer? timer;

  @override
  void initState() {
    super.initState();
    if (practicetype == 1) { // 6 corners
      practiceList = [
        "Assets/Images/LeftFront.svg",
        "Assets/Images/LeftCenter.svg",
        "Assets/Images/LeftBack.svg",
        "Assets/Images/RightFront.svg",
        "Assets/Images/RightCenter.svg",
        "Assets/Images/RightBack.svg",
      ];
    } else if (practicetype == 2) { // 4 corners
      practiceList = [
        "Assets/Images/LeftFront.svg",
        "Assets/Images/LeftBack.svg",
        "Assets/Images/RightFront.svg",
        "Assets/Images/RightBack.svg",
      ];
    } else if (practicetype == 3) { // 8 corners
      practiceList = [
        "Assets/Images/LeftFront.svg",
        "Assets/Images/LeftCenter.svg",
        "Assets/Images/LeftBack.svg",
        "Assets/Images/RightFront.svg",
        "Assets/Images/RightCenter.svg",
        "Assets/Images/RightBack.svg",
        "Assets/Images/FastLeft.svg",
        "Assets/Images/FastRight.svg"
      ];
    } else if (practicetype == 4) { // Smash defense
      practiceList = [
        "Assets/Images/LeftFront.svg",
        "Assets/Images/LeftCenter.svg",
        "Assets/Images/RightFront.svg",
        "Assets/Images/RightCenter.svg"
      ];
    } else if (practicetype == 5) { // Center to corners
      practiceList = [
        "Assets/Images/LeftFront.svg",
        "Assets/Images/LeftCenter.svg",
        "Assets/Images/LeftBack.svg",
        "Assets/Images/RightFront.svg",
        "Assets/Images/RightCenter.svg",
        "Assets/Images/RightBack.svg",
        "Assets/Images/FrontCenter.svg"
      ];
    }
  }
    void changeRhythm() {
    setState(() {
      rhythm = (rhythm + 500) % 1500; // Cycle through values (0, 500, 1000)
    });
  }

  void changePractice() {
    if (practicecount >= 20) {
      practicestart = false;
      timer?.cancel();
      practicecount = 0;
      setState(() {
        currentPractice = "Assets/Images/start.svg";
        showButton = true;
      });
      return;
    }
    setState(() {
      currentPractice = practiceList[Random().nextInt(practiceList.length)];
      practicecount++;
    });
    timer = Timer(Duration(milliseconds: Random().nextInt(1500) + 1000+rhythm), changePractice);
  }


  @override
  void dispose() {
    practicestart = false;
    timer?.cancel();
    practicecount = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Practice Generator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showButton) //show only when starting
            Column(
              children: [
                Text("Current Rhythm: $rhythm", style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: changeRhythm,
                  child: Text("Change Rhythm"),
                ),
              ],
            ),
          Expanded(
            child: Center(
              child: GestureDetector(
                child: SvgPicture.asset(
                  currentPractice,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                  if (!practicestart) {
                    setState(() {
                      practicestart = true;
                      showButton = false; // Hide button when starting practice
                    });
                    timer?.cancel();
                    practicecount = 0;
                    changePractice();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}