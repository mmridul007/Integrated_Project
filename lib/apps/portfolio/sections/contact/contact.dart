import 'package:final_app/apps/portfolio/responsive/responsive.dart';
import 'package:final_app/apps/portfolio/sections/contact/contact_desktop.dart';
import 'package:final_app/apps/portfolio/sections/contact/contact_mobile.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ContactMobileTab(),
      tablet: ContactMobileTab(),
      desktop: ContactDesktop(),
    );
  }
}
