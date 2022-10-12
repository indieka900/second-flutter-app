import 'package:flutter/material.dart';

class ContentF extends StatefulWidget {
  const ContentF({super.key});

  @override
  State<ContentF> createState() => _ContentState();
}

class _ContentState extends State<ContentF> {
  bool isOn = false;
  bool? isChecked = false;
  String result = 'No result yet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Some flutter key points",
          style: TextStyle(color: Color.fromARGB(181, 42, 238, 245)),
        ),
        backgroundColor:
            isOn ? Color.fromARGB(255, 136, 115, 38) : Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.home,
            color: Color.fromARGB(255, 21, 9, 92),
            size: 30,
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
            color: Color.fromARGB(255, 6, 247, 18),
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
                    someLongRunningOperationAsyncAwait();
                  },
                  child: Text('Future (async/await)'),
                ),
                TextButton(
                  onPressed: () {
                    debugPrint("TextButton was pressed");
                  },
                  child: Text("Text button"),
                ),
              ],
            ),
            Container(
              height: 20,
              child: Text(result),
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

  void someLongRunningOperationApi() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        this.result = 'First operation completed';
      });
      Future.delayed(Duration(seconds: 3)).then((value) {
        setState(() {
          this.result = 'Second operation completed';
        });
        Future.delayed(Duration(seconds: 3)).then((value) {
          setState(() {
            this.result = 'Third operation completed';
          });
        });
      });
    }).catchError((onError) {
      print('Error occured');
    });
  }

  void someLongRunningOperationAsyncAwait() async {
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      this.result = 'First operation completed';
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      this.result = 'Second operation completed';
    });
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      this.result = 'Third operation completed';
    });
  }
}
