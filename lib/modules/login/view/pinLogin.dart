import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:pos/main.dart';
import 'package:pos/models/enterPin/UserToken.dart';
import 'package:pos/services/api.dart';
import 'package:pos/user_details.dart';


class PinLogin extends StatefulWidget {
  const PinLogin({super.key});

  @override
  State<PinLogin> createState() => _PinLoginState();
}

class _PinLoginState extends State<PinLogin> {
  var arrPin = [];
  var strpin = '';
  List <dynamic> exampleList =  [1,2,3,4];
  var isLoading = false;
  late Timer _timer;
  var dateTime = '';

  

  @override
  void dispose() {
      _timer.cancel();
      super.dispose();
  }

  
  pinEnter(int tag){
    setState(() {
      arrPin.add('$tag');
      strpin = strpin + '$tag';
    });
    log('${arrPin}');
  }

  submit(){
    if (arrPin.length <=5){
      return;
    }else{
      setState(() {
        isLoading = true;
      });
      Future<UserToken> user = api().submitPin(strpin) as Future<UserToken>;
        user.then((value) => {setState(() {
        isLoading = false;
        log('user token is ${value.token}');
        UserInfo.shared.info = value;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      })});
           
    }
  }
  
  @override
  void initState() {
    log('init state called');
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
         DateTime localTime = DateTime.now();
         dateTime = DateFormat('hh:mm a MMM dd,yyyy').format(localTime);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    if(isLoading == false){
      return Scaffold(
      appBar: AppBar(
        title: Text("POS"),
        
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Expanded(
              flex: 1,
              child:Container(
                color: Color.fromRGBO(43, 47, 69, 1),
                child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(dateTime, style: TextStyle(fontSize: 25, color: Colors.white),),
                    
                  ],
                ),
            ),
              )),
          ),
          Expanded(
            flex: 1,
            child:Container(
              color: Color.fromRGBO(43, 47, 69, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            for (int i=0; i<arrPin.length; i++) Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.radio_button_on_rounded, color: Colors.white),
                  SizedBox(width: 10,),
                ],
              ),
             
            ),Spacer()
          ],
        ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (() => pinEnter(1)), child: Text('1', style: TextStyle(fontSize: 25),)),
                    TextButton(onPressed: (() => pinEnter(2)), child: Text('2', style: TextStyle(fontSize: 25))),
                    TextButton(onPressed: (() => pinEnter(3)), child: Text('3', style: TextStyle(fontSize: 25))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (() => pinEnter(4)), child: Text('4', style: TextStyle(fontSize: 25))),
                    TextButton(onPressed: (() => pinEnter(5)), child: Text('5', style: TextStyle(fontSize: 25))),
                    TextButton(onPressed: (() => pinEnter(6)), child: Text('6', style: TextStyle(fontSize: 25))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (() => pinEnter(7)), child: Text('7', style: TextStyle(fontSize: 25))),
                    TextButton(onPressed: (() => pinEnter(8)), child: Text('8', style: TextStyle(fontSize: 25))),
                    TextButton(onPressed: (() => pinEnter(9)), child: Text('9', style: TextStyle(fontSize: 25))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (() => {}), child: Text('<', style: TextStyle(fontSize: 25))),
                    TextButton(onPressed: (() => pinEnter(0)), child: Text('0', style: TextStyle(fontSize: 25))),
                    TextButton(onPressed: (() => {}), child: Text('x', style: TextStyle(fontSize: 25))),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (() => {submit()}), child: Text('Submit', style: TextStyle(fontSize: 25))),
                    
                  ],
                )
              ],
          ),
            ))
        ],
      ),
    );
    }else{
      return Scaffold(
        appBar: AppBar(
        title: Text("POS"),
      ),
        body: Container(
          color: Color.fromRGBO(43, 47, 69, 1),
          child: Center(
            
            child: CircularProgressIndicator(),
          ),
        ),
      ); 
    }
    
  }
}
class PinArrView extends StatelessWidget {
   PinArrView({super.key,  required this.arrCount});
  final int arrCount;
  @override
  Widget build(BuildContext context) {
    return Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i=0; i<arrCount; i++) Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.radio_button_on_rounded, color: Colors.white),
                  SizedBox(width: 10,),
                ],
              ),
            )
          ],
        ),
      );
  }
}