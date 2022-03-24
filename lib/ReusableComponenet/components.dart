import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget myButton({
  required String title,
  required Function function

}){
  return  Container(
    width: double.infinity,
    child: ElevatedButton(
        onPressed:(){
          function();
        },
        child: Text(title)
    ),
  );
}
void navigateTo(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  }));
}
void navigateAndReplace(context, widget) {
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
    return widget;
  }), (route) => false);
}
Future<DateTime?> datePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime startDate,
  required DateTime lastDate
}){
  return
    showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: startDate,
      lastDate: lastDate);
}
