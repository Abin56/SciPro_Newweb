import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/book_perchase_model.dart';
import '../razor_pay.dart/widget/new_checkoutscreen.dart';
import '../widgets/button_container.dart';

class AddNewDeliveryAddress extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _userName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _pinCode = TextEditingController();
  final _userAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fill Address'),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill the name';
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _userName,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      helperText: 'Enter full name',
                      helperStyle: TextStyle(color: Colors.black),
                      isDense: true,
                      filled: true,
                      fillColor: Color.fromARGB(0, 16, 16, 16),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      )))),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill the PhoneNumber';
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: _phoneNumber,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      helperText: 'PhoneNumber',
                      helperStyle: TextStyle(color: Colors.black),
                      isDense: true,
                      filled: true,
                      fillColor: Color.fromARGB(0, 16, 16, 16),
                      hintText: 'PhoneNumber',
                      hintStyle: TextStyle(color: Colors.grey),
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      )))),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please fill the Pincode';
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: _pinCode,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      helperText: 'Enter PinCode',
                      helperStyle: TextStyle(color: Colors.black),
                      hintText: ' PinCode',
                      isDense: true,
                      filled: true,
                      fillColor: Color.fromARGB(0, 16, 16, 16),
                      hintStyle: TextStyle(color: Colors.grey),
                      focusColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      )))),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please fill the Address';
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _userAddress,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  helperText: 'Enter Perment Address',
                  helperStyle: TextStyle(color: Colors.black),
                  isDense: true,
                  filled: true,
                  fillColor: Color.fromARGB(0, 16, 16, 16),
                  hintText: 'Address',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {},
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          final String name = _userName.text.trim();
                          final String phoneNumber =
                              _phoneNumber.text.toString().trim();
                          final String pinCode =
                              _pinCode.text.toString().trim();
                          final String address = _userAddress.text.toString();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOutScreen(
                                totalPrice: '399.00/-',
                                phoneNumber: phoneNumber,
                                bookName:
                                    'Medical    Laboratory\n\n      Techinology  \n\n\n  SCI PRO Rank File',
                                customername: name,
                                userAddress: address,
                                pinCode: pinCode,
                                deliveryCharge: '50/-',
                              ),
                            ),
                          );
                        }
                      },
                      child: ButtonContainerWidget(
                        curving: 30,
                        colorindex: 5,
                        height: 60,
                        width: 200,
                        child: Center(
                          child: Text(
                            'Place order',
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
