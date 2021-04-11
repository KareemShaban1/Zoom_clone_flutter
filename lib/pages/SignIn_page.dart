import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_clone/pages/home_page.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(

        child: Scaffold(

          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey[50],
            shadowColor: Colors.transparent,
            title: Row(
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,top: 5),
                      child: Text("Cancel",style: TextStyle(color: Colors.blue[700],fontSize: 18),),
                    )),

                SizedBox(width: 100,),
                
                Text("Sign In",style: TextStyle(color: Colors.black),)
              ],
            )
          ),
          backgroundColor: Colors.grey[100],
          body: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: 30,),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.3)),
                        top: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.3))
                      )
                  ),
                  child: TextField(

                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,

                      border: InputBorder.none,
                      hintText: "Email Address",
                      hintStyle: TextStyle(

                      )

                    ),
                  ),
                ),

                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.3)),
                          top: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.3))
                      )
                  ),
                  child: TextField(
                    obscureText: true,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Password  ",
                        hintStyle: TextStyle(

                        )

                    ),
                  ),
                ),

                SizedBox(height: 30,),

                GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           fullscreenDialog: true,
                  //           builder: (_) => JoinMeetingPage()));
                  //   // Navigator.pushReplacement(
                  //   //     context, MaterialPageRoute(builder: (_) => RootApp()));
                  // },
                  child: Container(
                    width: size.width * 0.75,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffe4e4ed), borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600,color: Colors.grey[600]),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30,),

                Text("Forget Password?",style: TextStyle(color: Colors.blue[700]),),

                SizedBox(height: 50,),



                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Text("OR, sign in with"),
                    ),

                  ],
                ),

                ListTile(

                  tileColor: Colors.white,
                  leading: IconButton(icon: Icon(Icons.vpn_key),),
                  title: Text("SSO",style: TextStyle(color: Colors.black),),
                  trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),),
                ),

                ListTile(
                  tileColor: Colors.white,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SvgPicture.asset(
                      "assets/icons/icons-google.svg",
                      width: 22,
                      height: 22,
                    ),
                  ),
                  title: Text("Google",style: TextStyle(color: Colors.black),),
                  trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),),
                ),

                ListTile(
                  tileColor: Colors.white,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 13),
                    child: SvgPicture.asset(
                      "assets/icons/facebook-2.svg",
                      width: 22,
                      height: 22,
                    ),
                  ),
                  title: Text("Facebook",style: TextStyle(color: Colors.black),),
                  trailing: IconButton(icon: Icon(Icons.arrow_forward_ios),),
                ),
              ],
            ),
          ),

    ));
  }
}
