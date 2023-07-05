import 'package:flutter/material.dart';

class CounterFuntionsScreen extends StatefulWidget {
  const CounterFuntionsScreen({super.key});

  @override
  State<CounterFuntionsScreen> createState() => _CounterFuntionsScreenState();
}

class _CounterFuntionsScreenState extends State<CounterFuntionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 174, 199, 255),
        title: const Text("Counter Funtions"),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              clickCounter = 0;
            });
          }, icon: const Icon(Icons.refresh_rounded,))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160,
                    fontWeight: FontWeight.w100)),
            Text('Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25)),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(icon: Icons.exposure_minus_1,  onPressed: () {
            setState(() {
              if(clickCounter == 0) return;
              clickCounter--;
            });
          },),
          const SizedBox(width: 10),
          CustomButton(icon: Icons.refresh_rounded, onPressed: () {
            setState(() {
              clickCounter = 0;
            });
          },),
          const SizedBox(width: 10),
          CustomButton(icon: Icons.plus_one, onPressed: () {
            setState(() {
              clickCounter++;
            });
          },),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key, required this.icon, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      enableFeedback: true,
      onPressed: () {
        onPressed();
      },
      child: Icon(icon),
    );
  }
}
