import 'package:assigment2factortymethod/Applications/AddBirthApplication.dart';
import 'package:assigment2factortymethod/Applications/ApplictionInterface.dart';
import 'package:assigment2factortymethod/Applications/VisaApplication.dart';
import 'package:assigment2factortymethod/GUI/ApplicationForm.dart';
import 'package:assigment2factortymethod/GUI/Cubit/cubit.dart';
import 'package:assigment2factortymethod/ReusableComponenet/components.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VisaApplicationForm extends ApplicationForm{
  final TextEditingController dateController = TextEditingController();
  String? countryToTravel="US";
  @override
  Widget applicationTitle() {
    // TODO: implement applicationTitle
    return Text(
      "طلب تأشيرة للسفر الى الخارج",
      style: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget drawRemainingGUI(context, GUICubit cubit) {
    cubit.groupVal="-4";
    // TODO: implement drawRemainingGUI
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CountryListPick(
                appBar: AppBar(
                  backgroundColor: Colors.blue,
                  title: Text('Choose where to travel'),
                ),
                initialSelection: countryToTravel,
                theme: CountryTheme(
                  isShowFlag: true,
                  isShowTitle: true,
                  isShowCode: false,
                  isDownIcon: true,
                ),
                onChanged: (CountryCode? code){
                  countryToTravel=code!.name;
                } ,

              ),
              Spacer(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('مسافر الى'),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)

                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            validator: (value){
              if(value!.isEmpty){
                return "الرجاء ادخال موعد السفر";
              }

            },
            controller: dateController,
            onTap: () {
              datePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  startDate: DateTime.now(),
                  lastDate: DateTime(2023)
              )
                  .then((value) {
                print(value.toString());
                DateTime x = value!.toUtc();
                String datetime1 = DateFormat("yyyy-MM-dd").format(x);
                dateController.text = datetime1;
              }).catchError((error) {});
            },
            readOnly: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'تاريخ السفر',
              hintText: 'موعد السفر',
            ),
          ),
        ),

      ],
    );
  }

  @override
  ApplicationInterface getApplicationInstance(GUICubit cubit) {
    VisaAppliction application=VisaAppliction();
    application.whereToTravel=countryToTravel;
    application.travelDate=dateController.text;
    return application;
  }

}