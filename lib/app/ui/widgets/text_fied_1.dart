import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/ui/widgets/text_field_icon.dart';

class TextForm1 extends StatefulWidget {
  TextForm1({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText,
    required this.label,
    required this.icon,
    this.inputType,
  }) : super(key: key);
  final String hintText;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  late bool? obscureText;
  final IconData icon;
  final TextInputType? inputType;

  @override
  State<TextForm1> createState() => _TextForm1State();
}

class _TextForm1State extends State<TextForm1> {
  @override
  Widget build(BuildContext context) {
    widget.obscureText ??= false;
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
      child: TextFormField(
        onChanged: (data) {},
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        keyboardType: widget.inputType,
        obscureText: widget.obscureText == true ? !passwordVisible : false,
        obscuringCharacter: "*",
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: TextStyle(color: Colors.black.withAlpha(100)),
          floatingLabelStyle: TextStyle(color: Colors.black54.withAlpha(150)),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black.withAlpha(50)),
          suffixIcon: widget.obscureText == false
              ? TextFieldIcon(
                  passwordVisible: passwordVisible,
                  obscureText: widget.obscureText,
                  icons: widget.icon,
                )
              : showPassword(),
        ),
        //  decorations
        cursorColor: Colors.redAccent.withAlpha(25),
        style: TextStyle(color: Colors.black.withAlpha(250)),
      ),
    );
  }

  bool passwordVisible = false;

  Widget showPassword() {
    if (widget.obscureText == true) {
      return ButtonTheme(
          child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
        child: TextFieldIcon(
          obscureText: widget.obscureText,
          passwordVisible: passwordVisible,
          icons:
              passwordVisible == true ? Icons.visibility : Icons.visibility_off,
        ),
      ));
    } else {
      return const SizedBox.shrink();
    }
  }
}

class TextForm2 extends StatefulWidget {
  TextForm2({
    Key? key,
    required this.hintText,
    required this.controller,
    this.obscureText,
    this.validator,
    required this.label,
    required this.icon,
    this.buttonText,
    required this.onUpdateTap,
    this.inputType,
  }) : super(key: key);
  final String hintText;
  final String label;
  late bool? obscureText;
  final String? buttonText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final IconData icon;
  final TextInputType? inputType;
  final VoidCallback onUpdateTap;

  @override
  State<TextForm2> createState() => _TextForm2State();
}

class _TextForm2State extends State<TextForm2> {
  Authen _authen = Authen();
  Future verifyPassword() async {
    var currentUser = await _authen.firebaseAuth.currentUser?.email;
    var collectionId = await _authen.fireStore.collection('User').get();
    var docLength = collectionId.size;
    int i = 0;
    // To Change Value in FireStore
    for (int j = 0; j < docLength; j++) {
      var docId =
          await _authen.fireStore.collection('User').doc('user_$j').get();
      var savedEmail = docId.data();

      print(
          'current user : $currentUser and saved user : ${savedEmail?['email']}');

      if (currentUser == savedEmail?['email']) {
        if (_authen.confirmPassword.text.isNotEmpty &&
            _authen.confirmPassword.text.length > 1) {
          dynamic userDetail =
              await _authen.fireStore.collection('User').doc('user_$j');
          var userPassword = savedEmail?['password'];

          if (userPassword == _authen.confirmPassword.text) {
            setState(() {
              passwordVisible = !passwordVisible;
              _authen.confirmPassword.text = "";
              Navigator.pop(context);
            });
          } else {
            const errorMessage = SnackBar(
                duration: Duration(milliseconds: 500),
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                behavior: SnackBarBehavior.floating,
                padding: EdgeInsets.all(10),
                content: Text(
                  "Password not Matching with Current Password",
                  style: TextStyle(fontSize: 14),
                ));
            return ScaffoldMessenger.of(context).showSnackBar(errorMessage);
          }
        } else {
          const errorMessage = SnackBar(
              duration: Duration(milliseconds: 500),
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              behavior: SnackBarBehavior.floating,
              padding: EdgeInsets.all(10),
              content: Text(
                "Confirm Password field is Empty",
                style: TextStyle(fontSize: 14),
              ));
          return ScaffoldMessenger.of(context).showSnackBar(errorMessage);
        }
      }

      i++;
    }
  }

