import 'package:flutter/material.dart';
import '../widgets/tap_progress_chart.dart';  // Make sure the path to this import is correct based on your project structure

class TapperPage extends StatefulWidget {
  const TapperPage({Key? key}) : super(key: key);

  @override
  _TapperPageState createState() => _TapperPageState();
}

class _TapperPageState extends State<TapperPage> {
  int tapCount = 0;  // Example start value
  int tapGoal = 100;

  @override
  Widget build(BuildContext context) {
    double progressPercent = tapCount / tapGoal * 100;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tapper!'),
        backgroundColor: Colors.grey[850],
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],  // Dark background for the whole page
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TapProgressChart(progressPercent: progressPercent),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatCard('75%', 'Yesterday'),
                _buildStatCard('80%', 'This Month'),
                _buildStatCard('80%', 'All Time'),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('Reset', resetTap),
                _buildButton('Goal++', incrementGoal),
              ],
            ),
            SizedBox(height: 30),
            _buildButton('Tap Me!', incrementTap),
            SizedBox(height: 20),
            Text('You Tapped: $tapCount times', style: TextStyle(color: Colors.white)),
            Text('Tap Goal: $tapGoal times', style: TextStyle(color: Colors.white)),
            Text('Total Progress: ${progressPercent.toStringAsFixed(2)}%', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String percent, String timeFrame) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          Text(percent, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange)),
          Text(timeFrame, style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800],  // Updated from 'primary'
            foregroundColor: Colors.white,      // Updated from 'onPrimary'
        ),
    );
}

  void incrementTap() {
    if (tapCount < tapGoal) {
      setState(() {
        tapCount++;
      });
    }
  }

  void resetTap() {
    setState(() {
      tapCount = 0;
    });
  }

  void incrementGoal() {
    setState(() {
      tapGoal++;
    });
  }
}