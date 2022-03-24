import 'ApplictionInterface.dart';

class VisaAppliction implements ApplicationInterface{
  @override
  String? applicantAddress;

  @override
  String? applicantName;

  @override
  String? idNumber;
  String? whereToTravel;
  String? travelDate;

  @override
  String printData() {
    return 'VisaAppliction{applicantAddress: $applicantAddress, applicantName: $applicantName, idNumber: $idNumber, whereToTravel: $whereToTravel, travelDate: $travelDate}';

  }


}