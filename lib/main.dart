import 'package:flutter/material.dart';
import 'pages/temppage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Unit Converter",
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Unit Converter"),
          ),
          body: const Column(
            children: [
              TabBar(tabs: [
                Tab(
                  child: Text("Temperature"),
                  icon: Icon(Icons.thermostat),
                ),
                Tab(
                  child: Text("Data"),
                  icon: Icon(Icons.data_array),
                ),
                Tab(
                  child: Text("Weight"),
                  icon: Icon(Icons.scale),
                ),
              ]),
              Expanded(
                  child: TabBarView(
                      children: [TempPage(), TempPage(), TempPage()]))
            ],
          ),
        ));
  }
}
