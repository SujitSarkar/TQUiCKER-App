import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tquicker/static_variable/size_config.dart';

import 'package:tquicker/static_variable/theme_and_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> gridText = [
    "Bike",
    "Car",
    "CNG",
    "Ambulance",
    "Truck",
    "Ship",
    "Pickup",
    "Heavy vehicles"
  ];

  List<IconData> gridIcons = [
    FontAwesomeIcons.biking,
    FontAwesomeIcons.car,
    FontAwesomeIcons.taxi,
    FontAwesomeIcons.ambulance,
    FontAwesomeIcons.truck,
    FontAwesomeIcons.ship,
    FontAwesomeIcons.truckPickup,
    FontAwesomeIcons.truckMonster,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/images/user.png",
            height: customWidth(0.08),
          ),
          onPressed: () {},
        ),
        title: Text(
          "Enjoy Your Trip.....",
          style: textTheme(context, 0.05, FontWeight.w600, Colors.white),
        ),
        titleSpacing: customWidth(-0.01),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              size: customWidth(0.075),
            ),
            label: "Home",
            activeIcon: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: ThemeAndColor.themeColor, width: 1.2),
                  borderRadius: BorderRadius.circular(customWidth(0.01))),
              child: Icon(
                Icons.home_rounded,
                size: customWidth(0.07),
                color: Colors.black54,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidEnvelopeOpen,
              size: customWidth(0.05),
            ),
            label: "Home",
            activeIcon: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: ThemeAndColor.themeColor, width: 1.2),
                  borderRadius: BorderRadius.circular(customWidth(0.01))),
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Icon(
                  FontAwesomeIcons.solidEnvelopeOpen,
                  size: customWidth(0.05),
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
              size: customWidth(0.075),
            ),
            label: "History",
            activeIcon: Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: ThemeAndColor.themeColor, width: 1.2),
                  borderRadius: BorderRadius.circular(customWidth(0.01))),
              child: Icon(
                Icons.history,
                size: customWidth(0.07),
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _gridView(context),
            _bannerSlider(
              context,
              "Public Transportation Offer",
              "assets/images/images.jpg",
            ),
            _bannerSlider(
              context,
              "Heavy Vehicles Offer",
              "assets/images/images.jpg",
            ),
          ],
        ),
      ),
    );
  }

  Column _bannerSlider(BuildContext context, String text, String img) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: customWidth(0.05), top: customWidth(0.05)),
          child: Text(
            text,
            style: textTheme(context, 0.05, FontWeight.bold, null),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: customWidth(0.05), right: customWidth(.2)),
          child: const Divider(
            color: ThemeAndColor.themeColor,
            thickness: 2.2,
          ),
        ),
        SizedBox(
          width: customWidth(1),
          height: customWidth(0.45),
          child: Swiper(
            itemHeight: customWidth(0.45),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.all(customWidth(.03)),
                  child: Image.asset(
                    img,
                  ));
            },
            autoplay: true,
            viewportFraction: .9,
            scale: 1,
          ),
        )
      ],
    );
  }

  Container _gridView(BuildContext context) {
    return Container(
      color: ThemeAndColor.buttonBGColor,
      padding: EdgeInsets.all(customWidth(0.05)),
      child: GridView.count(
        physics: const ClampingScrollPhysics(),
        crossAxisCount: 4,
        childAspectRatio: 1.2,
        shrinkWrap: true,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(gridText.length, (index) {
          return Container(
            //width: customWidth(0.05),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(customWidth(0.03)),
              border: Border.all(
                color: ThemeAndColor.themeColor,
                width: 1.2,
              ),
            ),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(gridIcons[index],size: customWidth(0.05)),
                Padding(
                  padding: EdgeInsets.all(customWidth(0.01)),
                  child: AutoSizeText(
                    gridText[index],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(color: ThemeAndColor.textColor,fontSize: customWidth(0.02)),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
