import 'package:assigment2factortymethod/Applications/ApplictionInterface.dart';
import 'package:assigment2factortymethod/GUI/Cubit/cubit.dart';
import 'package:assigment2factortymethod/ReusableComponenet/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/states.dart';

abstract class ApplicationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    final TextEditingController applicantName=TextEditingController();
    final TextEditingController applicantIdNumber=TextEditingController();
    final TextEditingController applicantAddress=TextEditingController();
    return BlocProvider(
      create: (context) => GUICubit(),
      child: BlocConsumer<GUICubit, GUIState>(
        builder: (context, state) {
          print(5532);
          var cubit = GUICubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      applicationTitle(),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: applicantName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              print(23);
                              return "الرجاء ادخال اسم مقدم الطلب";
                            }
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'الاسم',
                            hintText: 'اسم مقدم الطلب',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: applicantIdNumber,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "الرجاء ادخال رقم الهوية";
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'رقم الهوية',
                            hintText: 'رقم هوية مقدم الطلب',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: applicantAddress,
                          validator: (value) {
                            print(value);
                            if (value!.isEmpty) {
                              return "الرجاء ادخال عنوان مقدم الطلب";
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'العنوان',
                            hintText: 'عنوان مقدم الطلب',
                          ),
                        ),
                      ),
                      drawRemainingGUI(context, cubit),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: myButton(
                            title: "SAVE",
                            function: ()  {
                              cubit.saveButtonClicked = true;
                              cubit.onSaveButtonClicked();
                              if (formKey.currentState!.validate() &&
                                  cubit.groupVal != "-1") {
                                ApplicationInterface instance=getApplicationInstance(cubit);
                                instance.applicantName=applicantAddress.text;
                                instance.applicantAddress=applicantAddress.text;
                                instance.idNumber=applicantAddress.text;
                                print(instance.printData());
                              } else {}
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          // print(state.toString());
        },
      ),
    );
  }

  Widget applicationTitle();
  Widget drawRemainingGUI(dynamic context, GUICubit cubit);
  ApplicationInterface getApplicationInstance(GUICubit cubit);
}
