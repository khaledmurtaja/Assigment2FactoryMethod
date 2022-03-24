import 'package:assigment2factortymethod/Applications/AddBirthApplication.dart';
import 'package:assigment2factortymethod/Applications/ApplictionInterface.dart';
import 'package:assigment2factortymethod/GUI/ApplicationForm.dart';
import 'package:assigment2factortymethod/GUI/Cubit/cubit.dart';
import 'package:assigment2factortymethod/ReusableComponenet/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddBirthForm extends ApplicationForm {
   //for radio buttons
  final TextEditingController dateController = TextEditingController();
  final TextEditingController birthName=TextEditingController();
  @override
  Widget applicationTitle() {
    return Text(
      "طلب اضافة مولود",
      style: TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget drawRemainingGUI(dynamic context,GUICubit cubit) {
    // TODO: implement drawRemainingGUI
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: TextFormField(
            controller: birthName,
            validator: (value){
              if(value!.isEmpty){
                print(23);
                return "الرجاء ادخال اسم المولود";
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'اسم المولود',
              hintText: 'اسم المولود',
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
              datePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  startDate: DateTime(2010),
                  lastDate: DateTime.now()
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
              labelText: 'تاريخ الميلاد',
              hintText: 'تاريخ الميلاد',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("male"),
                    Radio(
                        value: "1",
                        groupValue: cubit.groupVal,
                        onChanged: (value){
                          cubit.groupVal=value.toString();
                          cubit.onSelectRadioButton();
                        }
                    )
                  ],
                ),
                SizedBox(width: 15,),
                Row(
                  children: [
                    Text("female"),
                    Radio(
                        value: "2",
                        groupValue: cubit.groupVal,
                        onChanged: (value){
                          cubit.groupVal=value.toString();
                          cubit.onSelectRadioButton();
                        }
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ConditionalBuilder(
            condition:cubit.saveButtonClicked==true && cubit.groupVal=="-1" ,
            builder:(context){
              return Text(
                  "الرجاء ادخال جنس المولود",
                style: TextStyle(
                  color: Colors.red
                ),
              );
            } ,
            fallback:null ,
          ),
        )
      ],
    );
  }

  @override
  ApplicationInterface getApplicationInstance(GUICubit cubit) {
    AddBirthApplication application=AddBirthApplication();
    application.birthDateOfNewBirth=dateController.text;
    application.birthName=birthName.text;
    if(cubit.groupVal=="1"){
      application.gender="male";
    }else if(cubit.groupVal=="2"){
      application.gender="female";
    }
   return application;

  }


}
