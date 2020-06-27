import 'package:cbd_grocery/constants.dart';
import 'package:cbd_grocery/items.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemCard extends StatefulWidget {
  final Item item;
  final Function addThis;

  ItemCard({@required this.item, @required this.addThis});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int count = 0;
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 400,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [kItemCardShadow]),
      child: Column(
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.item.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.item.name}',
                        style: kDefaultTextStyle.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'RM${widget.item.price.toStringAsFixed(2)}',
                        style: kDefaultTextStyle.copyWith(
                          color: Color(0xFFED8D00),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Text(
                    '${widget.item.desc}',
                    style: kDefaultTextStyle.copyWith(
                      fontSize: 14,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFFE3B9),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (added) {
                                  return;
                                }
                                if (count == 0) {
                                  return;
                                }
                                count -= 1;
                              });
                            },
                          ),
                          SizedBox(width: 12),
                          SizedBox(
                            width: 16,
                            child: Text(
                              '$count',
                              textAlign: TextAlign.center,
                              style: kDefaultTextStyle.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          InkWell(
                            mouseCursor: MaterialStateMouseCursor.clickable,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFFFE3B9),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            onTap: () {
                              if (added) {
                                return;
                              }
                              setState(() {
                                count += 1;
                              });
                            },
                          ),
                        ],
                      ),
                      InkWell(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        child: Container(
                          width: 72,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:
                                !added ? Color(0xFFFFB64A) : Color(0xFF35F370),
                          ),
                          child: Center(
                            child: FaIcon(
                              !added
                                  ? FontAwesomeIcons.cartPlus
                                  : FontAwesomeIcons.check,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        onTap: () {
                          if (count == 0 || added) {
                            return;
                          }
                          widget.addThis(widget.item, count);
                          setState(() {
                            added = true;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
