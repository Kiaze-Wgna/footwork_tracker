import 'dart:async';
import 'package:flutter/material.dart';
import "dart:math";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

bool practicestart=false;
int practicecount=0;
int practicetype=0;

late AudioPlayer player;
// other improvements: 
// consider adding a way for the player to know when their time is about to be up
// add an audio when changing: can't tell when it changes if it's the same arrow

//Global Useful Functions:
//Global noBackNavigator
void noBackNavigator(BuildContext context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => screen,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
    ),
    (route) => false,
  );
}

//Global yesBackNavigator
void yesBackNavigator(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

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
            noBackNavigator(context, const HomeScreen());
          },
        ),
      ),
      Flexible(
        child:GestureDetector(
          child:Image.asset("Assets/Images/Button Practice.png"),
          onTap: () {
            noBackNavigator(context, const PracticeScreen());
          },
        ),
      ),
      Flexible(
        child:GestureDetector(
          child:Image.asset("Assets/Images/Button Tips.png"),
          onTap: () {
            noBackNavigator(context, const TipsScreen()); 
          },
        ),
      ),
    ]
  );
}

final double dividerThickness = 1.0;
final Color dividerColor = Colors.black;

//sideMenu
Widget sideMenu(BuildContext context){
  return SizedBox(
    width: 250,
    child: Drawer(
      backgroundColor: Color.fromARGB(255, 92, 190, 74),
      child:ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(width: 5, height: 50),
          GestureDetector(
            child:Image.asset("Assets/Images/Menu.png"),
            onTap: () {
              noBackNavigator(context, const HomeScreen());
            },
          ),
          Container(height: dividerThickness,color: dividerColor),
          GestureDetector(
            child:Image.asset("Assets/Images/Menu Home.png"),
            onTap: () {
              noBackNavigator(context, const HomeScreen());
            },
          ),
          Container(height: dividerThickness,color: dividerColor),
          //CourtCam (Beta)
          GestureDetector(
            child:Image.asset("Assets/Images/Menu CourtCam.png"),
            onTap: () {
              yesBackNavigator(context, const CourtCamScreen());
            },
          ),
          Container(height: dividerThickness,color: dividerColor),
          //for the individual practices
          GestureDetector(
            child:Image.asset("Assets/Images/Menu SixCorners.png"),
            onTap: () {
              practicetype=1;
              yesBackNavigator(context, const PracticeGenerator());
            },
          ),
          Container(height: dividerThickness,color: dividerColor),
          GestureDetector(
            child:Image.asset("Assets/Images/Menu FourCorners.png"),
            onTap: () {
              practicetype=2;
              yesBackNavigator(context, const PracticeGenerator());
            },
          ),
          Container(height: dividerThickness,color: dividerColor),
          GestureDetector(
            child:Image.asset("Assets/Images/Menu EightCorners.png"),
            onTap: () {
              practicetype=3;
              yesBackNavigator(context, const PracticeGenerator());
            },
          ),
          Container(height: dividerThickness,color: dividerColor),
          GestureDetector(
            child:Image.asset("Assets/Images/Menu SmashDefense.png"),
            onTap: () {
              practicetype=4;
              yesBackNavigator(context, const PracticeGenerator());
            },
          ),
          Container(height: dividerThickness,color: dividerColor),
          GestureDetector(
            child:Image.asset("Assets/Images/Menu CenterToCorners.png"),
            onTap: () {
              practicetype=5;
              yesBackNavigator(context, const PracticeGenerator());
            },
          ),
          Container(height: dividerThickness,color: dividerColor),
          GestureDetector(
            child:Image.asset("Assets/Images/Menu Tips.png"),
            onTap: () {
              noBackNavigator(context, const TipsScreen());
            },
          ),
          Container(height: dividerThickness,color: dividerColor),
        ]
      )
    )
    
  );
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  player = AudioPlayer();
  await player.setAudioSource(AudioSource.asset('Assets/Images/beep.mp3'));
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
        body: SingleChildScrollView(  // Makes the entire body scrollable
          child: Padding(
            padding: const EdgeInsets.all(16.0),  // Add padding around the content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Text
                Text(
                  "Welcome to FootworkTracker!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 20),  // Add spacing between sections
                
                // Introduction Text
                Text(
                  "You can try the practices in the Practice page, "
                  "check out our brand new beta CourtCam for court detection, "
                  "and learn more with our Badminton tips section.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 40),
                
                // Button Section (optional)
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Practice page
                    noBackNavigator(context, PracticeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Try Practices'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to CourtCam page (replace with actual page)
                    yesBackNavigator(context, CourtCamScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Try CourtCam (Beta)'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Tips page
                    noBackNavigator(context, TipsScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Button color
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('View Tips'),
                ),
              ],
            ),
          ),
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
          padding: EdgeInsets.zero,
          children: [
            Center(
              child:Text("Practice",style:TextStyle(fontSize: 50))//align to center
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/CourtCam.png"),
              onTap: () {
                yesBackNavigator(context, const CourtCamScreen());
              },
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/SixCornersPractice.png"),
              onTap: () {
                practicetype=1;
                yesBackNavigator(context, const PracticeGenerator());
              },
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/FourCornersPractice.png"),
              onTap: () {
                practicetype=2;
                yesBackNavigator(context, const PracticeGenerator());
              },
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/EightCornersPractice.png"),
              onTap: () {
                practicetype=3;
                yesBackNavigator(context, const PracticeGenerator());
              },
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/SmashDefense.png"),
              onTap: () {
                practicetype=4;
                yesBackNavigator(context, const PracticeGenerator());
              },
            ),const SizedBox(height: 20),
            GestureDetector(
              child:Image.asset("Assets/Images/CentreToCorners.png"),
              onTap: () {
                practicetype=5;
                yesBackNavigator(context, const PracticeGenerator());
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
      home: Scaffold(
        //top bar
        appBar: topBar(),
        //main content
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tips", style: TextStyle(fontSize: 50)),
              SizedBox(height: 20),
              Text(
                "Singles: General Game Plan: Establish a rhythm, and find the opponents’ rhythm\n\n"
                "Always attempt to find relative weaknesses and strengths in the opponent as soon as possible\n\n"
                "Relative weakness: a skill that your opponent is inferior to you (ex. netplay, speed)\n"
                "Relative strength: a skill that your opponent is superior to you (ex. their smash vs your defense, their push vs your cutoff capability)\n\n"
                "Target this relative weakness to set up your weapon\n\n"
                "Weapon: a finishing shot, usually the smash, played with intent to end the rally\n"
                "Examples of weapons: smash, flick, deception, pushes (lower levels), drives (lower levels)\n\n"
                "Utilize your relative strength to earn a point, or set up your weapon\n\n"
                "Take note of patterns and default shots of your opponent, alongside their potential weapons\n\n"
                "Default shot: a shot that is played most commonly by a player in a certain position (ex. drops in the backcourt when the bird is taken late by the opponent)\n\n"
                "By determining the default shot of your opponent, this allows for predictions/effective anticipation, giving you the edge in the rally to set up more dangerous shots\n\n"
                "Opponent Strategies/Playstyles:\n"
                "VERY GENERAL AND WILL VARY FROM PLAYER TO PLAYER. CONSULT GENERAL GAME PLAN WHEN FIRST GETTING A FEEL FOR AN OPPONENT. THIS PAGE SHOULD BE ONLY USED AS A GENERAL FORMAT FOR PLAYER TYPES\n\n"
                "General Attackers:\n"
                "Smasher: characterized by a strong, steep, or persistent smash. Will typically attempt to outspeed, or win at the net to set up a smash and win the rally. Counterstrategies can be either draining their stamina (if you have good stamina), playing fast game (if you happen to outspeed them), or playing control and counterattack (if you have good hand control and can put counterpressure when blocking the smash).\n"
                "THEY CANNOT HIDE BEHIND THEIR SMASH, DO NOT BE SCARED\n"
                "Note: usually a tall or fast player, so keep that in mind when gauging their tempo/rhythm\n"
                "Player Examples: Viktor Axelson, Lin Dan\n\n"
                "Pressure player: characterized by persistent fast pressure. Will attempt to drive, push, and make the court smaller. Counterstrategies can be either making the court larger (if they have bad control and cannot play tight as effectively, and if you have good control), counterpressure (fast shots towards the back to disrupt their forward momentum), counterattack (capitalize off their pushes and cut them off), or play a longer game and capitalize off the drop in speed.\n"
                "THEIR SPEED WILL BE THEIR DOWNFALL, WEAR THEM DOWN\n"
                "Player Examples: Lee Zii Jia\n\n"
                "General Defenders:\n"
                "The wall: characterized by high consistency, defense, and stamina. Due to genetics, the reason behind this strategy is likely due to a lower count of fast twitch fibres in the body, thus restricting maximum smashing power. Will play a long rally, and attempt to force mistakes throughout the rally. No clear counterstrategy, attempt to hunt for a weakness or some way to break through. Due to longer rallies, it is easier to analyze their general movement patterns and shot patterns. However, some of these players are somewhat slower, so that is something to look out for. The most important thing to do in long drawn out rallies is to never let up, as each point you lose meaninglessly is stamina lost and another big fight to win back.\n"
                "KEEP ATTACKING, THEY CANNOT DEFEND FOREVER\n\n"
                "Specific Variations/Strategies:\n"
                "Take Control of Front Court:\n"
                 "Make The Court Bigger:\n"
                "Play shots deep to the corners of the court to get your opponent to run the full length of the court\n"
                "Good against opponents with worse stamina or control, as this gives you the edge in drawn out rallies\n"
                "Stamina advantage in later rallies can give you more free points in later rallies, when the opponent’s conditioning is off and their concentration slips\n"
                "Usually coupled with long rally strategies: intentionally playing out the rally in hopes of draining the opponent’s stamina rather than directly scoring the point\n"
                "Playing this strategy to the front court against shorter opponents can be advantageous due to tight angle shots\n\n"
                "Make The Court Smaller:\n"
                "Play fast shots closer to the opponent, with the intent of playing incredibly fast, almost drive based rallies\n"
                "Good against opponents with better stamina and worse burst speed, as the reduced distance travel negates their stamina advantage\n"
                "By overwhelming the opponent’s pace, they will begin to take shots later and later, thus giving you an advantage in the rally\n"
                "Playing this strategy against taller opponents is higher risk and higher reward: playing just beyond their cutoff height and forcing turns out of taller opponents will slow them down considerably, as taller opponents turn slower\n\n"
                "Rhythm Change:\n"
                "Alternate between making the court bigger and making the court smaller\n"
                "A common example is to “pin” the opponent with drives, then playing a soft shot\n\n"
                "Playing Bodyshots:\n"
                "Play towards the body either when the opponent is displaced (still moving towards centre) or as a variation (ex. bodyshot smash)\n"
                "Can be a good mixup when used properly\n\n"
                "Deception:\n"
                "Many players make the mistake of spamming deception. Deception should only be played at critical moments (ex. when the opponent is off-position) or as a mixup to break the opponent’s rhythm. Never play it willy-nilly, as the opponent will adapt\n"
                "The most effective way to set up a lift for the smash is to take control of the front court\n"
                "By forcing lifts through good net setup, you can gain a free attack on the opponent\n"
                "Requires your net skill to be superior to the opponent\n\n"
                "Speed-up:\n"
                "Sudden rhythm changes on your front\n"
                "Usually done to catch the opponent off guard and to play a sudden attack\n"
                "Can be done against low lifts\n"
                "Also pairs well with deception, especially if the opponent is scared of your attack\n\n"
                "Follow-up:\n"
                "If the smash cannot finish the rally, the follow-up will be incredibly important\n"
                "Follow-ups are meant to capitalize off the unstable position of the opponent after defending a smash\n"
                "Playing deception or fast pressure to the corners to either continue the rally or secure a point will be ideal\n\n"
                "Counterattack:\n"
                "The time when an opponent is weakest to attack is right after they attack\n"
                "Capitalizes off the unstable position of an opponent after they attack, and the stamina consumption from a sudden attack\n"
                "Hunt for what their follow-up is, then either cut it off, or force a high shot, then play your weapon\n\n"
                "Counterpressure:\n"
                "Fast shots always invoke fast responses\n"
                "If the bird is taken early on a fast shot from the opponent, they will be caught in a bad position\n"
                "Take advantage of their bad position to play fast attacking shots\n"
                "Usually allows you to gain the upper hand and force the opponent into late positions\n"
              ),
            ],
          ),
        ),
        //bottom bar
        bottomNavigationBar: bottomBar(context),
        //menu select
        drawer: sideMenu(context),
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
    player.seek(Duration.zero);
    player.play();   
    setState(() {
      currentPractice = practiceList[Random().nextInt(practiceList.length)];
      practicecount++;
    });
    timer = Timer(Duration(milliseconds: Random().nextInt(300) + 1500+rhythm), changePractice); // subject to change
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
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 92, 190, 74),title: Text("Practice Generator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showButton) //show only when starting
            Column(
              children: [
                if (rhythm==0) // times subject to change
                  Text("Current Rhythm: $rhythm ms (Advanced)", style: TextStyle(fontSize: 20)),

                if (rhythm==500) 
                  Text("Current Rhythm: $rhythm ms (Intermediate)", style: TextStyle(fontSize: 20)),
                
                if (rhythm == 1000)
                  Text("Current Rhythm: $rhythm ms (Beginner)", style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                  ElevatedButton(
                  onPressed: changeRhythm,
                  child: Text("Change Rhythm"),
                )
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

//CourtCamScreen Code
class CourtCamScreen extends StatelessWidget {
  const CourtCamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //top bar
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 92, 190, 74),title: Text("Court Camera")),
        //main content
        body:Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(20),  // Added padding for spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Court Camera",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), // Adjusted font size
            ),
            SizedBox(height: 20), // Space between title and other texts
            Text(
              "This feature is currently only available for beta testers.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10), // Space between sentences
            Text(
              "You are not currently a beta tester.",
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        ),
    );
  }
}