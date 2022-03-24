import 'package:assigment2factortymethod/Applications/ApplictionInterface.dart';
import 'package:assigment2factortymethod/Applications/ReNewalOfPassport.dart';
import 'package:assigment2factortymethod/GUI/ApplicationForm.dart';
import 'package:assigment2factortymethod/GUI/Cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class RenewalPassportForm extends ApplicationForm{
  final TextEditingController oldPassportId=TextEditingController();
  final TextEditingController dateController=TextEditingController();
  @override
  Widget applicationTitle() {
    return Text(
      "طلب تجديد جواز السفر",
      style: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );

  }

  @override
  Widget drawRemainingGUI(context, GUICubit cubit) {
    cubit.groupVal="-4"; // just to confirm condition
    // TODO: implement drawRemainingGUI
    return
      Column(
        children: [
          Padding(
          padding: EdgeInsets.all(15),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller:oldPassportId ,
            validator: (value){
              if(value!.isEmpty){
                return "الرجاء ادخال رقم جواز السفر القديم";
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'رقم جواز السفر القديم',
              hintText: 'رقم جواز السفر القديم',
            ),
          ),
    ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value){
                if(value!.isEmpty){
                  print(23);
                  return "الرجاء ادخال تاريخ الميلاد";
                }

              },
              controller: dateController,
              onTap: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime.now())
                    .then((value) {
                  print(value.toString());
                  DateTime x = value!.toUtc();
                  String datetime = DateFormat("yyyy-MM-dd").format(x);
                  dateController.text = datetime;
                }).catchError((error) {});
              },
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'تاريخ الميلاد',
                hintText: 'تاريخ الميلاد',
              ),
            ),
          ),
        ],
      );


  }

  @override
  ApplicationInterface getApplicationInstance(GUICubit cubit) {
    RenewPassportApplication application=RenewPassportApplication();
    application.passportExpireDate=dateController.text;
    application.oldPassportId=oldPassportId.text;
    return application;

  }

}