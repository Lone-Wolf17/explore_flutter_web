import 'package:explore_flutter_web/constants/app_constants.dart';
import 'package:explore_flutter_web/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class FeaturedTiles extends StatelessWidget {
  const FeaturedTiles({Key? key, required this.screenSize})
      : super(key: key);

  final Size screenSize;

  final List<String> assets = const [
    'assets/images/trekking.jpg',
    'assets/images/animals.jpg',
    'assets/images/photography.jpeg',
  ];

  final List<String> title = const ['Trekking', 'Animals', 'Photography'];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? SingleChildScrollView(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: screenSize.width / 15),
                ...Iterable<int>.generate(assets.length).map((pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.width / 2.5,
                              width: screenSize.width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(assets[pageIndex],
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.height / 70),
                                child: Text(title[pageIndex],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily:
                                            AppConstants.montserratFontFamily,
                                        fontWeight: FontWeight.w500)))
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15)
                      ],
                    ))
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * 0.06,
                left: screenSize.width / 15,
                right: screenSize.width / 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...Iterable<int>.generate(assets.length)
                    .map((pageIndex) => Column(
                          children: [
                            SizedBox(
                                height: screenSize.width / 6,
                                width: screenSize.width / 3.8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(assets[pageIndex],
                                      fit: BoxFit.cover),
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: screenSize.height / 70),
                                child: Text(title[pageIndex],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily:
                                            AppConstants.montserratFontFamily,
                                        fontWeight: FontWeight.w500)))
                          ],
                        ))
              ],
            ),
          );
  }
}
