import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/ui/themes/colors.dart';
import 'package:project_1/app/ui/widgets/text_fied_1.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _terms = false;

  final Authen _authSign = Authen();

  @override
  void initState() {
    super.initState();
    _authSign.name.text = '';
    _authSign.email.text = '';
    _authSign.mobile.text = '';
    _authSign.password.text = '';
    _authSign.confirmPassword.text = '';
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _authSign.name.dispose();
  //   _authSign.email.dispose();
  //   _authSign.mobile.dispose();
  //   _authSign.password.dispose();
  //   _authSign.confirmPassword.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        setState(() {
          Navigator.pop(context);
        });
        return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                SplashColor.splashColor1,
                SplashColor.splashColor5,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: SingleChildScrollView(
              child: Form(
                key: _authSign.signUpKey,
                child: Column(
                  children: [
                    // Hello Text

                    SafeArea(
                      child: Container(
                          margin: const EdgeInsets.only(top: 25),
                          child: const Text(
                            'Hello',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'ITIM',
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),

                    // welcome Text

                    Container(
                        margin:
                            const EdgeInsets.only(top: 50, left: 15, right: 15),
                        child: const Text(
                          'Wellcome to Best and Easy Online Shopping Application',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'ITIM',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),

                    // name field

                    TextForm1(
                      controller: _authSign.name,
                      label: 'Name',
                      hintText: 'Enter Full Name',
                      icon: Icons.account_circle_outlined,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "* Name field required";
                        }
                        return null;
                      },

                      // obscureText: true,
                    ),

                    // Email field

                    TextForm1(
                      controller: _authSign.email,
                      label: 'Email Id',
                      hintText: 'Enter your email Id',
                      icon: Icons.email_outlined,
                      inputType: TextInputType.emailAddress,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "* Email Id field required";
                        }
                        return null;
                      },

                      // obscureText: true,
                    ),

                    // mobile number field

                    TextForm1(
                      controller: _authSign.mobile,
                      label: 'Mobile Number',
                      hintText: 'Enter mobile number',
                      icon: Icons.phone_android_outlined,
                      inputType: TextInputType.number,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "* Mobile field required";
                        }
                        // else if (data.length != 10) {
                        //   return "* Incorrect Mobile Number";
                        // }
                        return null;
                      },

                      // obscureText: true,
                    ),

                    // entered password field

                    /*
                    Container(
                      margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
                      child: TextFormField(
                        controller: _authen.enterPassword,
                        decoration: const InputDecoration(
                          label: Text('Password'),
                          hintText: 'Enter Your Password',
                          suffixIcon: Icon(Icons.password_outlined),
                        ),
                      ),
                    ),

                     */

                    TextForm1(
                      controller: _authSign.password,
                      label: 'password',
                      hintText: 'Enter Security Password',
                      icon: Icons.password_outlined,
                      obscureText: true,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "* Password field required";
                        }
                        // else if (data.length < 6) {
                        //   return "* Password atleast 6 character";
                        // }
                        return null;
                      },
                    ),

                    // confirm password field

                    TextForm1(
                      controller: _authSign.confirmPassword,
                      label: 'confirm Password',
                      hintText: 'Confirm your password',
                      icon: Icons.password_outlined,
                      obscureText: true,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "* Password field required";
                        }
                        // else if (data.length < 6) {
                        //   return "* Password atleast 6 character";
                        // }
                        else if (data != _authSign.password.text) {
                          return "* Password Not Matching";
                        }
                        return null;
                      },
                    ),

                    // terms and condition check box

                    Container(
                      height: 30,
                      margin:
                          const EdgeInsets.only(top: 80, left: 24, right: 40),
                      child: Row(
                        children: [
                          Checkbox(
                              value: _terms,
                              onChanged: (value) {
                                setState(() {
                                  _terms = !_terms;
                                });
                              }),
                          RichText(
                              text: const TextSpan(
                                  text: 'I Read and Agreed to ',
                                  style: TextStyle(color: Colors.black),
                                  children: [
                                TextSpan(
                                    text: 'Terms & Condition',
                                    style: TextStyle(
                                        color: Colors.deepPurpleAccent))
                              ]))
                        ],
                      ),
                    ),

                    // error notification
                    //
                    // Container(
                    //     height: 20,
                    //     margin:
                    //         const EdgeInsets.only(top: 40, left: 40, right: 40),
                    //     child: Text(_authSign.err1)),

                    // Sign up button

                    Container(
                      height: 50,
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          top: 55, left: 50, right: 50, bottom: 50),
                      decoration: const BoxDecoration(
                          // color: Colors.redAccent,
                          gradient: LinearGradient(
                            colors: [
                              SplashColor.splashColor1,
                              SplashColor.splashColor5,
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: TextButton(
                        style: ButtonStyle(
                            // backgroundColor: MaterialStateProperty.resolveWith(
                            //     (Set<MaterialState> states) {
                            //   if (states.contains(MaterialState.pressed)) {
                            //     return Colors.black12;
                            //   }
                            //   return const Color(0xffc72c00);
                            // }),
                            foregroundColor: MaterialStateProperty.resolveWith(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.white10;
                              }
                              return Colors.black87;
                            }),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50))))),

                        // onPressed function

                        onPressed: () {
                          if (_authSign.signUpKey.currentState!.validate()) {
                            if (_terms == true) {
                              _authSign.signUp(context);
                            } else {
                              const snackBar = SnackBar(
                                  content: Text(
                                      'Kindly Accept the Terms & Condition'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 16, fontFamily: 'itim'),
                        ),
                      ),
                    ),

                    // End space

                    // const SizedBox(
                    //   height: 40,
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
