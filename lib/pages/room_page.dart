import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:zoom_clone/models/room_model.dart';
import 'package:zoom_clone/pages/home_page.dart';
import 'package:zoom_clone/pages/participants_page.dart';
import 'package:zoom_clone/theme/colors.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title:
          Container(
            decoration: BoxDecoration(

                border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.3)))),
            child:  Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Icon(
                    MaterialCommunityIcons.headphones,
                    color: Colors.white,
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.security_outlined,
                        color: Colors.green,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Zoom",
                        style: TextStyle(
                            fontSize: 17, color: Colors.white70, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                              (route) => false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red, borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 5, bottom: 5),
                        child: Text("Leave",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  )

                ],
              ),
            ),
          )
      ),


      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: 15,
              right: 15,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/person1.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/person2.jpg",),
                        fit: BoxFit.cover)),
              ),
            )
          ],
        ),
      ),


      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border(
                top: BorderSide(width: 0.5, color: Colors.grey.withOpacity(0.3)))),
        child: Padding(
          padding:
          const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(textItems.length, (index) {
              return InkWell(
                  onTap: () {
                    selectedTab(index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(bottomItems[index],
                          size: sizedItems[index], color: colorItems[index]),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        textItems[index],
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: colorItems[index]),
                      )
                    ],
                  ));
            }),
          ),
        ),
      ),
    );
  }



  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });

    if (index == 3) {
      Navigator.push(
          context,
          MaterialPageRoute(
              fullscreenDialog: true, builder: (_) => ParticipantsPage()));
    }
    if (index == 4) {
      bottomSheet();
    }
  }


  bottomSheet(){
    showAdaptiveActionSheet(
      context: context,

      bottomSheetColor: Colors.grey[100],
      actions: <BottomSheetAction>[

        BottomSheetAction(
            leading:  Padding(padding: const EdgeInsets.all(20), child: Text('Security'),),
            trailing: Padding(padding: const EdgeInsets.all(20), child: Icon(Icons.security),),
            title: Text(""),
            onPressed: () {}),

        BottomSheetAction(
            leading:  Padding(padding: const EdgeInsets.all(20), child: Text('Chat'),),
            trailing: Padding(padding: const EdgeInsets.all(20), child: Icon(MaterialCommunityIcons.chat),),
            title: Text(""),
            onPressed: () {}),

        BottomSheetAction(
            leading:Padding(padding: const EdgeInsets.all(20), child: Text('Meeting Settings'),),
            trailing: Padding(padding: const EdgeInsets.all(20), child: Icon(Icons.settings_outlined),),
            title: Text(""),
            onPressed: () {}),

        BottomSheetAction(
            leading: Padding(padding: const EdgeInsets.all(20), child: Text('Youtube'),),
            trailing: Padding(padding: const EdgeInsets.all(20), child: Icon(MaterialCommunityIcons.youtube),),
            title: Text(""),
            onPressed: () {}),

        BottomSheetAction(
            leading:  Padding(padding: const EdgeInsets.all(20), child: Text('Disconnect Audio',style: TextStyle(color: Colors.red,fontSize: 20),),),
            title: Text(""),
            onPressed: () {}),

        BottomSheetAction(
            title:  Padding(
              padding: const EdgeInsets.all(20),
              child: Text('✋ Raise Hand ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal),),
            ),
            onPressed: () {}),

        BottomSheetAction(
            title:  Padding(
              padding: const EdgeInsets.all(20),
              child: Text(' 👏   👍   💔   🤣   😮   🎉 ',),
            ),
            onPressed: () {}),

      ],
      cancelAction: CancelAction(title: const Text('Cancel',style: TextStyle(color: Colors.black),)),// onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

}
