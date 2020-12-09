import 'package:get/get.dart';

///
 class NavigationService{
   Future<T> toNamed<T>(String page, {dynamic arguments}){
     return Get.toNamed<T>(page, arguments: arguments);
   }

   dynamic get arguments => Get.arguments;
 }