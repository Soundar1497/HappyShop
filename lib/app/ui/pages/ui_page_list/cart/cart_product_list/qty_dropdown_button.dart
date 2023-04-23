import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../../../provider/Cart_Provider/cart_Provider.dart";

class QtyDropDownButton extends StatefulWidget {
  const QtyDropDownButton({Key? key}) : super(key: key);

  @override
  State<QtyDropDownButton> createState() => _QtyDropDownButtonState();
}

class _QtyDropDownButtonState extends State<QtyDropDownButton> {
  var _currentValue = '';
  List<String> qty = ['1', '2', '3', 'More'];
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    _currentValue = _currentValue != "" ? _currentValue : qty[0];

    return Container(
      width: 100,
      height: 30,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.black26)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          alignment: AlignmentDirectional.center,
          value: _currentValue,
          underline: Container(
            width: 1,
            height: 1,
            color: Colors.black,
          ),
          items: qty.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text("Qty: $value"),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              cartProvider.qtyField.text = "";
            });
            if (newValue != "More") {
              _currentValue = newValue!;
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 80,
                        height: 150,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 20, bottom: 10),
                                child: Text(
                                  "Enter Quantity",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Material(
                                child: TextFormField(
                                  autofocus: true,
                                  controller: cartProvider.qtyField,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Quantity"),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 80,
                                      child: const Text(
                                        'Close',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _currentValue =
                                            cartProvider.qtyField.text;
                                        qty.add(cartProvider.qtyField.text);
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: const SizedBox(
                                      width: 80,
                                      child: Text(
                                        'Apply',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
