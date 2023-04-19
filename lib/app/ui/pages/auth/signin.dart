import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/ui/themes/colors.dart';
import 'package:project_1/app/ui/widgets/text_fied_1.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authen _authSign = Authen();

  bool _terms = false;

  @override
  void initState() {
    super.initState();
    _authSign.inEmail.text = '';
    _authSign.inPassword.text = '';
  }

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
                key: _authSign.signInKey,
                child: Column(
                  children: [
                    // Sign In text

                    SafeArea(
                      child: Container(
                          margin: const EdgeInsets.only(top: 25),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontFamily: 'ITIM',
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),

                    // welcome again Text

                    Container(
                        margin: const EdgeInsets.only(
                            top: 50, left: 15, right: 15, bottom: 150),
                        child: Text(
                          'Again Welcome back to Best and Easy Online Shopping Application',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontFamily: 'ITIM',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),

                    // Email field

                    TextForm1(
                      controller: _authSign.inEmail,
                      label: 'Email Id',
                      hintText: 'Enter Your Registered Mail Id',
                      icon: Icons.account_circle_outlined,
                      validator: (data) {
                        if (data!.isEmpty || data == "") {
                          return "* Email Id required";
                        }
                        return null;
                      },
                    ),

                    // entered password field

                    TextForm1(
                      controller: _authSign.inPassword,
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

                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: MediaQuery.of(context).size.width - 190,
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forget Password',
                            textAlign: TextAlign.right,
                          )),
                    ),

                    // remeberme check box

                    Container(
                      height: 30,
                      margin: const EdgeInsets.only(
                          top: 10, left: 24, right: 40, bottom: 10),
                      child: Row(
                        children: [
                          Checkbox(
                              value: _terms,
                              onChanged: (value) {
                                setState(() {
                                  _terms = !_terms;
                                });
                              }),
                          const Text('Remember Me'),
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
                      margin: EdgeInsets.only(
                          top: 120, left: 50, right: 50, bottom: 50),
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
                          if (_authSign.signInKey.currentState!.validate()) {
                            _authSign.signIn(context);
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
