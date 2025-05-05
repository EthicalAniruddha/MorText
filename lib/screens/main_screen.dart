import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mortext/constants/Constants.dart';
import 'package:mortext/pages/about_page.dart';
import 'package:mortext/pages/info_page.dart';
import 'package:mortext/pages/main_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> items = [
    Icon(Icons.question_mark, size: 30),
    Icon(Icons.home_filled, size: 30),
    Icon(Icons.info_outline_rounded, size: 30),
  ];

  int index = 0;

  final List<Widget> pages = [AboutPage(), MainPage(), InfoPage()];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.primaryColor,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            bottomNavigationBar: CurvedNavigationBar(
              items: items,
              backgroundColor: Colors.transparent,
              color: Constants.primaryColor,
              height: 60,
              animationCurve: Curves.slowMiddle,
              animationDuration: Duration(milliseconds: 500),
              onTap: (index) {
                setState(() {
                  this.index = index;
                });
              },
            ),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    expandedHeight: 0,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                          color: Constants.primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            Constants.appTitle,
                            style: Constants.titleFont,
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: pages[index],
            ),
          ),
        ),
      ),
    );
  }
}
