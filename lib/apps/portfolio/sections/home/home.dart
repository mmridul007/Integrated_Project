import 'package:final_app/apps/portfolio/responsive/responsive.dart';
import 'package:final_app/apps/portfolio/sections/home/home_desktop.dart';
import 'package:final_app/apps/portfolio/sections/home/home_mobile.dart';
import 'package:final_app/apps/portfolio/sections/home/home_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTab(),
      desktop: HomeDesktop(),
    );
  }
}
