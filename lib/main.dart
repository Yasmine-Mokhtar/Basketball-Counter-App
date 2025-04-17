import "package:flutter/material.dart";

void main() {
  runApp(BasketBallCounterApp());
}

class BasketBallCounterApp extends StatefulWidget {
  const BasketBallCounterApp({super.key});

  @override
  State<BasketBallCounterApp> createState() => _BasketBallCounterAppState();
}

class _BasketBallCounterAppState extends State<BasketBallCounterApp> {
  int teamAPoints = 0;
  int teamBPoints = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0XFFFF5E00),
        scaffoldBackgroundColor: Color(0XFF3E2723),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0XFFFF5E00),
            foregroundColor: Colors.white,
            padding: EdgeInsets.all(12),
            minimumSize: Size(150, 50),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFFFF5E00),
          foregroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.sports_basketball_rounded),
              SizedBox(width: 8),
              Text("Basketball Counter"),
            ],
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TeamWidget(
                    teamName: "Team A",
                    teamPoints: teamAPoints,
                    onTappedButton: (points) {
                      setState(() {
                        teamAPoints += points;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: VerticalDivider(
                    thickness: 0.3,
                    color: Colors.white,
                    indent: 30,
                    endIndent: 30,
                  ),
                ),
                Expanded(
                  child: TeamWidget(
                    teamName: "Team B",
                    teamPoints: teamBPoints,
                    onTappedButton: (points) {
                      setState(() {
                        teamBPoints += points;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
              ),
              onPressed: () {
                setState(() {
                  teamAPoints = 0;
                  teamBPoints = 0;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.reset_tv_rounded),
                  SizedBox(width: 8),
                  Text("Reset")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TeamWidget extends StatelessWidget {
  final String teamName;
  final int teamPoints;
  final Function(int) onTappedButton;
  const TeamWidget({
    super.key,
    required this.teamName,
    required this.teamPoints,
    required this.onTappedButton,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          teamName,
          style: TextStyle(
            fontFamily: "DS-DIGI",
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        Text(
          "$teamPoints",
          style: TextStyle(
            fontFamily: "DS-DIGI",
            fontSize: 184,
            color: Color(0XFFFF5E00),
          ),
        ),
        PrimaryButton(
          titleCTA: "Add 1 Point",
          onTappedButton: onTappedButton,
          points: 1,
        ),
        SizedBox(height: 12),
        PrimaryButton(
          titleCTA: "Add 2 Points",
          onTappedButton: onTappedButton,
          points: 2,
        ),
        SizedBox(height: 12),
        PrimaryButton(
          titleCTA: "Add 3 Points",
          onTappedButton: onTappedButton,
          points: 3,
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String titleCTA;
  final int points;
  final Function(int) onTappedButton;

  const PrimaryButton({
    super.key,
    required this.titleCTA,
    required this.onTappedButton,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTappedButton(points);
      },
      child: Text(titleCTA),
    );
  }
}