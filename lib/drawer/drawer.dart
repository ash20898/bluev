import 'package:flutter/material.dart';
import 'package:responsive_login_ui/drawer/drawerscreens/packages.dart';
import 'package:responsive_login_ui/wallet/wallet.dart';
import 'drawerscreens/notification.dart';
import 'drawerscreens/about.dart';
import 'drawerscreens/help.dart';
import 'drawerscreens/history.dart';
import 'drawerscreens/profileScreen/profile.dart';
import 'drawerscreens/installment.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xff1851D1),
        child: ListView(children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 90, left: 25),
            child: Container(
              height: 80,
              width: 100,
              child: Image.asset(
                'assets/whitegreen.png',
                //height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: (() {
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Profile();
              }));
            }),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                //color: Colors.grey,
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/profile.jpg',
                      ),
                      backgroundColor: Colors.purple,
                      radius: 40,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'cairo',
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Mr Ahmad Samir',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'cairo',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                DrawerItem(
                  icon: Icon(
                    Icons.wallet,
                    color: Color(0xff3BF266),
                    size: 28,
                  ),
                  leading: Image.asset(
                    'assets/side_walet.png',
                    // width: 30,
                    // height: 30,
                    fit: BoxFit.fill,
                  ),
                
                  title: 'Wallet ',
                  fun: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Wallet();
                    }));
                  },
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                DrawerItem(
                  icon: Icon(
                    Icons.notifications_on,
                    color: Color(0xff3BF266),
                    size: 28,
                  ),
                  leading: Image.asset('assets/side_pakages.png'),
                  title: 'Packages',
                  fun: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Packages();
                    }));
                  },
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                DrawerItem(
                  icon: Icon(
                    Icons.notifications_on,
                    color: Color(0xff3BF266),
                    size: 28,
                  ),
                  leading: Image.asset('assets/side_instalment.png'),
                  title: 'Installment',
                  fun: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Installment();
                    }));
                  },
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                DrawerItem(
                  icon: Icon(
                    Icons.notifications_on,
                    color: Color(0xff3BF266),
                    size: 28,
                  ),
                  leading: Image.asset('assets/side_notification.png'),
                  title: 'Notification',
                  fun: () {
                    // Navigator.of(context).pop();
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return Notifications();
                    // }));
                  },
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                  height: 1,
                ),
                DrawerItem(
                  icon: Icon(
                    Icons.history,
                    color: Color(0xff3BF266),
                    size: 28,
                  ),
                  leading: Image.asset('assets/side_history.png'),
                  title: 'History',
                  fun: () {
                    // Navigator.of(context).pop();
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return History();
                    // }));
                  },
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                DrawerItem(
                  icon: Icon(
                    Icons.help_outline,
                    color: Color(0xff3BF266),
                    size: 28,
                  ),
                  leading: Image.asset('assets/side_help.png'),
                  title: 'Help',
                  fun: () {
                    // Navigator.of(context).pop();
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return Help();
                    // }));
                  },
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
                DrawerItem(
                  icon: Icon(
                    Icons.info_outline,
                    color: Color(0xff3BF266),
                    size: 28,
                  ),
                  leading: Image.asset('assets/side_about.png'),
                  title: 'About',
                  fun: () {
                    // Navigator.of(context).pop();
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return About();
                    // }));
                  },
                ),
                Divider(
                  color: Colors.white,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final Icon icon;
  final Image leading;
  final VoidCallback fun;

  const DrawerItem(
      {required this.title,
      required this.icon,
      required this.fun,
      required this.leading});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          height: 30,
          width: 30,
          child: leading,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'cairo',
          ),
        ),
        onTap: fun);
  }
}
