import 'package:flutter/material.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());
}
