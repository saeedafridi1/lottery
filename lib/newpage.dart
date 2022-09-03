import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'constant.dart';
TextEditingController _Textcontroler =TextEditingController();

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override

  var intValue = 0;
  numbergenrator randomenumber = numbergenrator();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30),
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xff00203F),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  RichText(text: TextSpan(
                    text: "Lottery" ,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 30,color: Colors.white),
                    children: const [

                      TextSpan(
                        text: " Game",style: TextStyle(color: Colors.deepPurple,fontSize: 30)
                      )
                    ]
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Created By Saeed Afridi",
                    style: TextStyle(
                        fontFamily: 'DynaPuff',
                        color: Colors.white,
                        fontSize: 15),
                  ),
                ],
              ),
            ),

            ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 200),
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),

                  child: Column(
                    children: [
                      const SizedBox(height: 100,),
                      const Text("Please select your favorite Number \n between  0 to 9 ",textAlign: TextAlign.center,),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          primary: const Color(0xff00203F),
                        ),
                        onPressed: (){
                          setState(() {
                            showAlertDialog(context);
                          });
                        },
                        child: const Text("Select"),
                      ),
                      const SizedBox(
                        height: 40,
                      ),

                      Container(

                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:const Color(0xff600203F),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                                color: Color(0xC3555557),
                                blurRadius: 15,
                                offset: Offset(0, 30))
                          ],

                        ),

                        child: intValue.toString() == _Textcontroler.text
                            ? Container(
                             decoration: const BoxDecoration(
                               color: Color(0xa95b83c2)
                             ),
                              child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              const Icon(
                                Icons.done_all,
                                size: 40,
                                color: Colors.green,
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              Text(
                                "Congratulation You Have won the lottery app,\n  Your Number is $intValue",
                                textAlign: TextAlign.center, style: const TextStyle(color: Colors.white),
                              )
                          ],
                        ),
                            )
                            :Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              const Icon(
                                Icons.error,
                                size: 40,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "batter luck next time Your Number is \n  $intValue try again ; ",
                                textAlign: TextAlign.center,style: const TextStyle(color: Colors.white),
                              )
                          ],
                        ),
                            ),

                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 150, left: 40, right: 40),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.95))
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text(
                    "Lottery winning number is",
                    textAlign: TextAlign.center,
                    style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  _Textcontroler.text =="" ?const Text(
                   "0",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ):
                  Text(
                    _Textcontroler.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff00203F),
        onPressed: () {
          setState(() {
            _Textcontroler.text =="" ?
              showSnackBar(context):intValue = Random().nextInt(10);


          });
        },
        child: const Icon(
          Icons.refresh_outlined,
        ),
      ),
    );
  }
}
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Enter Your Lucky Number "),
    content: Container(
      child: TextFormField(
        autofocus:true,
        maxLength: 1,
        keyboardType: TextInputType.number,
        controller: _Textcontroler,
        decoration: InputDecoration(
            fillColor: const Color(0xffF8F9FA),
            filled: true,
            hintText: "Enter Your Lucky Number  ",
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(20))),
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
void showSnackBar(BuildContext context) {
  final snackBar = const SnackBar(
    content: Text('Please First Select Your Favorite Number '),
    backgroundColor:  const Color(0xff00203F),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(bottom: 10,left: 30,right: 30),
    elevation: 20,
      shape: StadiumBorder()
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

