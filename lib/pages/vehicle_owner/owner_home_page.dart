import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tquicker/controller/owner_controller.dart';
import 'package:tquicker/pages/vehicle_owner/add_vehicle_page.dart';
import 'package:tquicker/pages/vehicle_owner/owner_account_page.dart';
import 'package:tquicker/pages/vehicle_owner/update_vehicle_page.dart';
import 'package:tquicker/static_variable/size_config.dart';

import 'package:tquicker/static_variable/theme_and_color.dart';

class OwnerHomePage extends StatefulWidget {
  const OwnerHomePage({Key? key}) : super(key: key);

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  // List<String> gridText = [
  //   "Bike",
  //   "Car",
  //   "CNG",
  //   "Ambulance",
  //   "Truck",
  //   "Ship",
  //   "Pickup",
  //   "Heavy vehicles"];

  // List<IconData> gridIcons = [
  //   FontAwesomeIcons.biking,
  //   FontAwesomeIcons.car,
  //   FontAwesomeIcons.taxi,
  //   FontAwesomeIcons.ambulance,
  //   FontAwesomeIcons.truck,
  //   FontAwesomeIcons.ship,
  //   FontAwesomeIcons.truckPickup,
  //   FontAwesomeIcons.truckMonster,
  // ];
  int _selectedIndex = 0;
  bool _isLoading=true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    OwnerController ownerController = Get.find();
    _fetchAllData(ownerController);
  }

  void _fetchAllData(OwnerController ownerController)async{
    await ownerController.getOwnerVehicles();
    setState(()=>_isLoading=false);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OwnerController>(
      builder: (ownerController) {
        return Scaffold(
          key: _scaffoldKey,
          drawer: _ownerDrawer(ownerController),
          appBar: AppBar(
            leading: IconButton(
              icon: Image.asset(
                "assets/images/user.png",
                height: customWidth(0.08),
              ),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
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
                Padding(
                  padding: EdgeInsets.all(customWidth(0.04)),
                  child: Text('Vehicle List',style: TextStyle(fontSize: customWidth(0.05),fontWeight: FontWeight.bold),),
                ),
                _gridView(ownerController),
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

  Container _gridView(OwnerController ownerController) {
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
        children: List.generate(ownerController.ownerVehicleList.length, (index) {
          return InkWell(
            onTap: ()=>Get.to(()=>UpdateVehiclePage(ownerVehicleModel: ownerController.ownerVehicleList[index])),
            child: Container(
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
                  Icon(FontAwesomeIcons.car,size: customWidth(0.05)),
                  Padding(
                    padding: EdgeInsets.all(customWidth(0.01)),
                    child: AutoSizeText(
                      ownerController.ownerVehicleList[index].vhBrand!,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(color: ThemeAndColor.textColor,fontSize: customWidth(0.02)),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _ownerDrawer(OwnerController ownerController)=>Drawer(
    child: Material(
      color: Colors.white,
      child: SafeArea(
        child: ListView(
          children: [
            ///Account Section
            Container(
              alignment: Alignment.center,
              height: customWidth(.42),
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Icon(Icons.person,size: customWidth(0.18),),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.white,
                    ),
                  ),

                  Text(ownerController.ownerModel.value.name!,style: TextStyle(
                    color: Colors.white,fontSize: customWidth(0.05),fontWeight: FontWeight.w600
                  ),),
                  Text(ownerController.ownerModel.value.contactNo!,style: TextStyle(
                      color: Colors.white,fontSize: customWidth(0.035)
                  ),),
                  Text(ownerController.ownerModel.value.email!,style: TextStyle(
                      color: Colors.white,fontSize: customWidth(0.035)
                  ),)
                ],
              ),
            ),
            SizedBox(height: customWidth(0.04)),

            Card(
              color: Theme.of(context).primaryColor.withOpacity(0.4),
              elevation: 0.0,
              child: ListTile(
                onTap: ()=>Get.to(()=>AddVehiclePage(
                    ownerToken: ownerController.ownerModel.value.apiToken!,
                    fromHome: true)),
                title: Text('Add Vehicle',style: TextStyle(
                    color: Colors.grey.shade900,fontSize: customWidth(0.04),fontWeight: FontWeight.w600
                ),),
                trailing: Icon(CupertinoIcons.right_chevron,color: Colors.grey.shade900),
              ),
            ),
            SizedBox(height: customWidth(0.02)),

            Card(
              color: Theme.of(context).primaryColor.withOpacity(0.4),
              elevation: 0.0,
              child: ListTile(
                onTap: ()=>Get.to(()=>const OwnerAccountPage()),
                title: Text('Account',style: TextStyle(
                    color: Colors.grey.shade900,fontSize: customWidth(0.04),fontWeight: FontWeight.w600
                ),),
                trailing: Icon(CupertinoIcons.right_chevron,color: Colors.grey.shade900),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
