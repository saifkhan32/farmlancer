import 'package:farmlancer/ask_ai.dart';
import 'package:farmlancer/coming_soon.dart';
import 'package:farmlancer/crops_Practices.dart';
import 'package:farmlancer/profile_menu.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(
            color: const Color.fromRGBO(0, 0, 0, 1),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                'assets/home.png',
                height: 27,
                width: 27,
              ),
              onPressed: () => {},
            ),
            IconButton(
              icon: Image.asset(
                'assets/cloud.png',
                height: 27,
                width: 27,
              ),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ComingSoonScreen()))
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/middle_bar.png',
                // height:27,
                //  width:27,
              ),
              onPressed: () => {show(context)},
            ),
            IconButton(
              icon: Image.asset(
                'assets/Tree_bar.png',
                height: 27,
                width: 27,
              ),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Crops()))
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/profile_man_bar.png',
                height: 27,
                width: 27,
              ),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Profile_menu()))
              },
            ),
          ],
        ),
      ),
    );
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Askai();
      },
    );
  }
}
