import 'package:flutter/material.dart';
import 'package:yellowclass_assesment/VideoStream.dart';

class ShowVideo extends StatelessWidget {
  ShowVideo({this.category});

  final String category;
  final Map _categoryVideos = {
    "Story Telling": ["", "", "", "", "", ""],
    "Visual Art": ["", "", "", "", ""],
    "Yoga and Exercise": ["", "", "", "", ""],
    "Health and Hygiene": [
      {
        "How to wash your hand ? ":
            "https://storage.googleapis.com/umbrella-a5829.appspot.com/hand.mp4"
      },
      {
        "How to brush your teeth ? ":
            "https://storage.googleapis.com/umbrella-a5829.appspot.com/teeth.mp4"
      },
      {
        "How to clean your room ?":
            "https://storage.googleapis.com/umbrella-a5829.appspot.com/room.mp4"
      },
      {
        "How to wear a mask properly ?":
            "https://storage.googleapis.com/umbrella-a5829.appspot.com/mask.mp4"
      },
    ],
    "Brainiac": ["", "", "", "", ""],
    "Performing Art": ["", "", "", "", ""]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$category"),
        ),
        body: category == "Health and Hygiene"
            ? Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  itemExtent: 200,
                  children: [
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => VideoStream(
                                    category: category,
                                    title: "How to wash your hand ? ",
                                    link: _categoryVideos[category][0]
                                        ["How to wash your hand ? "],
                                  ))),
                      child: Card(
                          child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "https://storage.googleapis.com/umbrella-a5829.appspot.com/hand.PNG",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black54,
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                          Positioned(
                            bottom: 10,
                            left: 15,
                            child: Text(
                              "How to wash your hand ? ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Positioned(
                              child: Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: Colors.white,
                              ),
                              top: 70,
                              left: MediaQuery.of(context).size.width * 0.4)
                        ],
                      )),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => VideoStream(
                                    category: category,
                                    title: "How to brush your teeth ? ",
                                    link: _categoryVideos[category][1]
                                        ["How to brush your teeth ? "],
                                  ))),
                      child: Card(
                          child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "https://storage.googleapis.com/umbrella-a5829.appspot.com/teeth.PNG",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black54,
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                          Positioned(
                            bottom: 10,
                            left: 15,
                            child: Text(
                              "How to brush your teeth ? ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Positioned(
                              child: Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: Colors.white,
                              ),
                              top: 70,
                              left: MediaQuery.of(context).size.width * 0.4)
                        ],
                      )),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => VideoStream(
                                    category: category,
                                    title: "How to clean your room ?",
                                    link: _categoryVideos[category][2]
                                        ["How to clean your room ?"],
                                  ))),
                      child: Card(
                          child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "https://storage.googleapis.com/umbrella-a5829.appspot.com/room.PNG",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black54,
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                          Positioned(
                            bottom: 10,
                            left: 15,
                            child: Text(
                              "How to clean your room ?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Positioned(
                              child: Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: Colors.white,
                              ),
                              top: 70,
                              left: MediaQuery.of(context).size.width * 0.4)
                        ],
                      )),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => VideoStream(
                                    category: category,
                                    title: "How to wear a mask properly ?",
                                    link: _categoryVideos[category][3]
                                        ["How to wear a mask properly ?"],
                                  ))),
                      child: Card(
                          child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              "https://storage.googleapis.com/umbrella-a5829.appspot.com/mask.PNG",
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black54,
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                          Positioned(
                            bottom: 10,
                            left: 15,
                            child: Text(
                              "How to wear a mask properly ?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Positioned(
                              child: Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: Colors.white,
                              ),
                              top: 70,
                              left: MediaQuery.of(context).size.width * 0.4)
                        ],
                      )),
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.only(left: 50, right: 50),
                color: Colors.orangeAccent,
                child: Center(
                  child: Text(
                      "Demo App - Click the Health and Hygiene to see the demo"),
                ),
              ));
  }
}
