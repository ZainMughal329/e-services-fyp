import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPackageState {

  RxBool infoLoading = true.obs;

  String serviceImage = '';
  final TextEditingController providerNameController = TextEditingController();
  final TextEditingController providerPhoneController = TextEditingController();
  final TextEditingController providerEmailController = TextEditingController();
  final TextEditingController providerIdController = TextEditingController();
  final TextEditingController serviceController = TextEditingController();
  // To set
  final TextEditingController hourlyRateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
}