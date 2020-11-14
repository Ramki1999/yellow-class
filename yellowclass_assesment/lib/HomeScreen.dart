import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Drawer_Screens/sample.dart';
import 'ShowVideo.dart';

class HomeScreen extends StatelessWidget {
  var show;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "asset/title.png",
          width: 150,
          height: 70,
        ),
        toolbarHeight: 80,
        elevation: 10,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: (show != null)
                  ? Icon(Icons.notifications_active, color: Colors.orangeAccent)
                  : Icon(Icons.notifications, color: Colors.black),
              onPressed: () {
                show = 1;
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Sample()));
              })
        ],
      ),
      body: Stack(children: [
        Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  color: Colors.orangeAccent,
                  onPressed: () {},
                ),
                prefixStyle: TextStyle(color: Colors.black),
                fillColor: Colors.white.withOpacity(0.1),
                filled: true,
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey),
                labelStyle: TextStyle(color: Colors.orangeAccent),
                focusColor: Colors.orangeAccent,
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),
                  ),
                  borderSide: new BorderSide(
                    color: Colors.orangeAccent,
                    width: 1.0,
                  ),
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(20.0),
                  ),
                  borderSide: new BorderSide(
                    color: Colors.orangeAccent,
                    width: 1.0,
                  ),
                ),
                hintText: 'Health and Hygeine',
                labelText: "Search",
              ),
              onChanged: (text) {
//            _cityName = text;
              },
            )),
        Container(
          padding: EdgeInsets.only(top: 100),
          child: ListView(
            itemExtent: 200,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ShowVideo(category: "Health and Hygiene")));
                },
                child: Card(
                    child: Stack(
                  children: [
                    Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.bj0s7rGeFsQm8n9yTrmimAHaFD%26pid%3DApi&f=1",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text(
                        "Health and Hygiene",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ShowVideo(category: "Story Telling")));
                },
                child: Card(
                    child: Stack(
                  children: [
                    Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.gXzwJLF8tsw5CaIDSuzWMQHaFU%26pid%3DApi&f=1",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text(
                        "Story Telling",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                )),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ShowVideo(category: "Brainiac"))),
                child: Card(
                    child: Stack(
                  children: [
                    Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.zg-A9Z5DsyCG_q_BHdB0NgHaE7%26pid%3DApi&f=1",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text(
                        "Brainiac",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                )),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ShowVideo(category: "Visual Art"))),
                child: Card(
                    child: Stack(
                  children: [
                    Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.j6F-e2w7Jvu1sjX_poknlQHaFS%26pid%3DApi&f=1",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text(
                        "Visual Art",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                )),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ShowVideo(category: "Yoga and Exercise"))),
                child: Card(
                    child: Stack(
                  children: [
                    Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.5eObeePY-nGl1ns8VVVsOwHaFQ%26pid%3DApi&f=1",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text(
                        "Yoga and Exercise",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                )),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ShowVideo(category: "Performing Art"))),
                child: Card(
                    child: Stack(
                  children: [
                    Image.network(
                      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.OdeTtoLM9Nm-qfcsvXAB3wHaEK%26pid%3DApi&f=1",
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Text(
                        "Performing Arts",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
//        Positioned(
//            top: 10,
//            left: 20,
//            child: Text(
//              "Categories",
//              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//            ))
      ]),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.orangeAccent,
                Color(0xffF2B950).withOpacity(0.7)
              ])),
              accountName: new Text(
                "A.P.J Abdul Kalam",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              accountEmail: new Text(
                "9840802020",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: new CircleAvatar(
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('asset/user.png'),
                ),
                backgroundColor: Colors.orangeAccent,
              ),
            ),
            new ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                title: Text(
                  'Account',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Sample()));
                }),
            new ListTile(
                leading: Icon(
                  Icons.style,
                  color: Colors.black,
                ),
                title: Text(
                  'Trainers',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Sample()));
                }),
            new ListTile(
                leading: Icon(
                  Icons.schedule,
                  color: Colors.black,
                ),
                title: Text(
                  'Time Tabble',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Sample()));
                }),
            Divider(),
            new ListTile(
                leading: Icon(
                  Icons.translate,
                  color: Colors.black,
                ),
                title: Text(
                  'Language',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Sample()));
                }),
            new ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Sample()));
                }),
            new ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.black,
                ),
                title: Text(
                  'Help',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Sample()));
                }),
            Divider(),
            new ListTile(
                leading: Icon(
                  Icons.branding_watermark,
                  color: Colors.black,
                ),
                title: Text(
                  'Terms and Conditions',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Sample()));
                }),
            new ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                title: Text(
                  'Log out',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Sample()));
                }),
            ListTile(
              title: Text('0.0.1'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
