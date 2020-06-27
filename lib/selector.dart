import 'package:cbd_grocery/constants.dart';
import 'package:flutter/material.dart';

class Selector extends StatefulWidget {
  final List<String> selections;
  final Function select;

  Selector({@required this.selections, @required this.select});

  @override
  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  int _currentIndex = 0;
  bool _isSelected;

  List<Widget> _buildSelections() {
    return widget.selections.map((selection) {
      int index = widget.selections.indexOf(selection);
      _isSelected = _currentIndex == index;
      return InkWell(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        mouseCursor: MaterialStateMouseCursor.clickable,
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: _isSelected ? kOrange3 : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isSelected ? kOrange6 : kGrey3,
              width: 1,
            ),
          ),
          child: Text(
            selection,
            style: kDefaultTextStyle.copyWith(
              color: _isSelected ? Colors.white : kGrey6,
              fontSize: 15,
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
          widget.select(widget.selections[index]);
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: _buildSelections(),
    );
  }
}
