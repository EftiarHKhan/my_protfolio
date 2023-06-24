import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_protfolio/Model/data_read_model.dart';

class usercontroller extends GetxController{
  var isLoading = false;
  var userList = <UserNameModel>[];
  
  Future<void> getData() async {
    try{
      QuerySnapshot users = await FirebaseFirestore.instance.collection("user_name").orderBy('name').get();
      userList.clear();
      for(var user in users.docs) {
        userList.add(UserNameModel(user['name'], user['title'], user.id));
      }
      isLoading = false;
    } catch(e) {
      Get.snackbar('Error', '${e.toString()}');
    }
  }
}