import 'dart:html';
import 'dart:ui';
import 'package:cbd_grocery/cart.dart';
import 'package:cbd_grocery/constants.dart';
import 'package:cbd_grocery/order.dart';
import 'package:cbd_grocery/selector.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_string/random_string.dart';

class Form2Screen extends StatefulWidget {
  final Function addOrder;
  final Cart cart;
  final String name;
  final String contact;
  final String address;

  Form2Screen({
    @required this.addOrder,
    @required this.name,
    @required this.contact,
    @required this.address,
    @required this.cart,
  });

  @override
  _Form2ScreenState createState() => _Form2ScreenState();
}

class _Form2ScreenState extends State<Form2Screen> {
  double width;
  double height;
  String deliveryTime = '7AM - 10AM';
  String paymentMethod = 'Cash On Delivery';
  String trackingNumber;

  bool _copyToClipboardHack(String text) {
    final textarea = new TextAreaElement();
    document.body.append(textarea);
    textarea.style.border = '0';
    textarea.style.margin = '0';
    textarea.style.padding = '0';
    textarea.style.opacity = '0';
    textarea.style.position = 'absolute';
    textarea.readOnly = true;
    textarea.value = text;
    textarea.select();
    final result = document.execCommand('copy');
    textarea.remove();
    return result;
  }

  void setDeliveryTime(String time) {
    setState(() {
      deliveryTime = time;
    });
  }

  void setPaymentMethod(String method) {
    setState(() {
      paymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF3F3F3),
                  Color(0xFFE9E9E9),
                  Color(0xFFF3F3F3),
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
                                  image: AssetImage('images/background3.jpg'),
                                  fit: BoxFit.cover),
                            ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Details',
                              style: kHeaderTextStyle.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Preferred Delivery Time',
                                      style: kDefaultTextStyle.copyWith(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Selector(
                                        select: setDeliveryTime,
                                        selections: [
                                          '7AM - 10AM',
                                          '10AM - 1PM',
                                          '1PM - 4PM',
                                          '4PM - 7PM',
                                          '7PM - 10PM',
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 28),
                                    Text(
                                      'Payment Method',
                                      style: kDefaultTextStyle.copyWith(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Selector(
                                        select: setPaymentMethod,
                                        selections: [
                                          'Cash On Delivery',
                                          'Visa Card',
                                          'Master Card',
                                          'Paypal',
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 28),
                                    TextFormField(
                                      decoration: kTextFieldDecoration.copyWith(
                                        hintText:
                                            'Additional Requests (Optional)',
                                        hintStyle: kDefaultTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32),
                                RichText(
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Payments Terms of Service',
                                      style: kDefaultTextStyle.copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFFFFB446),
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' and ',
                                      style: kDefaultTextStyle.copyWith(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: kDefaultTextStyle.copyWith(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFFFFB446),
                                      ),
                                    )
                                  ]),
                                ),
                                SizedBox(height: 32),
                                Container(
                                  height: 48,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFA014),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: InkWell(
                                    hoverColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    mouseCursor:
                                        MaterialStateMouseCursor.clickable,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Complete Order',
                                          style: kHeaderTextStyle.copyWith(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        FaIcon(
                                          FontAwesomeIcons.shoppingBag,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      trackingNumber = '#${randomNumeric(32)}';

                                      Order newOrder = new Order();
                                      newOrder.initialize(
                                          widget.cart.cartItems,
                                          widget.cart.total,
                                          widget.name,
                                          widget.contact,
                                          widget.address,
                                          deliveryTime,
                                          paymentMethod,
                                          trackingNumber);

                                      widget.addOrder(newOrder);
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                          actionsPadding:
                                              EdgeInsets.only(right: 6),
                                          titleTextStyle:
                                              kHeaderTextStyle.copyWith(
                                            color: kOrange4,
                                          ),
                                          title: Text('Order Placed!'),
                                          content: RichText(
                                            text: TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Tracking Number',
                                                  style: TextStyle(
                                                    color: kGrey4,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '\n$trackingNumber',
                                                  style: TextStyle(
                                                    color: kGrey6,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            FlatButton(
                                              color: kOrange3,
                                              onPressed: () {
                                                _copyToClipboardHack(
                                                    trackingNumber);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                Icons.content_copy,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
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
