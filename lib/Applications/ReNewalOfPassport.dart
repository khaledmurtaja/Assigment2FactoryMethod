import 'package:assigment2factortymethod/Applications/ApplictionInterface.dart';

class RenewPassportApplication implements ApplicationInterface{
  @override
  String? applicantAddress;

  @override
  String? applicantName;

  @override
  String? idNumber;
  String? oldPassportId;
  String? passportExpireDate;

  @override
  String printData() {
    // TODO: implement printData
    return  'RenewPassportApplication{applicantAddress: $applicantAddress, applicantName: $applicantName, idNumber: $idNumber, oldPassportId: $oldPassportId, passportExpireDate: $passportExpireDate}';

  }

}