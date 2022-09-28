import 'package:flutter/material.dart';
import 'package:products_viewer/core/widgets/vertical_spacer.dart';
import '../../core/constants/constants.dart';

class AuthPageHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  const AuthPageHeader({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: Constants.kMainColor,
          ),
        ),
        const VerticalSpacer(10),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 20,
            color: Constants.kMainColor,
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.grey.shade500,
        ),
      ],
    );
  }
}
