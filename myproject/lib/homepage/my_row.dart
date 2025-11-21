import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  const MyRow({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.text1,
    required this.text2,
    required this.navPage1,
    required this.navPage2,
  });

  final String icon1;
  final String icon2;
  final String text1;
  final String text2;
  final Widget navPage1;
  final Widget navPage2;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return navPage1;
              }),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Image(
                    image: AssetImage(icon1),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  text1,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return navPage2;
              }),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  child: Image(
                    image: AssetImage(icon2),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  text2,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
