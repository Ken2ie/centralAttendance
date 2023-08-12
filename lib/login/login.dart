import 'dart:convert';
import 'package:class_attendance_app/api_services/getUserInfo.dart';
import 'package:class_attendance_app/dashboard/dashboard.dart';
import 'package:class_attendance_app/login/register.dart';
import 'package:class_attendance_app/components/navigator.dart';
import 'package:class_attendance_app/login/registerSecond.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dashboard/tabs/home.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontoller = TextEditingController();
  final passwordcontoller = TextEditingController();

  // Pocketbase Connection
  
  @override
  Widget build(BuildContext context) {
    return  
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container( 
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
          child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  RegisterSecond()),
                       );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/svg/register.svg'),
                      SizedBox(width: 10,),
                      Text('Register',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.red[900]
                      ),)
                    ],
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.only(top: 50, right: 40),
                  child: Image.asset('assets/cu-logo.png',
                width: 50,
                height: 50,
                ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Login',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 10),
                const Text('Welcome to the CU attendance Management App.'),
                const SizedBox(height: 40),
                Column(
                 children: [
                 TextFormField(
                  controller: emailcontoller,
                  decoration: const InputDecoration(
                    hintText: 'Student E-mail',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordcontoller,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                  ),
                ),
                // Center(
                //       child:
                //       Container( 
                //         margin: const EdgeInsets.only(top: 50),
                //         width: 130,
                //         height: 40,
                //         child: InkWell(
                //     child: ElevatedButton(
                //     onPressed: () {
                //       login(emailcontoller.text.toString(), passwordcontoller.text.toString());
                //         // Navigator.of(context).pushReplacementNamed('/navigator');
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.red[900],
                //       disabledForegroundColor: Colors.black.withOpacity(0.38), disabledBackgroundColor: Colors.black.withOpacity(0.12),
                //       shape: const RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //       ),
                //     ),

                //     child: const Text('Login',
                //     style: TextStyle(
                //       fontFamily: 'Poppins',
                //       fontSize: 20
                //     )),
                //   ),
                // ),
                //       ),
                //     ),
              ],
            ),
              ],
            ),
          //  const SizedBox(height: 100),
              Container(
                  // margin: EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                    onTap: (){
                      login();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 14,
                      decoration: BoxDecoration(
                        color: Colors.red[900],
                        borderRadius: BorderRadius.circular(10) 
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),
                ), 
                // const SizedBox(height: 20,),
                TextButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  RegisterSecond()),
                       );
                }, 
                
                child: Text('Have not joined us yet? Please register now.',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  decoration: TextDecoration.underline
                ),
                )
                ),
            // Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            //   const Text('Powered by'),
            //   const SizedBox(width: 10,),
            //   Image.asset('assets/Black.png', 
            //   width: 70,
            //   height: 70
            //   )
            // ],
            // )
          ],
          )
        ),
      );
  }

  void login() async {

  
  try{
    
    if(emailcontoller != '' && passwordcontoller != ''){
      Response response = await post(
      Uri.parse('https://centralattendance.fly.dev/api/collections/students/auth-with-password'),
      headers: {
        'Application' : "application/json; charset=UTF-8"
      },
      body: {
        'identity' : emailcontoller.text,
        'password' : passwordcontoller.text
      }
    );
    

    if(response.statusCode == 200){


    Navigator.of(context).pushReplacementNamed('/dashboard');
      //  Retrive Data after login
      var data = jsonDecode(response.body.toString());
      var record = data['record'];
      var token = data['token'];
      var userid = record['id'];
      var userYear = record['year'];
      var userProgram = record['program'];
      var emailInfo = record['email'];
      print(data['token']);
      // print(userid);
      print('Login successfully');
      // Save logged in data received (Student ID)

       /* Login Token */

       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('token', data['token']);

      //  student Info
       SharedPreferences student = await SharedPreferences.getInstance();
       student.setString('studentProgram', userProgram);
      
      //  student Info
       SharedPreferences email = await SharedPreferences.getInstance();
       student.setString('email', emailInfo);
      //  print(email);
      

       SharedPreferences studentYear = await SharedPreferences.getInstance();
       student.setString('studentYear', userYear);

       /* Login Token */
       SharedPreferences userID = await SharedPreferences.getInstance();
       prefs.setString('userID', userid);
       SharedPreferences userrcord = await SharedPreferences.getInstance();
       prefs.setString('records', record);
       StudentInfoService.getUserInfo();


      /* Routing to Dashboard if login is Successful */

    //   Navigator.of(context).pop();
    //   Navigator
    //   .of(context)
    //   .pushReplacement(
    //   MaterialPageRoute(
    //   builder: (BuildContext context) => Dashboard(
    //    userAccesstoken: token,
    //    )
    //  )
    // );

        


    }else {
      var error = jsonDecode(response.body.toString());
      var errorData = error['message'];
      // var errorPasswordMessage = errorData['password'];
      // var passwordErrorMessage = errorPasswordMessage['message'];
      print(error);
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorData.toString()), backgroundColor: Colors.red[900],));
    }
  }else{
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Cannot be Empty'), backgroundColor: Colors.red[900],));
  }
  }catch(e){
    print(e.toString());
  }
}

}