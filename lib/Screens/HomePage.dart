import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey <FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  _nameForm (){
    return TextFormField(
      textInputAction: TextInputAction.next, keyboardType: TextInputType.name,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kGrayScale8, width: 0.7)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPrimaryColor, width: 0.7)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kAlertError, width: 0.7)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kAlertError, width: 0.7)
          ),
          isDense: true,
          contentPadding: EdgeInsets.all(15),
          hintText: "Type your name",
          hintStyle: TextStyle(color: Color(0xFFA9AEBE), fontSize: 17)
      ),
      cursorColor: kPrimaryColor,
      controller: nameController,
      validator: (value) => (value!.isEmpty? "Please enter name" : null),
    );
  }

  _emailForm (){
    return TextFormField(
      textInputAction: TextInputAction.next, keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kGrayScale8, width: 0.7)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPrimaryColor, width: 0.7)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kAlertError, width: 0.7)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kAlertError, width: 0.7)
          ),
          isDense: true,
          contentPadding: EdgeInsets.all(15),
          hintText: "Type your email",
          hintStyle: TextStyle(color: Color(0xFFA9AEBE), fontSize: 17)
      ),
      cursorColor: kPrimaryColor,
      controller: emailController,
      validator: (value) => (value!.isEmpty? "Please enter email" : null),
    );
  }

  _phoneForm (){
    return TextFormField(
      textInputAction: TextInputAction.next, keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kGrayScale8, width: 0.7)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kPrimaryColor, width: 0.7)
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kAlertError, width: 0.7)
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: kAlertError, width: 0.7)
          ),
          isDense: true,
          contentPadding: EdgeInsets.all(15),
          hintText: "Type your phone number",
          hintStyle: TextStyle(color: Color(0xFFA9AEBE), fontSize: 17)
      ),
      cursorColor: kPrimaryColor,
      controller: phoneController,
      validator: (value) => (value!.isEmpty? "Please enter phone number" : null),
    );
  }

  _showEmailDialog(String name, String email, String phone){
    showDialog(barrierDismissible: false, context: context, builder: (context){
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,20,20,20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: Text("FORM DETAILS", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),)),
              SizedBox(height: 20,),
              RichText(
                text: TextSpan(
                  text: "FULL NAME:  ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontFamily: "CircularStd", fontSize: 12,),
                  children: [
                    TextSpan(text: name.toUpperCase(), style: TextStyle(color: kPrimaryColor,
                        fontWeight: FontWeight.normal, fontFamily: "CircularStd", fontSize: 12),
                   )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  text: "EMAIL:  ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontFamily: "CircularStd", fontSize: 12,),
                  children: [
                    TextSpan(text: email.toUpperCase(), style: TextStyle(color: kPrimaryColor,
                        fontWeight: FontWeight.normal, fontFamily: "CircularStd", fontSize: 12),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              RichText(
                text: TextSpan(
                  text: "PHONE NUMBER:  ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontFamily: "CircularStd", fontSize: 12,),
                  children: [
                    TextSpan(text: phone.toUpperCase(), style: TextStyle(color: kPrimaryColor,
                        fontWeight: FontWeight.normal, fontFamily: "CircularStd", fontSize: 12),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Center(
                child: Container(
                    child: OutlinedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Dismiss", style: TextStyle(fontSize: 18),),
                    )
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  _viewData(){
    if(_formKey.currentState!.validate()){
      _showEmailDialog(nameController.text, emailController.text, phoneController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("HNG Internship Stage 2 Task"), automaticallyImplyLeading: false,
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: height,
            width: width, color: Colors.white,
            child: Column(
              children: [
                Container(height: 60, width: double.maxFinite,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/zuribanner.png'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "HNG Internship ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "CircularStd", fontSize: 14,),
                            children: [
                              TextSpan(text: "is a virtual internship program created in collaboration with ", style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.normal, fontFamily: "CircularStd", fontSize: 15), children: [
                                    TextSpan(text: "Zuri team ",
                                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: "CircularStd", fontSize: 15,),
                                    children: [
                                      TextSpan(text: "for software developers, devOps engineers, designers and entrepreneurs which focuses on the development of the participants by providing "
                                          "mentorship and assigning tasks to them which will help facilitate their growth.", style: TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.normal, fontFamily: "CircularStd", fontSize: 15,),
                                      children: [
                                        TextSpan(text: "\nFor more info, visit the official ", children: [
                                          TextSpan(text: "Zuri Team website.", style: TextStyle(fontSize: 15, color: kPrimaryColor, decoration: TextDecoration.underline),
                                            recognizer: TapGestureRecognizer()..onTap = () {
                                              _launch('https://zuri.team');
                                            },
                                          )
                                        ])
                                      ])
                                    ])
                              ])
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("FIRST & LAST NAME", style: TextStyle(color: Colors.black, fontSize: 12),),
                        SizedBox(height: 4,),
                        _nameForm(),
                        SizedBox(height: 25,),
                        Text("EMAIL", style: TextStyle(color: Colors.black, fontSize: 12),),
                        SizedBox(height: 4,),
                        _emailForm(),
                        SizedBox(height: 25,),
                        Text("PHONE NUMBER", style: TextStyle(color: Colors.black, fontSize: 12),),
                        SizedBox(height: 4,),
                        _phoneForm(),
                        SizedBox(height: 40,),
                        Center(
                          child: Container(width: double.maxFinite, height: 45,
                            child: ElevatedButton(
                                onPressed: () => _viewData(),
                                child: Text("View Data", style: TextStyle(fontSize: 18),)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_launch(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Not supported");
  }
}
