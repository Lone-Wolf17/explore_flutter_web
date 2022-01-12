import 'package:explore_flutter_web/constants/app_constants.dart';
import 'package:explore_flutter_web/widgets/bottom_bar.dart';
import 'package:explore_flutter_web/widgets/destination_carousel.dart';
import 'package:explore_flutter_web/widgets/destination_heading.dart';
import 'package:explore_flutter_web/widgets/explore_drawer.dart';
import 'package:explore_flutter_web/widgets/featured_heading.dart';
import 'package:explore_flutter_web/widgets/featured_tiles.dart';
import 'package:explore_flutter_web/widgets/floating_quick_access_bar.dart';
import 'package:explore_flutter_web/widgets/responsive_widget.dart';
import 'package:explore_flutter_web/widgets/top_bar_contents.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.4
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const ExploreDrawer(),
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Colors.blueGrey.shade900.withOpacity(_opacity),
              elevation: 0,
              title: Text(
                'EXPLORE',
                style: TextStyle(
                    color: Colors.blueGrey.shade100,
                    fontSize: 20,
                    fontFamily: AppConstants.montserratFontFamily,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(opacity: _opacity),
            ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(children: [
              SizedBox(
                height: screenSize.height * 0.45,
                width: screenSize.width,
                child: Image.asset('assets/images/cover.jpg', fit: BoxFit.cover),
              ),
              Column(
                children: [
                  FloatingQuickAccessBar(screenSize: screenSize),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FeaturedHeading(screenSize: screenSize),
                      FeaturedTiles(screenSize: screenSize)
                    ],
                  )
                ],
              )
            ]),
            DestinationHeading(screenSize: screenSize),
            const DestinationCarousel(),
            SizedBox(height: screenSize.height / 10),
            const BottomBar()
          ],
        ),

      ),
    );
  }
}
