import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:zoom_clone/pages/home_page.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    DateTime _selectedDate;

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.grey[50],
            shadowColor: Colors.transparent,
            title: GestureDetector(
              onTap: (){
                Navigator.push(
                          context, MaterialPageRoute(builder: (_) => HomePage()));
                    },
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,top: 5),
                  child: Text("Cancel",style: TextStyle(color: Colors.blue[700],fontSize: 18),),
                )),
          ),
          backgroundColor: Colors.grey[50],
          body: Center(
            child: Column(

              children: [
                SizedBox(height: 150,),
                Text("For verification , please\n              confirm\n     your date of birth",
                  style: TextStyle(color: Colors.black,fontSize: 25,
                  fontWeight: FontWeight.bold),),
                SizedBox(height: 40,),

                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 25),
                //   child: DatePickerWidget(
                //     looping: false, // default is not looping
                //     firstDate: DateTime(1990, 01, 01),
                //     lastDate: DateTime(2030, 1, 1),
                //     initialDate: DateTime(1991, 10, 12),
                //     dateFormat: "dd-MMM-yyyy",
                //     locale: DatePicker.localeFromString('en'),
                //     onChange: (DateTime newDate, _) => _selectedDate = newDate,
                //     pickerTheme: DateTimePickerTheme(
                //       itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                //       dividerColor: Colors.white,
                //       backgroundColor: Colors.white
                //     ),
                //   ),
                // ),
                //

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent)
                    ),
                    child: Center(child: Text("Month/Day/Year",style: TextStyle(color: Colors.grey),)),
                    onPressed: () async {
                      var datePicked = await DatePicker.showSimpleDatePicker(
                        context,
                        initialDate: DateTime(1994),
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2012),
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DateTimePickerLocale.en_us,
                        looping: true,
                      );


                    },
                  ),
                ),

                SizedBox(height: 20,),

                Text("This data will not be stored",style: TextStyle(color: Colors.black),),


              ],
            ),
          ),

    ));
  }
}
