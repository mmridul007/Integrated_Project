import 'package:final_app/apps/portfolio/animations/bottom_animation.dart';
import 'package:final_app/apps/portfolio/configs/configs.dart';
import 'package:final_app/apps/portfolio/utils/contact_utils.dart';
import 'package:final_app/apps/portfolio/widget/custom_text_heading.dart';
import 'package:final_app/apps/portfolio/widget/project_card.dart';
import 'package:flutter/material.dart';

class ContactDesktop extends StatelessWidget {
  const ContactDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.all(1, 1),
      child: Column(
        children: [
          const CustomSectionHeading(
            text: "\nGet in Touch",
          ),
          const CustomSectionSubHeading(
            text: "Let's build something together :)\n\n",
          ),
          Space.y!,
          Wrap(
              alignment: WrapAlignment.center,
              runSpacing: AppDimensions.normalize(10),
              children: ContactUtils.contactIcon
                  .asMap()
                  .entries
                  .map((e) => WidgetAnimator(
                        child: ProjectCard(
                          projectIconData: e.value,
                          projectTitle: ContactUtils.titles[e.key],
                          projectDescription: ContactUtils.details[e.key],
                        ),
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
