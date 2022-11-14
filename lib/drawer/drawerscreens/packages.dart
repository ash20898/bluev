// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:responsive_login_ui/wallet/widgets/topBarWalletScreen.dart';

class Packages extends StatefulWidget {
  @override
  State<Packages> createState() => _PackagesState();
}

int selected = 0;

class _PackagesState extends State<Packages> {
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
              TopBarWalletScreen(wallet: false, size: size),
              PackagesItem(
                isSelected: true,
                title: 'UnLimited',
                saving: '40 %',
                body: 'Unlimited swaps per month',
                number: 1,
                fun: () => setState(() {
                  selected = 1;
                }),
              ),
              PackagesItem(
                isSelected: true,
                title: 'Standard',
                saving: '30 %',
                body: 'Limited swaps per month',
                number: 2,
                fun: () => setState(() {
                  selected = 2;
                }),
              ),
              PackagesItem(
                isSelected: true,
                title: 'Per Swapping',
                saving: '20 %',
                body: 'pay as you go',
                number: 3,
                fun: () => setState(() {
                  selected = 3;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PackagesItem extends StatelessWidget {
  bool isSelected;
  String title;
  String saving;
  String body;
  VoidCallback fun;
  int number;

  PackagesItem({
    required this.isSelected,
    required this.title,
    required this.saving,
    required this.body,
    required this.fun,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: EdgeInsets.only(bottom: 5, top: 5, left: 20),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff1851D1),
                ),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontSize: 20, fontFamily: 'cairo'),
                ),
              ),
            ),
            SizedBox(
              height: 55,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 10,
                      right: 10,
                      top: 12,
                    ),
                    child: Icon(
                      Icons.pin_drop_outlined,
                      size: 25,
                      color: Color(0xff3BF266),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Save ${saving}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'cairo',
                          ),
                        ),
                        Text(
                          body,
                          style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                            fontSize: 14,
                            fontFamily: 'mont',
                            //fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Spacer(),
            Padding(
              padding: EdgeInsets.only(
                top: 17,
                right: 22,
                left: 25,
                bottom: 10,
              ),
              child: GestureDetector(
                onTap: fun,
                child: Container(
                  alignment: Alignment.center,
                  height: 38,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: number == selected
                        ? Color.fromARGB(255, 174, 173, 173)
                        : Color(0xff3BF266),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    number == selected
                        ? 'Your current package'
                        : 'Select Package',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'cairo',
                    ),
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
