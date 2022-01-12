import 'package:explore_flutter_web/constants/app_constanst.dart';
import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({Key? key, required this.opacity}) : super(key: key);

  final double opacity;

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List<bool> _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.blueGrey.shade900.withOpacity(widget.opacity),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('EXPLORE',
              style: TextStyle(
                  color: Colors.blueGrey.shade100,
                  fontSize: 20,
                  fontFamily: AppConstants.montserratFontFamily,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3)),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: screenSize.width / 8),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    _isHovering[0] = value;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Discover',
                        style: TextStyle(
                            color: _isHovering[0]
                                ? Colors.blue.shade200
                                : Colors.white)),
                    const SizedBox(height: 5),
                    // For Showing an underline on hover
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[0],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: screenSize.width / 20),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    _isHovering[1] = value;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Contact Us',
                        style: TextStyle(
                            color: _isHovering[1]
                                ? Colors.blue.shade200
                                : Colors.white)),
                    const SizedBox(height: 5),
                    // For Showing an underline on hover
                    Visibility(
                      maintainAnimation: true,
                      maintainState: true,
                      maintainSize: true,
                      visible: _isHovering[1],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                _isHovering[2] = value;
              });
            },
            child: Text('Sign Up',
                style: TextStyle(
                    color: _isHovering[2]
                        ? Colors.white
                        : Colors.white70)),
          ),
          SizedBox(width: screenSize.width / 50),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                _isHovering[3] = value;
              });
            },
            child: Text('Login',
                style: TextStyle(
                    color: _isHovering[3]
                        ? Colors.white
                        : Colors.white70)),
          ),
        ],
      ),
    );
  }
}
