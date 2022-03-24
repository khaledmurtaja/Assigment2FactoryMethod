import 'package:flutter/material.dart';

import 'GUI/RenewalPassportForm.dart';
import 'GUI/VisaApplicationForm.dart';
import 'GUI/addBirthForm.dart';
import 'ReusableComponenet/components.dart';

class ChooseService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('وزارة الداخلية'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                myButton(
                    title: " طلب اضافة مولود جديد",
                    function: () {
                      navigateTo(context,AddBirthForm());
                    }),
                myButton(
                    title: " طلب تجديد جواز سفر",
                    function: () {
                      navigateTo(context,RenewalPassportForm ());
                    }),
                myButton(
                    title: "طلب تأشيرة سفر",
                    function: () {
                      navigateTo(context, VisaApplicationForm());
                    })
              ],
            ),
          ),
        ));
  }
}
