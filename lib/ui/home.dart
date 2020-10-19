import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioValue = 0;
  double _finalRes = 0.0;
  final TextEditingController _weightCtr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Plant"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: [
            new Image.asset(
              "images/plant.png",
              width: 133.0,
              height: 200.0,
            ),
            //
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: [
//
                  new TextField(
                    controller: _weightCtr,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "Weight on Earth.",
                      hintText: "Pound",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  //
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  //

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //

                      new Radio<int>(
                        activeColor: Colors.orange,
                        groupValue: radioValue,
                        onChanged: handleRadioValue,
                        value: 0,
                      ),
                      new Text(
                        "Mar",
                        style: new TextStyle(
                          color: Colors.white30,
                        ),
                      ),

                      //

                      new Radio<int>(
                        activeColor: Colors.red,
                        groupValue: radioValue,
                        onChanged: handleRadioValue,
                        value: 1,
                      ),
                      new Text(
                        "Jupiter",
                        style: new TextStyle(
                          color: Colors.white30,
                        ),
                      ),

                      //

                      new Radio<int>(
                        groupValue: radioValue,
                        onChanged: handleRadioValue,
                        value: 2,
                      ),
                      new Text(
                        "Cono",
                        style: new TextStyle(
                          color: Colors.white30,
                        ),
                      ),

                      //
                    ],
                  ),

                  //
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Text(
                    "$_finalRes",
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.4,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void handleRadioValue(int value) {
    setState(() {
      radioValue = value;
      print(radioValue);
      switch (radioValue) {
        case 0:
          _finalRes = caculateWeight(_weightCtr.text, 0.06);
          break;
        case 1:
          _finalRes = caculateWeight(_weightCtr.text, 0.38);
          break;
        case 2:
          _finalRes = caculateWeight(_weightCtr.text, 0.91);
          break;
      }
    });
  }

  double caculateWeight(String weight, double mulitpler) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * mulitpler;
    } else {
      print("Wrong!");

      return int.parse("180") * 0.38;
    }
  }
}
