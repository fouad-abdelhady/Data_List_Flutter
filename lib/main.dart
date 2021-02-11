import 'package:flutter/material.dart';
import 'Quots.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Quots> qoutes = getQuotesList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(
          "QOUTES",
          style: TextStyle(
            fontSize: 30.0,
            letterSpacing: 3.0
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
        child: getColumn(qoutes, this),
      ),
    );
  }

  void deleteState(Quots qoute){
    setState(() {
      qoutes.remove(qoute);
    });
  }
}

Column getColumn(List<Quots>qoutes, HomeScreenState obj){

  return Column(
    children: qoutes.map( (quote) => QouteCard(quote: quote, homeScreenState: obj) ).toList()
  );
}

List<Quots> getQuotesList(){
  return[
    Quots(auother: "Fouad a Youssef", quote: " Fuck Off"),
    Quots(auother: "Fouad a Youssef", quote: " Life is hard"),
    Quots(auother: "Fouad a Youssef", quote: " Think about tomorrow"),
    Quots(auother: "Fouad a Youssef", quote: " Be optimistic")
  ];
}

class QouteCard extends StatelessWidget {
  Quots quote;
  HomeScreenState homeScreenState;
  QouteCard({this.quote, this.homeScreenState});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 15),
      elevation: 6.0,
      color: Colors.grey[850],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 5.0,
            ),
            Text(
              quote.quote,
              style: getQouteStyle(),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              quote.auother,
              style: getAuotherStyle(),
            ),
            SizedBox(
              height: 15.0,
            ),
            FlatButton.icon(
                onPressed: (){homeScreenState.deleteState(quote);},
                icon: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              label: Text("Delete", style: getAuotherStyle(),),
            )
          ],
        )
      );
  }
}

TextStyle getQouteStyle(){
  return TextStyle(
    color: Colors.amber,
    fontSize: 25.0,
  );
}
TextStyle getAuotherStyle(){
  return TextStyle(
    color: Colors.amber,
    fontSize: 20.0,
  );
}