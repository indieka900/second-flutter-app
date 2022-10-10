import 'package:flutter/material.dart';

class ContentF extends StatefulWidget {
  const ContentF({super.key});

  @override
  State<ContentF> createState() => _ContentState();
}

class _ContentState extends State<ContentF> {
  bool isOn = false;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Some flutter key points",
          style: TextStyle(color: Color.fromARGB(181, 42, 238, 245)),
        ),
        backgroundColor: Color.fromARGB(255, 136, 115, 38),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.home_filled,
            color: Color.fromARGB(255, 21, 9, 92),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AboutDialog(
                  //applicationIcon: FlutterLogo(),
                  applicationLegalese: 'Legalese',
                  applicationName: 'Joseph\'s Flutter App',
                  applicationVersion: 'version1.0.6',
                  children: [
                    Text(
                      "This details were created by Joseph580",
                      style: TextStyle(color: Color.fromARGB(255, 75, 80, 2)),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/welcome2.png"),
            Divider(
              color: Colors.blueAccent,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(8),
              width: double.infinity,
              color: Colors.orangeAccent,
              child: Center(
                child: Text(
                  "This is a text widget",
                  style: TextStyle(
                    color: Colors.brown[800],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Elevated button clicked');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isOn ? Colors.brown : Colors.green,
                  ),
                  child: Text("Elevated button"),
                ),
                TextButton(
                  onPressed: () {
                    debugPrint("TextButton was pressed");
                  },
                  child: Text("Text button"),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint("OutlinedButton was pressed");
              },
              style: OutlinedButton.styleFrom(
                  backgroundColor: isOn ? Colors.black : Colors.amberAccent),
              child: Text("Outlined button"),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                print("Row was tapped");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_fire_department_sharp,
                    color: Color.fromARGB(255, 245, 20, 3),
                  ),
                  Text(
                    "This is the Raw widget",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                  Icon(Icons.local_fire_department_sharp,
                      color: Color.fromARGB(255, 245, 20, 3)),
                ],
              ),
            ),
            Switch(
              value: isOn,
              onChanged: (bool newBool) {
                setState(() {
                  isOn = newBool;
                });
              },
              activeColor: Color.fromARGB(255, 221, 46, 34),
              //hoverColor: Colors.redAccent,
            ),
            Checkbox(
              value: isChecked,
              onChanged: (bool? checked) {
                setState(() {
                  isChecked = checked;
                });
              },
              checkColor: Colors.pink,
              activeColor: Colors.greenAccent,
            ),
            Image.asset("images/my_image.jpg"),
            SizedBox(
              height: 7,
            ),
            Divider(
              color: Color.fromARGB(255, 141, 112, 24),
            )
          ],
        ),
      ),
    );
  }
}
