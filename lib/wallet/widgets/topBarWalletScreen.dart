import 'package:flutter/material.dart';

class TopBarWalletScreen extends StatelessWidget {
  TopBarWalletScreen({
    required this.wallet,
    required this.size,
  });

  final Size size;
  final bool wallet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
      ),
      height: size.height * .14,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10, // soften the shadow
            spreadRadius: 2, //extend the shadow
            offset: Offset(
              0,
              1,
            ),
          )
        ],
        //color: Colors.red,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                wallet ? Icons.arrow_back_ios : Icons.menu,
                size: 25,
                color: Color(0xff1851D1),
              ),
            ),
          ),
          Text(
            wallet ? 'Wallet Top Up' : 'Packages',
            style: TextStyle(
              fontSize: 22,
              color: Color(0xff1851D1),
              //fontWeight: FontWeight.w500,
              fontFamily: 'cairo',
            ),
          ),
        ],
      ),
    );
  }
}
