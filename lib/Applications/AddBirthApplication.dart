import 'package:assigment2factortymethod/Applications/ApplictionInterface.dart';
class AddBirthApplication implements ApplicationInterface{
  @override
  String? applicantAddress;

  @override
  String? applicantName;

  @override
  String? idNumber;
  String? birthName;
  String? birthDateOfNewBirth;
  String? gender;

  @override
  String printData() {
    return 'AddBirthApplication{applicantAddress: $applicantAddress, applicantName: $applicantName, idNumber: $idNumber, birthName: $birthName, birthDateOfNewBirth: $birthDateOfNewBirth, gender: $gender}';

  }

}