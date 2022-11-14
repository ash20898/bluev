import 'package:flutter/material.dart';

class Installment extends StatefulWidget {
  @override
  State<Installment> createState() => _InstallmentState();
}

class _InstallmentState extends State<Installment> {
  String text1 = 'Pay Early';
  String text2 = 'Thanks';
  bool b = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                'assets/instalment.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 36,
              right: 30,
              left: 30,
              child: GestureDetector(
                onTap: () => setState(() {
                  b = !b;
                }),
                child: Container(
                  alignment: Alignment.center,
                  height: 46,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: b ? Color(0xff3BF266) : Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        blurRadius: 5, // soften the shadow
                        spreadRadius: 1, //extend the shadow
                        offset: Offset(
                          2,
                          2,
                        ),
                      )
                    ],
                  ),
                  child: Text(
                    b ? text1 : text2,
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'cairo',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 32,
              left: 15,
              child: Container(
                alignment: Alignment.center,
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 28,
                    color: Color(0xff1851D1),
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