  @override
  void initState() {
    super.initState();
    _authen.confirmPassword.text = "";
  }

  @override
  Widget build(BuildContext context) {
    widget.obscureText ??= false;
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: TextFormField(
        onChanged: (data) {},
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        keyboardType: widget.inputType,
        autofocus: false,
        obscureText: widget.obscureText == true ? !passwordVisible : false,
        obscuringCharacter: "*",
        controller: widget.controller,
        decoration: InputDecoration(
            label: Text(widget.label),
            labelStyle: TextStyle(color: Colors.black.withAlpha(100)),
            floatingLabelStyle: TextStyle(color: Colors.black54.withAlpha(150)),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.black.withAlpha(50)),
            suffixIcon: Container(
              width: 135,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.obscureText == false ? Container() : showPassword(),
                  Container(
                    child: TextButton(
                      onPressed: widget.onUpdateTap,
                      child: Text(
                        widget.buttonText ?? "update",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        //  decorations
        cursorColor: Colors.redAccent.withAlpha(25),
        style: TextStyle(color: Colors.black.withAlpha(250)),
      ),
    );
  }

  bool passwordVisible = false;

  Widget showPassword() {
    if (widget.obscureText == true) {
      return ButtonTheme(
          child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
          if (passwordVisible == false) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Confirm your Password',
                      textAlign: TextAlign.center,
                    ),
                    content: TextForm3(
                      controller: _authen.confirmPassword,
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
                    actions: [
                      TextButton(
                          onPressed: () {
                            _authen.confirmPassword.text = "";

                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      TextButton(
                          onPressed: () {
                            verifyPassword();
                          },
                          child: const Text("Verify")),
                    ],
                  );
                });
          }

          if (passwordVisible == true) {
            print(passwordVisible);
            setState(() {
              passwordVisible = !passwordVisible;
            });
          }

          // setState(() {
          //   passwordVisible = !passwordVisible;
          // });
        },
        child: TextFieldIcon(
          obscureText: widget.obscureText,
          passwordVisible: passwordVisible,
          icons:
              passwordVisible == true ? Icons.visibility : Icons.visibility_off,
        ),
      ));
    } else {
      return const SizedBox.shrink();
    }
  }
}

class TextForm3 extends StatefulWidget {
  TextForm3({
    Key? key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText,
    required this.label,
    required this.icon,
    this.inputType,
  }) : super(key: key);
  final String hintText;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  late bool? obscureText;
  final IconData icon;
  final TextInputType? inputType;

  @override
  State<TextForm3> createState() => _TextForm3State();
}

class _TextForm3State extends State<TextForm3> {
  @override
  Widget build(BuildContext context) {
    widget.obscureText ??= false;
    return Container(
      child: TextFormField(
        onChanged: (data) {},
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        keyboardType: widget.inputType,
        obscureText: widget.obscureText == true ? !passwordVisible : false,
        obscuringCharacter: "*",
        controller: widget.controller,
        decoration: InputDecoration(
          label: Text(widget.label),
          labelStyle: TextStyle(color: Colors.black.withAlpha(100)),
          floatingLabelStyle: TextStyle(color: Colors.black54.withAlpha(150)),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black.withAlpha(50)),
          suffixIcon: widget.obscureText == false
              ? TextFieldIcon(
                  passwordVisible: passwordVisible,
                  obscureText: widget.obscureText,
                  icons: widget.icon,
                )
              : showPassword(),
        ),
        //  decorations
        cursorColor: Colors.redAccent.withAlpha(25),
        style: TextStyle(color: Colors.black.withAlpha(250)),
      ),
    );
  }

  bool passwordVisible = false;

  Widget showPassword() {
    if (widget.obscureText == true) {
      return ButtonTheme(
          child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
        child: TextFieldIcon(
          obscureText: widget.obscureText,
          passwordVisible: passwordVisible,
          icons:
              passwordVisible == true ? Icons.visibility : Icons.visibility_off,
        ),
      ));
    } else {
      return const SizedBox.shrink();
    }
  }
}
