import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  const AccountCard({
    Key? key,
    required this.onTapFuction,
  }) : super(key: key);
  final Function onTapFuction;

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
