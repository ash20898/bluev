import 'package:flutter/material.dart';
import 'package:responsive_login_ui/drawer/drawer.dart';
import '../../../wallet/wallet.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: MenuDrawer(),
      body: Builder(builder: (context) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                'assets/splash.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.menu_rounded,
                        size: 30,
                        color: Color(0xff1851D1),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Back to the Map',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'cairo',
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.edit_outlined,
                      size: 30,
                      color: Color(0xff1851D1),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * .3,
              right: 20,
              left: 20,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 55,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * .13,
                        width: double.infinity,
                        // color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Welcome',
                              style: TextStyle(
                                letterSpacing: 1,
                                fontSize: 22,
                                color: Colors.blue,
                                fontFamily: 'cairo',
                              ),
                            ),
                            Text(
                              'Ahmad Samir',
                              style: TextStyle(
                                wordSpacing: 2,
                                letterSpacing: 1,
                                fontSize: 20,
                                color: Colors.black,
                                fontFamily: 'cairo',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 3,
                              width: 60,
                              child: Image.asset(
                                'assets/splash.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ProfileItemDetail('Mobile :      01065436573 '),
                      ProfileItemDetail('Address :    Cairo , Egypt '),
                      ProfileItemDetail('Email :        Asamir@gmail.com'),
                      ProfileItemDetail('Gender :      Male'),
                      ProfileItemDetail('Job :             Software developer'),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * .3 - 40,
              left: size.width * .2,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/profile.jpg',
                ),
                radius: 40,
              ),
            ),
            Positioned(
              top: size.height * .3 - 24,
              right: size.width * .2,
              child: Container(
                height: 48,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xff3BF266),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '750',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'cairo',
                      ),
                    ),
                    Text(
                      ' LE',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'cairo',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 40,
              left: 40,
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Wallet())),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff3BF266),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Wallet Top Up',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'cairo',
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class ProfileItemDetail extends StatelessWidget {
  final String text;
  ProfileItemDetail(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 10,
        top: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'cairo',
        ),
      ),
    );
  }
}
