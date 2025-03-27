import 'dart:async';
import 'package:flutter/material.dart';
import "dart:math";

bool practicestart=false;
int practicecount=0;
int practicetype=0;

//Global Theme
final globalTheme=ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 12, 84, 24)),
  useMaterial3: true,
);

//Global Bars&Menus
//topBar
final topBar = AppBar(
    backgroundColor: const Color.fromARGB(255, 12, 84, 24),
    title: Text("FootworkTracker"),
  );

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
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 12, 84, 24),
    child:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Flexible(
          child:GestureDetector(
            child:Image.asset("Assets/Images/Menu Practice.png"),
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
        appBar: topBar,
        //main content
        body:Container(
          child:Text("Home",style:TextStyle(fontSize: 50)),
          alignment: Alignment.topCenter,
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
        appBar: topBar,
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
        appBar: topBar,
        //main content
        body:Container(
          child:Text("Tips",style:TextStyle(fontSize: 50)),
          alignment: Alignment.topCenter,
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
  _PracticeGenerator createState() => _PracticeGenerator();
}

class _PracticeGenerator extends State<PracticeGenerator> {
  List<String> PracticeList=[];
  String CurrentPractice="Assets/Images/start.png";
  Timer? timer;
  @override
  void initState() {
    super.initState();
    if (practicetype==1) { //6 corners
      PracticeList=[
      "Assets/Images/LeftFront.png",
      "Assets/Images/LeftCenter.png",
      "Assets/Images/LeftBack.png",
      "Assets/Images/RightFront.png",
      "Assets/Images/RightCenter.png",
      "Assets/Images/RightBack.png",
      ];
    } else if (practicetype==2){ //4 corners
      PracticeList=[
      "Assets/Images/LeftFront.png",
      "Assets/Images/LeftBack.png",
      "Assets/Images/RightFront.png",
      "Assets/Images/RightBack.png",
      ];
    } else if (practicetype==3){ //8 corners
      PracticeList=[
      "Assets/Images/LeftFront.png",
      "Assets/Images/LeftCenter.png",
      "Assets/Images/LeftBack.png",
      "Assets/Images/RightFront.png",
      "Assets/Images/RightCenter.png",
      "Assets/Images/RightBack.png",
      "Assets/Images/FastLeft.png",
      "Assets/Images/FastRight.png"
      ];
    } else if (practicetype==4){ //smash defense
      PracticeList=[
      "Assets/Images/LeftFront.png",
      "Assets/Images/LeftCenter.png",
      "Assets/Images/RightFront.png",
      "Assets/Images/RightCenter.png"
      ];
    } else if (practicetype==5){ //Center2corners
      PracticeList=[
      "Assets/Images/LeftFront.png",
      "Assets/Images/LeftCenter.png",
      "Assets/Images/LeftBack.png",
      "Assets/Images/RightFront.png",
      "Assets/Images/RightCenter.png",
      "Assets/Images/RightBack.png",
      "Assets/Images/FrontCenter.png"
      ];
    }
  }
  void changepractice(){
    if (practicecount>=20){
      practicestart=false;
      timer?.cancel();
      practicecount=0;
      setState(() {
        CurrentPractice="Assets/Images/start.png";
      });
      return;
    }
    setState(() {
      CurrentPractice=PracticeList[Random().nextInt(PracticeList.length)];
      practicecount++;
    });
    timer=Timer(Duration(milliseconds:Random().nextInt(1500) + 1000),changepractice);
  }
  @override
  void dispose() {
    timer?.cancel(); // Cancel timer when screen is closed
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice Generator"),
      ),
      body: Center(
        child: GestureDetector (
          child: Image.asset(
          CurrentPractice, // Replace with your image path
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain, // Adjusts image to fit within screen
          ),
          onTap: () {
            if (!practicestart){
              practicestart=true;
              timer?.cancel();
              practicecount=0;
              changepractice();
            }
          },
        )
      )
    );
  }
}