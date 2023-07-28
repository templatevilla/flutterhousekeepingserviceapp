import 'package:house_services/utils/constant/app_string.dart';

class PickupModel{
  String? day;
  String? date;
  PickupModel({
    this.date,
    this.day,
  });
}
List<PickupModel> pickUpdate =[
  PickupModel(day: AppText.sun,
    date: '7',
  ),
  PickupModel(day: AppText.mon,
    date: '8',
  ),
  PickupModel(day: AppText.tue,
    date: '9',
  ),
  PickupModel(day: AppText.wed,
    date: '10',
  ),
  PickupModel(day: AppText.thu,
    date: '11',
  ),
  PickupModel(day: AppText.fri,
    date: '12',
  ),
];

 List<String> pickupTime =[
  '8:30 AM', '9:00 AM', '9:30 AM', '10:00 AM',
];
