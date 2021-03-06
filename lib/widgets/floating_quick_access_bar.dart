import 'package:explore_flutter_web/widgets/responsive_widget.dart';
import 'package:flutter/material.dart';

class FloatingQuickAccessBar extends StatefulWidget {
  const FloatingQuickAccessBar({Key? key, required this.screenSize})
      : super(key: key);

  final Size screenSize;

  @override
  _FloatingQuickAccessBarState createState() => _FloatingQuickAccessBarState();
}

class _FloatingQuickAccessBarState extends State<FloatingQuickAccessBar> {
  final List<bool> _isHovering = [false, false, false, false];
  final List<Widget> _rowElements = [];

  final List<String> _items = ['Destination', 'Dates', 'People', 'Experience'];
  final List<IconData> _icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  List<Widget> _generateRowElements() {
    _rowElements.clear();
    for (int i = 0; i < _items.length; i++) {
      Widget elementTile = InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onHover: (value) {
          setState(() {
            _isHovering[i] = value;
          });
        },
        onTap: () {},
        child: Text(
          _items[i],
          style: TextStyle(
              color: _isHovering[i] ? Colors.blueGrey[900] : Colors.blueGrey),
        ),
      );

      Widget spacer = SizedBox(
        height: widget.screenSize.height / 20,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );

      _rowElements.add(elementTile);
      if (i < _items.length - 1) {
        _rowElements.add(spacer);
      }
    }

    return _rowElements;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        heightFactor: 1,
        child: Padding(
          padding: EdgeInsets.only(
              top: widget.screenSize.height * 0.4,
              left: ResponsiveWidget.isSmallScreen(context) ? widget.screenSize
                  .width / 12 : widget.screenSize.width / 5,
              right: ResponsiveWidget.isSmallScreen(context) ? widget.screenSize
                  .width / 12 : widget.screenSize.width / 5
          ),
          child: ResponsiveWidget.isSmallScreen(context) ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...Iterable<int>.generate(_items.length).map((int pageIndex) =>
                  Padding(padding: EdgeInsets.only(
                      top: widget.screenSize.height / 80), child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: widget.screenSize.height / 45,
                        bottom: widget.screenSize.height / 45,
                        left: widget.screenSize.width/20
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _icons[pageIndex],
                            color: Colors.blueGrey,
                          ),
                          SizedBox(width: widget.screenSize.width/20),
                          InkWell(
                            splashColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {},
                            child: Text(
                              _items[pageIndex],
                              style: const TextStyle(
                                color: Colors.blueGrey, fontSize: 16
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),))
            ],
          ): Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.only(
                top: widget.screenSize.height / 50,
                bottom: widget.screenSize.width / 50
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _generateRowElements(),
              ),
            ),
          )
        ));
  }
}
