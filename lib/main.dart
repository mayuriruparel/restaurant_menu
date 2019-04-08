import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
void main() => runApp(A());
class A extends StatefulWidget {
  @override
  _AS createState() => _AS();
}
class _AS extends State<A> {
  bool cf = true;
  int ci = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'VarelaRound',
        textTheme: Theme.of(context).textTheme.copyWith(
              body1: new TextStyle(color: Colors.blue, fontSize: 20.0),
              body2: new TextStyle(color: Colors.white, fontSize: 20.0),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: FutureBuilder<List<It>>(
              future: fC(context),
              builder: (context, snapshot) {
                return _bD(context, snapshot.data);
              })),
    );
  }
  Widget _bD(BuildContext context, data) {
    double sh = (MediaQuery.of(context).size.height);
    double sw = (MediaQuery.of(context).size.width);
    return Container(
      color: cf ? Colors.blue : Colors.blueGrey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: const EdgeInsets.only(left: 60),
                    child: !cf? IconButton(icon: Icon(Icons.arrow_back),color: Colors.white,iconSize: 30,onPressed: () {setState(() {cf = !cf;});}): Text('')),
                Padding(padding: const EdgeInsets.only(left: 10),
                    child: Text(cf ? 'Mayuri\'s Cafe.' : data[ci].name,style: Theme.of(context).textTheme.body2))
              ],
            ),
            Padding(padding: const EdgeInsets.only(top: 50),child: SizedBox(width: sw * 0.95,height: sh * 0.65,child: cf ? _bc(data) : _bI(data[ci].dD)))
          ],
        ),
      ),
    );
  }
  Widget _bc(data) {
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int iI) {
        int l = data[iI].dD.length;
        return GestureDetector(
          onTap: () {
            setState(() {
              cf = !cf;
              ci = iI;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(              
              padding: (iI % 2 == 0)
                  ? EdgeInsets.only(bottom: 100)
                  : EdgeInsets.only(top: 100),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Padding(padding: const EdgeInsets.all(50.0),
                  child: new Text(data[iI].name + '\n' + '$l Types',textAlign: TextAlign.center),
                )),
              ),
            ),
          ),
        );
      },
    );
  }
  Widget _bI(idata) {
    return PageView.builder(
      itemCount: idata == null ? 0 : idata.length,
      controller: PageController(viewportFraction: 0.8, initialPage: 0),
      itemBuilder: (BuildContext context, int iI) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  height: (MediaQuery.of(context).size.height) * 0.35,
                  decoration: BoxDecoration(
                      image: new DecorationImage(image: new ExactAssetImage(idata[iI].im),fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
                Padding(padding: const EdgeInsets.only(top: 10),
                  child: Text(idata[iI].n + '\n\n' + idata[iI].pr,style: TextStyle(color: Colors.blueGrey),textAlign: TextAlign.left),)
              ],
            ),
          ),
        );
      },
    );
  }
}
Future<List<It>> fC(BuildContext context) async {
  final r =await DefaultAssetBundle.of(context).loadString('assets/i.json');
  return new List<It>.from(json.decode(r).map((x) => It.fromJson(x)));
}
class It {
  String name;
  List<DD> dD;
  It({
    this.name,
    this.dD,
  });
  factory It.fromJson(Map<String, dynamic> json) => new It(
        name: json["name"],
        dD: new List<DD>.from(json["dd"].map((x) => DD.fromJson(x))),
      );
}
class DD {
  String n;
  String im;
  String pr;
  DD({
    this.n,
    this.im,
    this.pr,
  });
  factory DD.fromJson(Map<String, dynamic> json) => new DD(
        n: json["name"],
        im: json["img"],
        pr: json["price"],
      );
}
