import 'package:explore_flutter_web/constants/app_constanst.dart';
import 'package:explore_flutter_web/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({Key? key, required this.screenSize})
      : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15
      ),
      child: ResponsiveWidget.isSmallScreen(context) ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(),
          const Text('Featured', style: TextStyle(
            fontSize: 24,
            fontFamily: AppConstants.montserratFontFamily,
            fontWeight: FontWeight.bold
          )),
          const SizedBox(height: 5),
          const Text('Unique wildlife tours & destinations', textAlign: TextAlign.end),
          const SizedBox(height: 10),
        ],
      ) : Row (
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text('Featured', style: TextStyle(
           fontSize: 40,
           fontFamily: AppConstants.montserratFontFamily,
           fontWeight: FontWeight.bold
          )),
          Expanded(child: Text('Unique wildlife tours & destinations', textAlign: TextAlign.end))
        ],
      )
    );
  }
}
