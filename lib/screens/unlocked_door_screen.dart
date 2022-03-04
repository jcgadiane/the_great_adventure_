import 'package:flutter/material.dart';
import 'package:the_great_adventure/screens/final_screen.dart';
import 'package:the_great_adventure/screens/unlocked_door.dart';

class UnlockedDoorScreen extends StatefulWidget {
  const UnlockedDoorScreen({Key? key}) : super(key: key);

  @override
  State<UnlockedDoorScreen> createState() => _UnlockedDoorScreenState();
}

class _UnlockedDoorScreenState extends State<UnlockedDoorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("You have successfully opened the door!"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Center(child: UnlockedDoor()),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Lock the door"),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () async {
                      String? player = await showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return const PlayerNameInput();
                          });
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FinalScreen(
                                player: player ?? '',
                              )));
                    },
                    child: Text("Go through the door"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlayerNameInput extends StatefulWidget {
  const PlayerNameInput({
    Key? key,
  }) : super(key: key);

  @override
  _PlayerNameInputState createState() => _PlayerNameInputState();
}

class _PlayerNameInputState extends State<PlayerNameInput> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Please enter your name"),
          TextFormField(
            controller: controller,
          ),
          OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey),
            ),
            onPressed: () {
              Navigator.of(context).pop(controller.text);
            },
            child: Text("Proceed"),
          ),
        ],
      ),
    ));
  }
}
