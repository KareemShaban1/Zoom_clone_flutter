import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/models/home_model.dart';
import 'package:zoom_clone/pages/SignIn_page.dart';
import 'package:zoom_clone/pages/SignUp_page.dart';
import 'package:zoom_clone/pages/join_meeting_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activetab = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.settings_outlined,
                color: Colors.grey,
              ),
            ),
            SizedBox(width: 130,),
            Row(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: activetab == index ? Colors.black54 : Color(0xffe4e4ed)),
                    ),
                  );
                })),
            Spacer()
          ],
        ),
      ),
      body: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.99,
            height: size.height,
            onPageChanged: ( int index ,resaon ){
                setState(() {
                  activetab = index;
                });
            }
          ),
          items: List.generate(items.length, (index) {
            return Container(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(items[index]['title'],
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(items[index]['description'],
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black))
                    ],
                  ),
                  items[index]['img'] == null
                      ? Container()
                      : Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(items[index]['img']))),
                  )
                ],
              ),
            );
          })),
      bottomNavigationBar: Container(
        width: size.width,
        height: 200,
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (_) => JoinMeetingPage()));
                  // Navigator.pushReplacement(
                  //     context, MaterialPageRoute(builder: (_) => RootApp()));
                },
                child: Container(
                  width: size.width * 0.75,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFF0e72ec), borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Join a Meeting",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.white),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (_) => SignUp()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color(0xFF0e72ec),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (_) => SignIn()));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Color(0xFF0e72ec),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}
