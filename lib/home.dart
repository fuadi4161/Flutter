import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_project/screens/home/homepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Builder(
                builder: (context) => IconButton(
                    icon: SvgPicture.asset("assets/icons/drawer.svg"),
                    onPressed: () => Scaffold.of(context).openDrawer()))),
        titleSpacing: 0,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            DrawerHeader(
                child: Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/flutter.png"),
            )),
            SizedBox(height: 20),
            Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 45),
            Text(
              'Setting',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 45),
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 45),
            Text(
              'Log Out',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 45),
            Material(
              borderRadius: BorderRadius.circular(500),
              child: InkWell(
                borderRadius: BorderRadius.circular(500),
                splashColor: Colors.black45,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "v1.0.1",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
      body: <Widget>[
        Homepage(),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.deepPurple,
        ),
        Container(
          color: Colors.indigo,
        ),
        Container(
          color: Colors.yellow,
        )
      ][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 21,
                color: Colors.red,
                height: 21,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 21,
                color: Colors.deepPurple,
                height: 21,
              ),
              title: Text("Search")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                width: 21,
                color: Colors.black,
                height: 21,
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/bookmark.svg',
                width: 21,
                color: Colors.indigo,
                height: 21,
              ),
              title: Text("Bookmark")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/user.png')),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x5c000000),
                        offset: Offset(0, 1),
                        blurRadius: 5)
                  ],
                ),
              ),
              title: Text("Profil")),
        ],
      ),
    );
  }
}
