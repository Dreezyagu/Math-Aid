import 'package:flutter/material.dart';
import 'notes.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> topics = [
    'Indices',
    'Logarithms',
    'Variation',
    'Algebraic Processes',
    'Sets',
    'Mensuration',
    'Trigonometry',
    'Quadratic Equations'
  ];

  void navigateToDetail(String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Notes(title);}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'Math Aid',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
            child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    title: Text(
                      topics[index],
                      style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () => navigateToDetail(topics[index]),
                  ),
                )),
          );
        },
        itemCount: 8,
      ),
    );
  }
}
