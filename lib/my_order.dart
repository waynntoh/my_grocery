import 'package:cbd_grocery/constants.dart';
import 'package:cbd_grocery/google_map.dart';
import 'package:cbd_grocery/order.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyOrderScreen extends StatefulWidget {
  final Function searchOrder;

  MyOrderScreen({@required this.searchOrder});

  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  double width;
  double height;
  TextEditingController trackingNumberController = TextEditingController();
  bool failedSearch = false;
  bool successfulSearch = false;
  Order order = new Order();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    trackingNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF3FFFF),
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF3FFFF),
                  Color(0xFFDFEAFF),
                  Color(0xFFF3FFFF),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Center(
              child: Container(
                width: width - 140,
                height: height - 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [kItemCardShadow],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24),
                              ),
                              image: DecorationImage(
                                  image: AssetImage('images/background5.jpg'),
                                  fit: BoxFit.cover),
                            ),
                            child: successfulSearch
                                ? ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      bottomLeft: Radius.circular(24),
                                    ),
                                    child: GoogleMap(),
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 72, vertical: 56),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(21),
                            bottomRight: Radius.circular(21),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              successfulSearch
                                  ? 'Order Details'
                                  : 'Track Your Order',
                              style: kHeaderTextStyle.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: !successfulSearch ? 160 : 48),
                            !successfulSearch
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Form(
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              controller:
                                                  trackingNumberController,
                                              decoration:
                                                  kTextFieldDecoration.copyWith(
                                                hintText: 'Tracking Number',
                                                hintStyle: kDefaultTextStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 32),
                                      Container(
                                        height: 48,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xFF1666FF),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: InkWell(
                                          hoverColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          mouseCursor: MaterialStateMouseCursor
                                              .clickable,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Track Order',
                                                style:
                                                    kHeaderTextStyle.copyWith(
                                                  fontSize: 17,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(width: 24),
                                              FaIcon(
                                                FontAwesomeIcons.search,
                                                color: Colors.white,
                                                size: 22,
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            order = widget.searchOrder(
                                                trackingNumberController.text);

                                            if (order != null) {
                                              setState(() {
                                                successfulSearch = true;
                                                failedSearch = false;
                                              });
                                            } else {
                                              setState(() {
                                                failedSearch = true;
                                                successfulSearch = false;
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(height: 56),
                                      Text(
                                        failedSearch
                                            ? 'Oops, No Order Found!'
                                            : '',
                                        style: kHeaderTextStyle.copyWith(
                                          fontSize: 21,
                                          color: Colors.redAccent[400],
                                        ),
                                      )
                                    ],
                                  )
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.userAlt,
                                            color: Color(0xFF0048FF),
                                            size: 24,
                                          ),
                                          SizedBox(width: 24),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Full Name',
                                                textAlign: TextAlign.start,
                                                style:
                                                    kDefaultTextStyle.copyWith(
                                                  color: kGrey6,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                '${order.name}',
                                                textAlign: TextAlign.start,
                                                style: kDefaultTextStyle
                                                    .copyWith(color: kGrey3),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 18),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.phone,
                                            color: Color(0xFF0048FF),
                                            size: 24,
                                          ),
                                          SizedBox(width: 24),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Contact Number',
                                                textAlign: TextAlign.start,
                                                style:
                                                    kDefaultTextStyle.copyWith(
                                                  color: kGrey6,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                '${order.contact}',
                                                textAlign: TextAlign.start,
                                                style: kDefaultTextStyle
                                                    .copyWith(color: kGrey3),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 18),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.houseUser,
                                            color: Color(0xFF0048FF),
                                            size: 24,
                                          ),
                                          SizedBox(width: 24),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Address',
                                                textAlign: TextAlign.start,
                                                style:
                                                    kDefaultTextStyle.copyWith(
                                                  color: kGrey6,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                '${order.address}',
                                                textAlign: TextAlign.start,
                                                style: kDefaultTextStyle
                                                    .copyWith(color: kGrey3),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 18),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.clock,
                                            color: Color(0xFF0048FF),
                                            size: 24,
                                          ),
                                          SizedBox(width: 24),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Preferred Delivery Time',
                                                textAlign: TextAlign.start,
                                                style:
                                                    kDefaultTextStyle.copyWith(
                                                  color: kGrey6,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                '${order.deliveryTime}',
                                                textAlign: TextAlign.start,
                                                style: kDefaultTextStyle
                                                    .copyWith(color: kGrey3),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 18),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.creditCard,
                                            color: Color(0xFF0048FF),
                                            size: 24,
                                          ),
                                          SizedBox(width: 24),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Payment Method',
                                                textAlign: TextAlign.start,
                                                style:
                                                    kDefaultTextStyle.copyWith(
                                                  color: kGrey6,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                '${order.paymentMethod}',
                                                textAlign: TextAlign.start,
                                                style: kDefaultTextStyle
                                                    .copyWith(color: kGrey3),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 18),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.moneyBill,
                                            color: Color(0xFF0048FF),
                                            size: 24,
                                          ),
                                          SizedBox(width: 24),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Total',
                                                textAlign: TextAlign.start,
                                                style:
                                                    kDefaultTextStyle.copyWith(
                                                  color: kGrey6,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(height: 6),
                                              Text(
                                                'RM${order.total.toStringAsFixed(2)}',
                                                textAlign: TextAlign.start,
                                                style: kDefaultTextStyle
                                                    .copyWith(color: kGrey3),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 26,
            top: 26,
            child: InkWell(
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              mouseCursor: MaterialStateMouseCursor.clickable,
              child: FaIcon(
                FontAwesomeIcons.arrowAltCircleLeft,
                size: 32,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
