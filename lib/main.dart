import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _fApp =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  String realTimeValue = '0';
  String getOnceValue = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      body: FutureBuilder(
          future: _fApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.data);
              // checkDatabaseConnection();
              return Text("Conection error");
            } else if (snapshot.hasData) {
              return content();
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  //
  // void checkDatabaseConnection() async {
  //   DatabaseReference databaseReference =await FirebaseDatabase.instance.ref().child('count');
  //
  //   try {
  //     await databaseReference.once().then((snapshot) {
  //       bool connected = snapshot.snapshot.exists;
  //       if (connected != null && connected) {
  //         print('Connected to the database');
  //       } else {
  //         print('Not connected to the database');
  //       }
  //     });
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  Widget content() {
    DatabaseReference _testRef = FirebaseDatabase.instance.ref().child('count');
    _testRef.onValue.listen((event) {
      setState(() {
        realTimeValue = event.snapshot.value.toString();
      });
    });
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("RealTime Counter : $realTimeValue")),
          SizedBox(
            height: 50,
          ), GestureDetector(
            onTap: () async {
              final snapshot = await _testRef.get();
              if (snapshot.exists) {
                setState(() {
                  getOnceValue = snapshot.value.toString();
                });
              } else {
                print("No data available!!!");
              }
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ), child: Center(child: Text("Get once", style: TextStyle(color: Colors.white, fontSize: 20),),),
            ),
          ), SizedBox(height: 50,),
          Center(
            child: Text("Get once counter: $getOnceValue"),)
        ],
      ),
    );
  }
}
