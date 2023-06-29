import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../reusable_widgets/reusable.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _confirmPassword.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }
  void createAccount() async {
    String email = _emailTextController.text.trim();
    String password = _passwordTextController.text.trim();
    String cPassword = _confirmPassword.text.trim();
    // create new account

    if (password != cPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: const [
              // Icon(icon, color: Colors.white),
              SizedBox(width: 8.0),
              Text("Passwords aren't matching"),
            ],
          ),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      try {
        FocusScope.of(context).unfocus();
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        Future addUserDetails(String email,String name, String med, String dob) async {
          final FirebaseAuth auth = FirebaseAuth.instance;

          final User? user = auth.currentUser;
          final uid = user!.uid;

          final result= await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
            'email':email,
            'fullname': name,
            'medical condition': med,
            'dob': dob,
            'uid': uid,
            
            });//print("Welcome to Physioplay");
          // final result =
          //     await FirebaseFirestore.instance.collection('users').add({
          //   'email':email,
          //   'fullname': name,
          //   'medical condition': med,
          //   'dob': dob,
          // });
         // print(result.uid);
          //print(result);
        }
    
        addUserDetails(
          _emailTextController.text.trim(),
          _controller1.text.trim(),
          _controller2.text.trim(),
          _controller3.text.trim(),
        );

        print("User created");

        if (userCredential.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: const [
                  // Icon(icon, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text("Successfully Created Account"),
                ],
              ),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        print(e.code.toString());
        String errorMessage;
        if (e.code == 'weak-password') {
          errorMessage = 'The password provided is too weak';
        } else if (e.code == 'email-already-in-use') {
          errorMessage = 'The account already exists for that email';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'The email provided is invalid';
        } else if (e.code == 'operation-not-allowed') {
          errorMessage = 'Account creation is not allowed';
        } else {
          errorMessage = 'Error creating account';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                // Icon(icon, color: Colors.white),
                SizedBox(width: 8.0),
                Text(errorMessage),
              ],
            ),
            backgroundColor: Colors.red,
          ),
        );
        
        //String email1=_emailTextController.text.trim();
         //final String email2=email1;
         //_SignUpScreenState(this.email2);
      }
    }
  }

  @override
  Widget build1(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
/*Future insert() async{
    // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text.trim(),
    // password: _passwordTextController.text.trim());


   addsignupdetails(_controller.text.trim(),_controller1.text.trim(),
  _controller2.text.trim(),_controller3.text.trim());

  }

Future addsignupdetails(String dob,String medcon,String phno,String fullname)async{
  await FirebaseFirestore.instance.collection('users').add(
    {'dob': dob,
    //'email': username,
    'fullname': fullname,
    'medcon': medcon,
    //'password': password,
    'phno': phno,
    //'username': username,

    }
  );
}*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor('20539E'),
          hexStringToColor('20797C'),
          hexStringToColor('209E5A')
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * .2, 20, 0),
            child: Column(
              children: <Widget>[
                // const SizedBox(
                //   height: 10,
                // ),
                reusableTextField("Enter Email", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Username", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField1(
                  "Enter Password",Icons.person_outline,
                  false, _passwordTextController,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField1("Confirm Password", Icons.password, false,
                    _confirmPassword),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Full Name", Icons.person_outline,
                    false, _controller1),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Medical Condition",
                    Icons.medical_information, false, _controller2),
                    const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Date of Birth", Icons.date_range,
                    false, _controller3),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 20,
                ),
                new SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {
                      createAccount();
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        print("Created New Account");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }).onError((error, stackTrace) {
                        print("Error ${error.toString()}");
                      });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const HomeScreen()));
                    },
                    child: Text(
                      'SIGN UP',
                      style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return Colors.white;
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}