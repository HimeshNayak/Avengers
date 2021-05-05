import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/imageSliders.dart';
import 'util/data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text('MY APP'),
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
                            )),
                      )),
                );
              },
            ),
          ),
          Center(child: Text('Top Projects')),
          for (int i = 0; i < 3; i++)
            Container(
              child: Center(child: Text('Project #$i')),
              height: 100.0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          Center(child: Text('Top 10 Performers')),
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
                  child: Center(child: Text('Person #${index + 1}')),
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
