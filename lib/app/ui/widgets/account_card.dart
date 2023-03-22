import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  const AccountCard(
      {Key? key,
      required this.onTapFunction,
      required this.label,
      required this.iconSize,
      required this.icon})
      : super(key: key);
  final VoidCallback onTapFunction;
  final IconData icon;
  final String label;
  final double iconSize;

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: const Color.fromRGBO(244, 244, 244, 1),
          elevation: 1,
          borderOnForeground: false,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: InkWell(
            onTap: widget.onTapFunction,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Card icon
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 4, bottom: 4),
                      child: Container(
                        color: Colors.transparent,
                        width: 50,
                        height: 60,
                        child: Icon(
                          widget.icon,
                          size: widget.iconSize,
                          color: Color.fromRGBO(236, 106, 106, 1.0),
                        ),
                      ),
                    ),
                    // Card Text
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        widget.label,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(130, 130, 130, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                // arrow forward
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 24,
                    color: Color.fromRGBO(130, 130, 130, 1),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
