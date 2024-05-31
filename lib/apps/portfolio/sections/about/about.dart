import 'package:final_app/apps/portfolio/responsive/responsive.dart';
import 'package:final_app/apps/portfolio/sections/about/about_desktop.dart';
import 'package:final_app/apps/portfolio/sections/about/about_mobile.dart';
import 'package:final_app/apps/portfolio/sections/about/about_tablet.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      tablet: AboutTab(),
      mobile: AboutMobile(),
      desktop: AboutDesktop(),
    );
  }
}
