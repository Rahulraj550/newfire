import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Phonehome extends StatefulWidget {
  const Phonehome({super.key});

  @override
  State<Phonehome> createState() => _PhonehomeState();
}

class _PhonehomeState extends State<Phonehome> {
  TextEditingController phoneControllr =TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth =FirebaseAuth.instance;
  bool isOtpVisible =false;
  User? user;
  String varificationID ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 100,top: 50),
            child: Text("phoneauth",style: TextStyle(fontSize: 30,color: Colors.red,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70,top: 30,right: 70),
            child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 70,top: 30,right: 70),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.visibility_off),
                  hintText: "passward",
                  labelText: "passward",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))
              ),
            ),
          ),
          SizedBox(height: 50,),
          ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green[200],foregroundColor: Colors.red),
              onPressed:(){
              },child:Text("login")),
          Padding(
            padding: const EdgeInsets.only(top:50),
            child: TextButton(onPressed: (){}, child:Text("Not a user? create an account...!" )),
          ),
          Visibility(child: Text('data')),
          MaterialButton(
            color: Colors.indigo,
              onPressed:(){} )
        ],
        ),
      ),
    );
  }

  void loginWithPhone()async{
    auth.verifyPhoneNumber(
      phoneNumber: "+91"+phoneControllr.text,
        verificationCompleted: (PhoneAuthCredential credential) async{
        await auth.signInWithCredential(credential).then(value){
          print("you are login");
        });
        },
        verificationFailed: (FirebaseAuthException e){
        print(e.message);
        },
        codeSent: String verificationId,int? resendToken){
      isOtpVisiblity =true;
      varificationID = varificationID;
      setState(() {
      });
    },
    codeAutoRetrievalTimeout:
    (String varification){

    },
    );
}
void varifyOTP() async {
    phoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpController.text);
   await auth.signInWithCredential).then ((value)) {
  setState((){
    user = FirebaseAuth.instance.currentUser;
  });
  },
  ).whenComplete(
  (){
if(user != null){
  Fluttertoast.showToast(msg: "your are logged in successfully"),
toastLength:Toast.LENGTH_SHORT,
gravity:ToastGravity.BOTTOM,
timeInSecForIosWeb:1,
  backgroundColor:Colors.red,
  textColor:Color.white,

}
else{
  Fluttertoast.showToast(
  msg: "your login is faild",
toastLength:
  ),

}

