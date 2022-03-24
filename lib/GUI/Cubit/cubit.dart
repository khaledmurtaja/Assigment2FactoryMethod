import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'states.dart';

class GUICubit extends Cubit<GUIState>{
  GUICubit() : super(InitialGUI());
  bool saveButtonClicked=false;
  String groupVal="-1";
  static GUICubit get(BuildContext context) =>BlocProvider.of(context);
  void onSelectRadioButton()
  {
    emit(RadioButtonSelectState());
  }
  void onSaveButtonClicked(){
    emit(SaveButtonClicked());
  }

}
