import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

import '../Sign_page/sign_page.dart';
import '../fuel_delivery/fuel_type.dart';
import '../my_widgets/my_logo_text.dart';
import '../offer_page/offer_page.dart';
import '../profile_page/profile_page.dart';
import 'my_container.dart';
import 'my_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.teal,
        leading: const Icon(
          Icons.menu,
          size: 25,
          color: Colors.black,
        ),
        centerTitle: true,
        title: const MyLogoText(textSize: 28),
        actions: const [
          Icon(
            Icons.search,
            size: 25,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: SizedBox(
                      height: 143,
                      width: double.infinity,
                      child: AnotherCarousel(
                        images: const [
                          AssetImage('assets/images/1.png'),
                          AssetImage('assets/images/2.png'),
                          AssetImage('assets/images/3.jpg'),
                        ],
                        dotSize: 4,
                        indicatorBgPadding: 1,
                        borderRadius: true,
                        radius: const Radius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 55, right: 55),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white60,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        MyRow(
                          icon1: 'assets/icons/1.1.png',
                          text1: 'Fuel Delivery',
                          icon2: 'assets/icons/1.3.png',
                          text2: 'Pump Management',
                          navPage1: FuelType(),
                          navPage2: HomePage(),
                        ),
                        Spacer(),
                        MyRow(
                          icon1: 'assets/icons/1.2.png',
                          text1: 'EV Charge Slot Booking',
                          icon2: 'assets/icons/1.4.png',
                          text2: 'Mileage Calculator',
                          navPage1: HomePage(),
                          navPage2: SignPage(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 37,
            ),
            Expanded(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      MyContainer(
                        text: 'PETROL : 106.77/LTR',
                      ),
                      Spacer(),
                      MyContainer(
                        text: 'DIESEL : 94.74/LTR',
                      ),
                      Spacer(),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white60,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return ProfilePage();
                                  }),
                                );
                              },
                              child: const Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.fmd_good,
                              size: 25,
                              color: Colors.black,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return const OfferPage();
                                  }),
                                );
                              },
                              icon: const Icon(
                                Icons.local_offer,
                                size: 25,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

