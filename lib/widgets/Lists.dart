import 'package:flutter/cupertino.dart';

class Lists extends StatelessWidget {
  double width;
  double hight;
  final String custNm;
  final String custPh;
  final String itemName;
  final String itemPrice;

  Lists({super.key,
    required this.width,
    required this.hight,
    required this.custNm,
    required this.custPh,
    required this.itemName,
    required this.itemPrice,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
          color: Color(0xffDED6D7),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(custNm),
                Text(custPh)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(itemName),
                Text(itemPrice),
              ],
            ),
          ],

        ),
    );
  }
}
