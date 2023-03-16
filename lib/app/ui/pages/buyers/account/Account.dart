import 'package:flutter/material.dart';

import '../../../../controllers/authentication.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final Authen _authSign = Authen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Stack(children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(
                            MediaQuery.of(context).size.width / 2, 60),
                        bottomRight: Radius.elliptical(
                            MediaQuery.of(context).size.width / 2, 60),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  height: 130,
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(300.0),
                        clipBehavior: Clip.antiAlias,
                        child: Image(image: AssetImage("assets/app_logo.png"))),
                  ),
                ),
              ),
              Container(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                  style: ButtonStyle(backgroundColor:
                      MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Colors.redAccent;
                    }
                    return Colors.yellow;
                  })),
                ),
              )
            ]),
          ),
          TextButton(
              onPressed: () => _authSign.signOut(context),
              child: const Text("SignOut"))
        ],
      ),
    );
  }
}
