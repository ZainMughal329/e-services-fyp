import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_services_fyp/Pages/booking_view/book_now_screen/widget/book_now_widget.dart';
import 'package:e_services_fyp/Pages/booking_view/book_now_screen/widget/location_Selction_screen.dart';
import 'package:e_services_fyp/Pages/booking_view/controller.dart';
import 'package:e_services_fyp/Pages/home/controller.dart';
import 'package:e_services_fyp/Pages/scheduled_view/controller.dart';
import 'package:e_services_fyp/Pages/scheduled_view/widgets/map_screen.dart';
import 'package:e_services_fyp/Pages/scheduled_view/widgets/scheduled_widget.dart';
import 'package:e_services_fyp/Pages/splashScreen/controller.dart';
import 'package:e_services_fyp/utils/compnents/round_button.dart';
import 'package:e_services_fyp/utils/compnents/snackbar_widget.dart';
import 'package:e_services_fyp/utils/models/booking_model.dart';
import 'package:e_services_fyp/utils/models/scheduled_Service_model.dart';
import 'package:e_services_fyp/utils/routes/routesNames.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../res/colors.dart';
import '../../../res/text_widget.dart';
import '../bookings_success_screen/view.dart';

class BookNowView extends GetView<BookingController> {
  String id;
  String pid;

  BookNowView({Key? key, required this.id, required this.pid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ScheduledController>(() => ScheduledController());
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          title: 'Book Now',
          fontSize: 20,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.iconsColor,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BookNowWidget(
                id: id,
              ),
              SizedBox(
                height: 0,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Get.to(LocationSelectionScreenBooking());
                },
                child: Obx(() => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 70,
                        width: 400,
                        padding: EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.iconsColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map_outlined,
                              color: AppColors.textFieldBgColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                controller.state.selectedLatLng.value ==
                                        LatLng(32.082466, 72.669128)
                                    ? "Select Location on Map"
                                    : controller.state.selectedAddress.value
                                        .toString(),
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Obx(
                () => controller.state.loading.value == true
                    ? CircularProgressIndicator(
                        color: AppColors.iconsColor,
                      )
                    : RoundButton(
                        title: "Confirm ",
                        onPress: () {
                          if (controller.state.addressCon.text.isEmpty ||
                              controller.state.selectedAddress.value.isEmpty) {
                            Snackbar.showSnackBar(
                                'Error',
                                'All fields must be filled',
                                Icons.error_outline);
                          } else {
                            BookingModel bookingModel = BookingModel(
                              serviceName: controller.state.service.value,
                              userName: controller.state.name,
                              userPhone: controller.state.phone,
                              address: controller.state.addressCon.text
                                  .trim()
                                  .toString(),
                              providerName: controller.state.providerName.value,
                              providerPhone:
                                  controller.state.providerPhone.value,
                              description: controller.state.description.value,
                              hourlyRate: controller.state.price.value,
                              lat: controller
                                  .state.selectedLatLng.value.latitude,
                              lang: controller
                                  .state.selectedLatLng.value.longitude,
                              pId: pid,
                              uid: FirebaseAuth.instance.currentUser!.uid
                                  .toString(),
                              imageUrl: controller.state.imageURl.value,
                              providerImgUrl:
                                  controller.state.providerImageUrl.value,
                            );
                            controller.storeDataInFirebase(bookingModel, id);
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
