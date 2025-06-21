import 'package:flutter/material.dart';

class LampRoom extends StatefulWidget {
  const LampRoom({super.key});

  @override
  State<LampRoom> createState() => _LampRoomState();
}

class _LampRoomState extends State<LampRoom>
    with SingleTickerProviderStateMixin {
  bool isLampOn = false;
  Color lampColor = Colors.amber;

  void toggleLamp() {
    setState(() => isLampOn = !isLampOn);
  }

  void pickLampColor() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Choose Lamp Color"),
          content: Wrap(
            spacing: 10,
            children: [
              buildColorBox(Colors.amber),
              buildColorBox(Colors.white),
              buildColorBox(Colors.blueAccent),
              buildColorBox(Colors.orange),
              buildColorBox(Colors.greenAccent),
            ],
          ),
        );
      },
    );
  }

  Widget buildColorBox(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          lampColor = color;
        });
        Navigator.of(context).pop();
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: Colors.black26),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade800, Colors.indigo.shade600],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 48),
                Text(
                  "Reading Lamp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.color_lens, color: Colors.white),
                  onPressed: pickLampColor,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF1E1E2C),
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: toggleLamp,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Image.asset(
                      isLampOn ? 'assets/lamp_on.png' : 'assets/lamp_off.png',
                      height: 280,
                    ),
                  ),
                  if (isLampOn)
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: lampColor.withOpacity(0.25),
                        boxShadow: [
                          BoxShadow(
                            color: lampColor.withOpacity(0.6),
                            blurRadius: 70,
                            spreadRadius: 60,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "✨ Tap the lamp to see the magic!",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
