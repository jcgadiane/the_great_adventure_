import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_great_adventure/screens/unlocked_door_screen.dart';

import 'locked_door.dart';
import 'unlocked_screen.dart';

class LockedDoorScreen extends StatefulWidget {
  const LockedDoorScreen({Key? key}) : super(key: key);

  @override
  _LockedDoorScreenState createState() => _LockedDoorScreenState();
}

class _LockedDoorScreenState extends State<LockedDoorScreen> {
  bool isUnlocked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("You see a ${isUnlocked ? 'unlocked' : 'locked'} door"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Center(child: LockedDoor()),
            Center(
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () async {
                  if (isUnlocked) {
                    bool? reLockDoor = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const UnlockedDoorScreen()));
                    if (reLockDoor ?? false) {
                      if (mounted) {
                        setState(() {
                          isUnlocked = false;
                        });
                      }
                    }
                  } else {
                    bool? result = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const DoorLockScreen()));
                    if (result ?? false) {
                      if (mounted)
                        setState(() {
                          isUnlocked = true;
                        });
                    } else {
                      if (mounted)
                        setState(() {
                          isUnlocked = false;
                        });
                    }
                  }
                },
                child: Text(isUnlocked ? "Open Door" : "Examine Door"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
