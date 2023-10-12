/*
  assets:
    - img/logo.png
    - img/main.png

  dependencies:
    flutter:
      sdk: flutter
    provider: ^6.0.2
    url_launcher: 6.0.9
*/

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyApp()
));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Foxdale"),
        backgroundColor: Colors.purple[800],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Image.asset(
            "img/main.png",
            height:200,
            scale:2.5,

        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple[800],
                  image: DecorationImage(
                      image: AssetImage("img/logo.png"),
                      fit: BoxFit.cover)
              ),

              child: Text(
                  "",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'fontss',

                  ),

              ),
            ),
              ListTile(
                title: Text('Business'),
                leading: Icon(
                    Icons.add_business_rounded,
                    color:Colors.purple[900],
                ),
              ),
              ListTile(
                title: Text('Email'),
                leading: Icon(
                  Icons.mail,
                  color: Colors.purple[900],
                ),
              ),

              ListTile(
                  title: Text('Contact'),
                  leading: Icon(
                    Icons.add_ic_call_outlined,
                    color: Colors.purple[900],
                  ),
              ),

              ListTile(
                title: Text('Location'),
                leading: Icon(
                  Icons.add_location_alt_outlined,
                  color: Colors.purple[900],
                ),
              ),

              ListTile(
                title: Text('WhatsApp'),
                leading: Icon(
                  Icons.chat_sharp,
                  color: Colors.purple[800],
                ),
              ),

              ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          fixedColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                  Icons.home,
              ),

            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.account_circle),
            ),

            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.account_circle),
            ),
          ],
          onTap: (int indexOfItem) {}),

    );
  }
}
