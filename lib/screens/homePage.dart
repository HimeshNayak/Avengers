import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/imageSliders.dart';
import '../services/authMethods.dart';
import '../util/data.dart';
import '../screens/projectDescription.dart';
import '../screens/login.dart';

class MyHomePage extends StatefulWidget {
  final AuthMethods auth;
  MyHomePage({@required this.auth});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool> checkLoggedIn() async {
    bool loggedIn = false;
    await widget.auth.getCurrentUser().then(
      (value) {
        if (value != null) {
          loggedIn = true;
        }
      },
    );
    return loggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: null,
        ),
        title: Text('Avengers'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imageSliders,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 72,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(0),
                    ),
                    onPressed: null,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 31,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          '${imgList[index]}',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: Text('Top Projects'),
          ),
          for (int i = 0; i < 3; i++)
            TextButton(
              child: Container(
                child: Center(
                  child: Text(
                    'Project #${i + 1}',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                height: 100.0,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () async {
                await checkLoggedIn().then(
                  (value) {
                    if (value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjectDescriptionPage(),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(auth: widget.auth),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          Center(
            child: Text('Top 10 Performers'),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: Text('Person #${index + 1}'),
                  ),
                  height: 200.0,
                  width: 100.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
