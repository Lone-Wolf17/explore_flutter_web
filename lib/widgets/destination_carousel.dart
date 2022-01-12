import 'package:carousel_slider/carousel_slider.dart';
import 'package:explore_flutter_web/constants/app_constants.dart';
import 'package:explore_flutter_web/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {

  final CarouselController _carouselController = CarouselController();

  final List<bool> _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  final List<bool> _isSelected = [
    true,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  int _current = 0;

  final List<String> _images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  final List<String> _places = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA'
  ];

  List<Widget> _generateImageTiles(screenSize) {
    return _images
        .map((imagePath) => ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageSliders = _generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
            carouselController: _carouselController,
            items: imageSliders,
            options: CarouselOptions(
                enlargeCenterPage: true,
                aspectRatio: 18 / 8,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                    for (int i = 0; i < imageSliders.length; i++) {
                      _isSelected[i] = i == index;
                    }
                  });
                })),
        AspectRatio(
            aspectRatio: 18 / 8,
            child: Center(
              child: Text(_places[_current],
                  style: TextStyle(
                      letterSpacing: 8,
                      fontFamily: AppConstants.electroFontFamily,
                      fontSize: screenSize.width / 25,
                      color: Colors.white)),
            )),
        ResponsiveWidget.isSmallScreen(context)
            ? Container()
            : AspectRatio(
                aspectRatio: 17 / 8,
                child: Center(
                  heightFactor: 1,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width / 8),
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenSize.height / 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (int i = 0; i < _places.length; i++)
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                        splashColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onHover: (value) {
                                          setState(() {
                                            _isHovering[i] = value;
                                          });
                                        },
                                        onTap: () {
                                          _carouselController.animateToPage(i);
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: screenSize.height / 85),
                                          child: Text(_places[i],
                                              style: TextStyle(
                                                  color: _isHovering[i]
                                                      ? Colors.grey[900]
                                                      : Colors.blueGrey)),
                                        )),
                                    Visibility(
                                      maintainSize: true,
                                      maintainAnimation: true,
                                      maintainState: true,
                                      visible: _isSelected[i],
                                      child: AnimatedOpacity(
                                          opacity: _isSelected[i] ? 1 : 0,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          child: Container(
                                            height: 5,
                                            decoration: const BoxDecoration(
                                              color: Colors.blueGrey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            width: screenSize.width / 10,
                                          )),
                                    )
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
      ],
    );
  }
}
