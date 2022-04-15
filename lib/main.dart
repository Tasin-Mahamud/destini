import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const destini());
}

class destini extends StatelessWidget {
  const destini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryPage(),
    );
  }
}

StoryBrain mystorybrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    mystorybrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      if (mystorybrain.isfinished() == true) {
                        mystorybrain.restart();
                      } else {
                        mystorybrain.nextStory(1);
                      }
                    });
                    //TODO: Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                  },
                  color: Colors.red,
                  child: Text(
                    //TODO: Step 13 - Use the storyBrain to get the text for choice 1.
                    mystorybrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Visibility(
                visible: mystorybrain.buttonShouldBeVisible(),
                child: Expanded(
                  flex: 2,
                  //TODO: Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.

                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        mystorybrain.nextStory(2);
                      });
                      //TODO: Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                    },
                    color: Colors.blue,
                    child: Text(
                      //TODO: Step 14 - Use the storyBrain to get the text for choice 2.
                      mystorybrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
