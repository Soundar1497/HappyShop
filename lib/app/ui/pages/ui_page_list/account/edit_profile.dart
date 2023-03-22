import 'package:flutter/material.dart';
import 'package:project_1/app/controllers/authentication.dart';
import 'package:project_1/app/controllers/carousel_control.dart';
import 'package:project_1/app/ui/widgets/text_fied_1.dart';
import 'package:provider/provider.dart';

import '../../../widgets/circular_icon_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  CarouselListener _listener = CarouselListener();

  Authen _authen = Authen();

  String? cur_name;
  String? cur_mobile;
  String? cur_email;
  String? cur_password;

  // Future GetUserDetail() async {
  //   _authen.userData;
  //   dynamic currentEmail = await _authen.firebaseAuth.currentUser?.email;
  //
  //   // print(currentEmail);
  //
  //   dynamic userDetail =
  //       await _authen.fireStore.collection('User').doc('UserDetail').get();
  //   dynamic userValue = userDetail.data() as Map<String, dynamic>;
  //
  //   // print(userValue['password']);
  //   // print(userValue['email']);
  //   // print(userValue['user_name']);
  //   // print(userValue['mobile']);
  //
  //   _authen.email.text = userValue['email'];
  //   _authen.name.text = userValue['user_name'];
  //   _authen.password.text = userValue['password'];
  //   _authen.mobile.text = userValue['mobile'];
  // }
  //

  Future verifyPassword() async {
    bool verify = false;
    print('verify start and 1 is : $verify');
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
              _authen.confirmPassword.text = "";
              Navigator.pop(context);
              verify = true;
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
        break;
      }

      i++;
    }

    print('verify end and 2 is : $verify');

    return verify;
  }

  Future updateDetail(keyValue, value) async {
    String? currentValue;
    String? errorValue;
    String? successValue;

    switch (keyValue) {
      case 'name':
        {
          currentValue = cur_name;
          errorValue = 'Name Not Changed !';
          successValue = 'Name successfully updated';
        }
        break;
      case 'mobile':
        {
          currentValue = cur_mobile;
          errorValue = 'Mobile Number Not Changed !';
          successValue = 'Mobil Number successfully updated';
        }
        break;
      case 'email':
        {
          currentValue = cur_email;
          errorValue = 'Email ID Not Changed !';
          successValue = 'Email Id successfully updated';
        }
        break;
      case 'password':
        {
          currentValue = cur_password;
          errorValue = 'Password Not Changed !';
          successValue = 'Password successfully updated';
        }
    }

    print('current key value  =  $currentValue and value  = $value');

    if (currentValue != value) {
      print(
          'If condition true, then current key value  =  $currentValue and value  = $value');

      var currentUser = await _authen.firebaseAuth.currentUser?.email;
      var collectionId = await _authen.fireStore.collection('User').get();
      var docLength = collectionId.size;

      print("document length : $docLength");

      int i = 0;
      // To Change Value in FireStore
      for (int j = 0; j < docLength; j++) {
        var docId =
            await _authen.fireStore.collection('User').doc('user_$j').get();
        var savedEmail = docId.data();

        print('document data for j value $j : $savedEmail');
        print('current User Email Id : $currentUser');
        print('active document email Id : ${savedEmail?['email']}');
        if (currentUser == savedEmail?['email']) {
          dynamic userDetail =
              await _authen.fireStore.collection('User').doc('user_$j');

          if (keyValue == 'email' || keyValue == 'password') {
            if (keyValue != null) {
              return showDialog(
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
            var verifyValue = await verifyPassword();
            if (verifyValue == true) {
              print(
                  "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
              userDetail.update({'$keyValue': '$value'}).then((_) async {
                //
                switch (keyValue) {
                  case 'name':
                    {
                      cur_name = value;
                    }
                    break;
                  case 'mobile':
                    {
                      cur_mobile = value;
                    }
                    break;
                  case 'email':
                    {
                      cur_email = value;
                    }
                    break;
                  case 'password':
                    {
                      cur_email = value;
                    }
                    break;
                }

                //

                //

                final successMessage = SnackBar(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    behavior: SnackBarBehavior.floating,
                    padding: EdgeInsets.all(10),
                    content: Text(
                      "$successValue",
                      style: TextStyle(fontSize: 14),
                    ));
                return ScaffoldMessenger.of(context)
                    .showSnackBar(successMessage);
              }).catchError((error) => print('Failed: $error'));

              if (keyValue == 'email') {
                print(' ========== Entered email editing option ========');
                var user = _authen.firebaseAuth.currentUser;
                await user?.updateEmail('$value').then((_) {
                  print(
                      'current user email Id "$cur_email" was changed successfully to "$value"');
                  return showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Center(
                        child: AlertDialog(
                          title: const Text(
                            'Email ID Updated',
                            textAlign: TextAlign.center,
                          ),
                          content: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'Kindly SignUp Again ...',
                            ),
                          ),
                          actions: [
                            Center(
                              child: TextButton(
                                  onPressed: () => _authen.signOut(context),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 30, right: 30),
                                    child: Text(
                                      "Sign Out",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }).catchError((err) => print('Failed: $err'));
              }

              if (keyValue == 'password') {
                print(' ========== Entered password editing option ========');
                var user = _authen.firebaseAuth.currentUser;
                await user?.updatePassword('$value').then((_) {
                  print(
                      'current user password "$cur_password" was changed successfully to "$value"');
                  return showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Center(
                        child: AlertDialog(
                          title: const Text(
                            'Password Changed',
                            textAlign: TextAlign.center,
                          ),
                          content: const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              'Kindly SignUp Again ...',
                            ),
                          ),
                          actions: [
                            Center(
                              child: TextButton(
                                  onPressed: () => _authen.signOut(context),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 30, right: 30),
                                    child: Text(
                                      "Sign Out",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }).catchError((err) => print('Failed: $err'));
              }
            }
          } else {
            userDetail.update({'$keyValue': '$value'}).then((_) async {
              //
              switch (keyValue) {
                case 'name':
                  {
                    cur_name = value;
                  }
                  break;
                case 'mobile':
                  {
                    cur_mobile = value;
                  }
                  break;
                case 'email':
                  {
                    cur_email = value;
                  }
                  break;
                case 'password':
                  {
                    cur_email = value;
                  }
                  break;
              }

              //

              //

              final successMessage = SnackBar(
                  duration: Duration(milliseconds: 500),
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  behavior: SnackBarBehavior.floating,
                  padding: EdgeInsets.all(10),
                  content: Text(
                    "$successValue",
                    style: TextStyle(fontSize: 14),
                  ));
              return ScaffoldMessenger.of(context).showSnackBar(successMessage);
            }).catchError((error) => print('Failed: $error'));
          }

          //

          print("........ Data Assign Successfully .........");
          print('KeyValue of "$keyValue" was changed successfully');
          break;
        }
        i++;
      }

      //  To change value in Firebase Authentication
    } else {
      final errorMessage = SnackBar(
          duration: Duration(milliseconds: 500),
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(10),
          content: Text(
            "$errorValue",
            style: TextStyle(fontSize: 14),
          ));
      return ScaffoldMessenger.of(context).showSnackBar(errorMessage);
    }
  }

  @override
  void initState() {
    super.initState();
    //gender image fuction
    _listener.genderEdit = false;
    _listener.GenderValueGet();

    //initial form value assign
    _authen.userData;
    cur_name = _authen.name.text;
    cur_email = _authen.email.text;
    cur_mobile = _authen.mobile.text;
    cur_password = _authen.password.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 147, 163, 1.0),
        title: const Text("Edit Profile"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<CarouselListener>(
          create: (context) => CarouselListener(),
          child: Consumer<CarouselListener>(
            builder: (context, gender, child) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(245, 147, 163, 1.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(1, .3),
                                  blurRadius: 5,
                                  spreadRadius: 2)
                            ]),
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 28),
                          child: gender.genderEdit
                              ? gender.gender
                                  ? GenderCircleImage(
                                      onTap: () {
                                        gender.genderEdit = !gender.genderEdit;
                                        gender.gender = true;
                                      },
                                      imageProvider: const NetworkImage(
                                          "https://i.pinimg.com/236x/d3/7b/02/d37b020e87945ad7f245e48df752ed03.jpg"))
                                  : GenderCircleImage(
                                      onTap: () {
                                        gender.genderEdit = !gender.genderEdit;
                                        gender.gender = false;
                                      },
                                      imageProvider: const NetworkImage(
                                          "https://i.pinimg.com/236x/a9/a4/fb/a9a4fb5ba7d2f73907f5b4aefbed1b3a.jpg"))
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                      GenderCircleImage2(
                                          onTap: () {
                                            gender.genderEdit =
                                                !gender.genderEdit;
                                            gender.gender = true;
                                            gender.GenderValueSet();
                                          },
                                          imageProvider: const NetworkImage(
                                              "https://i.pinimg.com/236x/d3/7b/02/d37b020e87945ad7f245e48df752ed03.jpg")),
                                      const SizedBox(
                                        width: 50,
                                        child: Text(
                                          "Select Your Gender",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      ),
                                      GenderCircleImage2(
                                          onTap: () {
                                            gender.genderEdit =
                                                !gender.genderEdit;
                                            gender.gender = false;
                                            gender.GenderValueSet();
                                          },
                                          imageProvider: const NetworkImage(
                                              "https://i.pinimg.com/236x/a9/a4/fb/a9a4fb5ba7d2f73907f5b4aefbed1b3a.jpg"))
                                    ]),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextForm2(
                          hintText: 'Enter your Full Name :',
                          controller: _authen.name,
                          label: "Full Name",
                          icon: Icons.account_circle,
                          onUpdateTap: () {
                            updateDetail('name', _authen.name.text);
                          }),
                      TextForm2(
                        hintText: 'Enter your Working Mobile  :',
                        controller: _authen.mobile,
                        label: 'Mobile Number',
                        icon: Icons.account_circle,
                        onUpdateTap: () {
                          updateDetail("mobile", _authen.mobile.text);
                        },
                      ),
                      TextForm2(
                        hintText: 'Enter your Email Id :',
                        controller: _authen.email,
                        label: 'Email ID',
                        icon: Icons.account_circle,
                        onUpdateTap: () {
                          updateDetail("email", _authen.email.text);
                        },
                      ),
                      TextForm2(
                        hintText: 'Enter your Password :',
                        controller: _authen.password,
                        label: 'Password',
                        icon: Icons.account_circle,
                        obscureText: true,
                        buttonText: 'Change',
                        onUpdateTap: () {
                          updateDetail("password", _authen.password.text);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

// Gender circular Image With Editing Icon

class GenderCircleImage extends StatefulWidget {
  const GenderCircleImage(
      {Key? key, required this.onTap, required this.imageProvider})
      : super(key: key);

  final VoidCallback onTap;
  final ImageProvider imageProvider;

  @override
  State<GenderCircleImage> createState() => _GenderCircleImageState();
}

class _GenderCircleImageState extends State<GenderCircleImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,
      height: 150,
      color: Colors.transparent,
      child: Stack(children: [
        Container(
          width: 130,
          height: 130,
          color: Colors.transparent,
          child: CircleAvatar(
            backgroundImage: widget.imageProvider,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(150)),
                onTap: widget.onTap,
              ),
            ),
          ),
        ),
        CircularIconButton(
          padding: EdgeInsets.only(top: 95, left: 90),
          onTap: widget.onTap,
          radius: 30,
          icon: Icons.edit,
          iconColor: const Color.fromRGBO(100, 100, 100, 1),
          iconSize: 24,
          backgroungColor: const Color.fromRGBO(230, 230, 230, 1),
        ),
      ]),
    );
  }
}

// Gender circular Image Without Editing Icon

class GenderCircleImage2 extends StatefulWidget {
  const GenderCircleImage2(
      {Key? key, required this.onTap, required this.imageProvider})
      : super(key: key);

  final VoidCallback onTap;
  final ImageProvider imageProvider;

  @override
  State<GenderCircleImage2> createState() => _GenderCircleImage2State();
}

class _GenderCircleImage2State extends State<GenderCircleImage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150,
      height: 150,
      color: Colors.transparent,
      child: Container(
        width: 130,
        height: 130,
        color: Colors.transparent,
        child: CircleAvatar(
          backgroundImage: widget.imageProvider,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(150)),
              onTap: widget.onTap,
            ),
          ),
        ),
      ),
    );
  }
}
