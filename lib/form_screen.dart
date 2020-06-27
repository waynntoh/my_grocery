import 'dart:ui';
import 'package:cbd_grocery/cart.dart';
import 'package:cbd_grocery/constants.dart';
import 'package:cbd_grocery/form2_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class FormScreen extends StatefulWidget {
  final Function addOrder;
  final Cart cart;

  FormScreen({@required this.addOrder, @required this.cart});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  double width;
  double height;
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController address2Controller = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    contactController.dispose();
    addressController.dispose();
    address2Controller.dispose();
    super.dispose();
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
                  Color(0xFFFFF9EF),
                  kOrange0,
                  Color(0xFFFFF9EF),
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
                                  image: AssetImage('images/background2.jpg'),
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
                              'Recipient Details',
                              style: kHeaderTextStyle.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Form(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: nameController,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                          hintText: 'Full Name',
                                          hintStyle: kDefaultTextStyle,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      TextFormField(
                                        controller: contactController,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                          hintText: 'Contact Number',
                                          hintStyle: kDefaultTextStyle,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      TextFormField(
                                        controller: addressController,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                          hintText: 'Address 1',
                                          hintStyle: kDefaultTextStyle,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      TextFormField(
                                        controller: address2Controller,
                                        decoration:
                                            kTextFieldDecoration.copyWith(
                                          hintText: 'Address 2',
                                          hintStyle: kDefaultTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
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
                                          'Proceed',
                                          style: kHeaderTextStyle.copyWith(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 24),
                                        FaIcon(
                                          FontAwesomeIcons
                                              .solidArrowAltCircleRight,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                          duration: Duration(milliseconds: 750),
                                          child: Form2Screen(
                                            addOrder: widget.addOrder,
                                            name: nameController.text,
                                            contact: contactController.text,
                                            address:
                                                '${addressController.text} ${address2Controller.text}',
                                            cart: widget.cart,
                                          ),
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
