import 'package:flutter/material.dart';
import '../../../core/widgets/horizontal_spacer.dart';
import '../../core/constants/constants.dart';

class AuthPageFooter extends StatelessWidget {

  final String footerHitText ;
  final String footerNewActionName ;
 final VoidCallback action ;
  const AuthPageFooter({Key? key, required this.footerHitText, required this.footerNewActionName, required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          footerHitText,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
       const HorizontalSpacer(5),
        InkWell(
          onTap: action,
          child: Text(
            footerNewActionName,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Constants.kMainColor,
            ),
          ),
        ),
      ],
    );
  }
}
