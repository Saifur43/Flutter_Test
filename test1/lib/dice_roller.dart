import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  
  var activeDice = 'assets/images/dice-1.png';

  void rollDice(){
    var diceRoll = randomizer.nextInt(6)+1;
    setState(() {
        activeDice = 'assets/images/dice-$diceRoll.png';
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(activeDice,
                width: 200,
                ),
                const SizedBox(height: 20,),
                TextButton(
                onPressed: rollDice, 
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 28),
                ),
                child: const Text('Roll Dice'),
                ),
              ],
            );
  }
}