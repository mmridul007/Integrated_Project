import 'dart:js' as js;

import 'package:final_app/apps/quiz/const/sns_links.dart';
import 'package:flutter/material.dart';

class socialMedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      appBar: AppBar(
        title: Text('Share Results'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 15),
            // SNS icon button links
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.facebook]);
                  },
                  child: Image.asset(
                    "assets/icons8-facebook-48.png",
                    width: 28,
                  ),
                ),
                InkWell(
                  onTap: () {
                    js.context.callMethod('open', [SnsLinks.instagram]);
                  },
                  child: Image.asset(
                    "assets/icons8-instagram-48.png",
                    width: 28,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
