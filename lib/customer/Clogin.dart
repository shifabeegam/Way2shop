import 'package:flutter/material.dart';

class Clogin extends StatelessWidget {
  const Clogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        width: 360,
        height: 800,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 53,
              top: 14,
              child: SizedBox(
                width: 87,
                height: 20,
                child: Text(
                  'Way2Shop',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 14,
              top: 10,
              child: Container(
                width: 26,
                height: 25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/26x25"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 45,
              child: Container(
                width: 360,
                height: 130,
                decoration: BoxDecoration(color: Color(0xFF380039)),
              ),
            ),
            Positioned(
              left: 277,
              top: 123,
              child: Container(
                width: 31.50,
                height: 29,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/31x29"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 159,
              top: 123,
              child: Container(
                width: 29,
                height: 29,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/29x29"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 48,
              top: 123,
              child: Container(
                width: 24,
                height: 22,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/24x22"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 282,
              top: 67,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/18x18"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 257,
              top: 67,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/20x20"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 130,
              top: 68,
              child: Text(
                'Search Items',
                style: TextStyle(
                  color: Color(0xFF9B9393),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 56,
              top: 178,
              child: Text(
                'Choosed  Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 54,
              top: 344,
              child: Container(
                width: 254,
                height: 382,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF38003A)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 71,
              top: 557,
              child: Text(
                'Email',
                style: TextStyle(
                  color: Color(0xFF38003A),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 70,
              top: 484,
              child: Text(
                'Phone Number',
                style: TextStyle(
                  color: Color(0xFF38003A),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 70,
              top: 406,
              child: Text(
                'Name',
                style: TextStyle(
                  color: Color(0xFF38003A),
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 110,
              top: 650,
              child: Container(
                width: 139,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF0C9C00)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 155,
              top: 661,
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Color(0xFF38003A),
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 66,
              top: 582,
              child: Container(
                width: 228,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF38003A)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 65,
              top: 506,
              child: Container(
                width: 228,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF38003A)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 66,
              top: 430,
              child: Container(
                width: 228,
                height: 40,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF38003A)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 130,
              top: 280,
              child: Container(
                width: 100,
                height: 100,
                decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: Color(0xFF38003A)),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 147,
              top: 298,
              child: Container(
                width: 65,
                height: 62,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/65x62"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
