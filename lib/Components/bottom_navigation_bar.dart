import 'package:farmlancer/ask_ai.dart';
import 'package:farmlancer/coming_soon.dart';
import 'package:farmlancer/crops_Practices.dart';
import 'package:farmlancer/profile_menu.dart';
import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color.fromRGBO(255, 255, 255, 1),
        border: Border.all(
          color: const Color.fromRGBO(0, 0, 0, 1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/home.png',
                  height: 27,
                  width: 27,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/cloud.png',
                  height: 27,
                  width: 27,
                ),
                label: "Weather"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/middle_bar.png',
                ),
                label: "Ask AI"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/Tree_bar.png',
                  height: 27,
                  width: 27,
                ),
                label: "Crops"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/profile_man_bar.png',
                  height: 27,
                  width: 27,
                ),
                label: "Profile")
          ],
          fixedColor: Colors.green,
          onTap: (int idx) {
            switch (idx) {
              case 0:
                break;
              case 1:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ComingSoonScreen()));
              case 2:
                show(context);

              case 3:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Crops()));

              case 4:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Profile_menu()));
            }
          },
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
