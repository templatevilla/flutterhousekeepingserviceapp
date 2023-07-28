import 'package:house_services/utils/constant/app_image.dart';
import 'package:house_services/utils/constant/app_string.dart';

//Worker Categories
class WorkCategories {
  String? image;
  String? name;

  WorkCategories({
    this.image,
    this.name,

  });
}
List<WorkCategories> categoriesModel = [
  WorkCategories(
    image: AppImages.cleaning,
    name: AppText.cleaning,
  ),
  WorkCategories(
    image: AppImages.plumbing,
    name: AppText.plumbing,
  ),WorkCategories(
    image: AppImages.laundry,
    name: AppText.laundry,
  ),WorkCategories(
    image: AppImages.carWash,
    name: AppText.carWash,
  ),
  WorkCategories(
    image: AppImages.repair,
    name: AppText.repairing,
  ),

];

// nearest Worker Container Model
class ServicesDetails {
  String? image;
  String? title;
  String? placeFar;
  String? rating;
  String? rate;

  ServicesDetails({
    this.image,
    this.title,
    this.placeFar,
    this.rating,
    this.rate,
  });
}
List<ServicesDetails>  servicesDetails =[
  ServicesDetails(
    image: AppImages.laundryPerson,
    title: AppText.cleaner,
    placeFar: AppText.cleaningFar,
    rating: AppText.cleaningStar,
    rate: AppText.cleaningRate,
  ),
  ServicesDetails(
    image: AppImages.plumberPerson,
    title: AppText.plumber,
    placeFar: AppText.plumberFar,
    rating: AppText.plumberStar,
    rate: AppText.plumberRate,
  ),
  ServicesDetails(
    image: AppImages.repairingPerson,
    title: AppText.repairer,
    placeFar: AppText.repairerFar,
    rating: AppText.repairerStar,
    rate: AppText.repairerRate,
  ),
  ServicesDetails(
    image: AppImages.laundryPerson,
    title: AppText.cleaner,
    placeFar: AppText.cleaningFar,
    rating: AppText.cleaningStar,
    rate: AppText.cleaningRate,
  ),

];