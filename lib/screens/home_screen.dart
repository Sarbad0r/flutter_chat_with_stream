import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_with_stream/helpers/helpers.dart';
import 'package:flutter_chat_with_stream/pages/pages.dart';
import 'package:flutter_chat_with_stream/screens/bottom_navbar_helper.dart';
import 'package:flutter_chat_with_stream/theme.dart';
import 'package:flutter_chat_with_stream/widgets/avatart.dart';
import 'package:flutter_chat_with_stream/widgets/glowing_action_button.dart';
import 'package:flutter_chat_with_stream/widgets/icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BottomNavbarItemHelper> _pages = [
    BottomNavbarItemHelper(
        screen: const MessagesPage(),
        icon: (CupertinoIcons.bubble_left_bubble_right_fill),
        screenName: 'Messages'),
    BottomNavbarItemHelper(
        screen: const NotificationsPage(),
        icon: (CupertinoIcons.bell_solid),
        screenName: 'Notifications'),
    BottomNavbarItemHelper(
        screen: const CallsPage(), icon: (CupertinoIcons.phone_fill), screenName: 'Calls'),
    BottomNavbarItemHelper(
        screen: const ContactsPage(), icon: (CupertinoIcons.person_2_fill), screenName: 'Contacts')
  ];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(_pages[pageIndex].screenName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          leadingWidth: 54,
          leading: Align(
              alignment: Alignment.centerRight,
              child: IconBackground(icon: CupertinoIcons.search, onTap: () {})),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Avatar.small(url: Helpers.randomPictureUrl()))
          ]),
      body: _pages[pageIndex].screen,
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        child: SafeArea(
            top: false,
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Expanded(
                          child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  pageIndex = 0;
                                });
                              },
                              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                Icon(
                                  _pages[0].icon,
                                  color: pageIndex == 0 ? AppColors.secondary : null,
                                ),
                                const SizedBox(height: 10),
                                Text(_pages[0].screenName,
                                    style: TextStyle(
                                        color: pageIndex == 0 ? AppColors.secondary : null,
                                        fontWeight:
                                            pageIndex == 0 ? FontWeight.bold : FontWeight.normal,
                                        fontSize: 10))
                              ]))),
                      Expanded(
                          child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  pageIndex = 1;
                                });
                              },
                              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                Icon(
                                  _pages[1].icon,
                                  color: pageIndex == 1 ? AppColors.secondary : null,
                                ),
                                const SizedBox(height: 10),
                                Text(_pages[1].screenName,
                                    style: TextStyle(
                                        color: pageIndex == 1 ? AppColors.secondary : null,
                                        fontWeight:
                                            pageIndex == 1 ? FontWeight.bold : FontWeight.normal,
                                        fontSize: 10))
                              ]))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowingActionButton(
                              color: AppColors.secondary,
                              icon: CupertinoIcons.add,
                              onPressed: () {}),
                          SizedBox(height: 10)
                        ],
                      ),
                      Expanded(
                          child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  pageIndex = 2;
                                });
                              },
                              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                Icon(
                                  _pages[2].icon,
                                  color: pageIndex == 2 ? AppColors.secondary : null,
                                ),
                                const SizedBox(height: 10),
                                Text(_pages[2].screenName,
                                    style: TextStyle(
                                        color: pageIndex == 2 ? AppColors.secondary : null,
                                        fontWeight:
                                            pageIndex == 2 ? FontWeight.bold : FontWeight.normal,
                                        fontSize: 10))
                              ]))),
                      Expanded(
                          child: InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                setState(() {
                                  pageIndex = 3;
                                });
                              },
                              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                                Icon(
                                  _pages[3].icon,
                                  color: pageIndex == 3 ? AppColors.secondary : null,
                                ),
                                const SizedBox(height: 10),
                                Text(_pages[3].screenName,
                                    style: TextStyle(
                                        color: pageIndex == 3 ? AppColors.secondary : null,
                                        fontWeight:
                                            pageIndex == 3 ? FontWeight.bold : FontWeight.normal,
                                        fontSize: 10))
                              ])))
                    ]),
                    SizedBox(height: 10)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
