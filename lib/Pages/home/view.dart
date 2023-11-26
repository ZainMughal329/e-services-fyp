import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_services_fyp/Pages/home/controller.dart';
import 'package:e_services_fyp/Pages/splashScreen/controller.dart';
import 'package:e_services_fyp/res/colors.dart';
import 'package:e_services_fyp/res/widgets/services_container.dart';
import 'package:e_services_fyp/utils/compnents/round_button.dart';
import 'package:e_services_fyp/utils/routes/routesNames.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/routes/routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  Widget _catWidget(String name, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        width: 90,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.grey.withOpacity(0.2),
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            imagePath,
            height: 80,
          ),
          SizedBox(height: 5),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'E_Services',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white
              //AppColors.secondaryColor,
              ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.iconsColor,
        elevation: 0,
        leading: IconButton(
          color: Colors.white,
          icon: Icon(
            Icons.menu,
            size: 30,
          ),
          onPressed: () {
            // Get.toNamed(AppRoutes.DrawerScreen);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HI,\n Need some help today?',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(width: 4)),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //search box
                            Text(
                              'Search',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                              ),
                            ),

                            Icon(
                              Icons.mic,
                              size: 25,
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            //  color: AppColors.secondaryColor,
                            color: AppColors.textColor.withOpacity(0.5),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Get.toNamed(AppPages.catogeryView);
                          },
                          child: Text(
                            'ViewAll',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //categories
                    SingleChildScrollView(

                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _catWidget('Plumber', "assets/icons/plumber.png"),
                          _catWidget(
                              'Electrician', "assets/icons/electrician.png"),
                          _catWidget('Repair', "assets/icons/repair.png"),
                          _catWidget('Cleaning', "assets/icons/cleaning.png"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            //  color: AppColors.secondaryColor,
                            color: AppColors.textColor.withOpacity(0.5),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // Get.toNamed(AppRoutes.FeaturedView);
                          },
                          child: Text(
                            'ViewAll',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textColor.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 300,
                      child: SingleChildScrollView(
                        // shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        child:Row(children: [
                          ServiceContainer(
                            imageUrl: 'assets/images/featured smart_device.png',
                            price: 20.0,
                            feedbackStars: 4,
                            serviceName: "Smart Device Maintenance",
                            serviceProviderName: 'Pedro Noris',
                            serviceProviderImage:
                                'assets/images/service_provider3.png',
                            serviceLable: "Smart Home",
                          ),
                          ServiceContainer(
                            imageUrl: 'assets/images/featured cleaning.png',
                            price: 20.0,
                            feedbackStars: 4,
                            serviceName: "Ceiling and Wall",
                            serviceProviderName: 'John Doe',
                            serviceProviderImage:
                                'assets/images/service_provider1.png',
                            serviceLable: "Deep Cleaning",
                          ),
                          ServiceContainer(
                            imageUrl: 'assets/images/featured cooking.png',
                            price: 50.0,
                            feedbackStars: 4,
                            serviceName: "House Hold Cook",
                            serviceProviderName: 'Felix Harris',
                            serviceProviderImage:
                                'assets/images/service_provider2.png',
                            serviceLable: "Home Cook",
                          ),
                          ServiceContainer(
                            imageUrl: 'assets/images/featured repair.png',
                            price: 50.0,
                            feedbackStars: 4,
                            serviceName: "AC Repair",
                            serviceProviderName: 'Pedro Noris',
                            serviceProviderImage:
                                'assets/images/service_provider3.png',
                            serviceLable: "AC Maintenance",
                          ),
                          ServiceContainer(
                            imageUrl: 'assets/images/featured plumber.png',
                            price: 50.0,
                            feedbackStars: 4,
                            serviceName: "Plumbing Services",
                            serviceProviderName: 'John Deo',
                            serviceProviderImage:
                                'assets/images/service_provider1.png',
                            serviceLable: "Repairing",
                          ),
                        ]),
                      ),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
