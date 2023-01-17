import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lepton_sci_web/razor_pay.dart/widget/neumorphism.dart';
import 'package:razorpay_web/razorpay_web.dart';
import 'package:slider_button/slider_button.dart';

import '../../widgets/button_Container.dart';
  class CheckOutScreen extends StatefulWidget {
  String customername;
  String phoneNumber;
  String pinCode;
  String userAddress;
  String totalPrice;
  String deliveryCharge;
  String bookName;
  String totalAmount = '449';
  CheckOutScreen(
      {required this.totalPrice,
      required this.phoneNumber,
      required this.bookName,
      required this.customername,
      required this.deliveryCharge,
      required this.userAddress,
      required this.pinCode,
      Key? key})
      : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final _razorpay = Razorpay();
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // afterPaymentSucess();

    log("PaymentDone!!!!!!!!");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log("PaymentError!!!!!!!!");
  }

  void _handlePaymentWallet(ExternalWalletResponse response) {}

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 59),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ButtonContainerWidget(
                    curving: 10,
                    colorindex: 0,
                    height: 40,
                    width: 40,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Checkout",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                NewMorphismBlackWidget(
                    height: 210,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          ButtonContainerWidget(
                            curving: 30,
                            colorindex: 1,
                            height: 40,
                            width: 200,
                            child: Center(
                              child: Text(
                                "Purchacing Course Details",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          Text(
                            widget.bookName,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    )),
                SizedBox(height: 10),
                SizedBox(height: 10),
                const Text(
                  "Order Summary",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Subtotal : ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      widget.totalPrice,
                      style: const TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Delivery charge : ",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      widget.deliveryCharge,
                      style: const TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                NewMorphismBlackWidget(
                  width: 320,
                  height: 60,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total :',
                            style: TextStyle(
                                color: Color.fromARGB(255, 165, 157, 157),
                                fontSize: 17),
                          ),
                          Text(widget.totalAmount,
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 20))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                //<<<<<<<<<<<<<<<<Payment Mehtod >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                SliderButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  height: 70,
                  width: 450,
                  baseColor: Colors.blue,
                  backgroundColor: const Color.fromARGB(255, 26, 32, 44),
                  action: () async {
                    double paymentPrice = 1 * 100;
                    // Get.off(PaymentScreen());
                    //
                    var options = {
                      'key': 'rzp_test_4H63BqbBLQlmNQ',
                      //amount will be multiple of 100
                      'amount': paymentPrice.toString(), //so its pay 500
                      'name': '',
                      'description': 'SciPro',
                      'timeout': 300, // in seconds
                      'prefill': {
                        'contact': '9544782189',
                        'email': 'leptonscipro@gmail.com'
                      }
                    };

                    _razorpay.open(options);
                    //
                    try {} on Razorpay catch (e) {}
                  },
                  label: Text(
                    'Proceed To PayOnline',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
