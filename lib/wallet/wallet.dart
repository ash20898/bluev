import 'package:flutter/material.dart';
import './widgets/topBarWalletScreen.dart';

class Wallet extends StatefulWidget {
  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int? val = -1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBarWalletScreen(
                size: size,
                wallet: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select payment method ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black26,
                        fontFamily: 'mont',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RadioListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 80,
                              child: Image.asset(
                                'assets/Visa.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 60,
                              width: 80,
                              child: Image.asset(
                                'assets/Mastercard.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        value: 1,
                        groupValue: val,
                        onChanged: (int? value) {
                          setState(() {
                            val = value;
                          });
                        }),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                //prefixIcon: Icon(Icons.person),
                                hintText: 'Card Number',
                                hintStyle: TextStyle(
                                  fontFamily: 'mont',
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(
                              top: 10,
                            ),
                            child: TextField(
                              decoration: const InputDecoration(
                                //prefixIcon: Icon(Icons.person),
                                hintText: 'Name On Card',
                                hintStyle: TextStyle(
                                  fontFamily: 'mont',
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: size.width * .5,
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    //prefixIcon: Icon(Icons.person),
                                    hintText: 'Expiry date',
                                    hintStyle: TextStyle(
                                      fontFamily: 'mont',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 50,
                                width: size.width * .25,
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    //prefixIcon: Icon(Icons.person),
                                    hintText: 'CVV',
                                    hintStyle: TextStyle(
                                      fontFamily: 'mont',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    RadioListTile(
                        title: Row(
                          children: [
                            Container(
                              height: 90,
                              width: 120,
                              child: Image.asset(
                                'assets/fawry.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        value: 2,
                        groupValue: val,
                        onChanged: (int? value) {
                          setState(() {
                            val = value;
                          });
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
