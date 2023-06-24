import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../Controller/user_name_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  usercontroller _usercontroller = Get.put(usercontroller());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: usercontroller(),
        initState: (_){},
        builder: (_usercontroller){
          _usercontroller.getData();
          return Scaffold(
            body: Center(
              child: _usercontroller.isLoading ? CircularProgressIndicator() :
              ListView.separated(
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(_usercontroller.userList[index].name, style: TextStyle(fontSize: 19,),overflow: TextOverflow.visible, textAlign: TextAlign.start,),
                              Text(_usercontroller.userList[index].title, style: TextStyle(fontSize: 19,),overflow: TextOverflow.visible, textAlign: TextAlign.start,),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.edit)),
                              IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.deleteLeft)),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, index){
            return Divider(thickness: 2, color: Colors.black,);
            },
                  itemCount: _usercontroller.userList.length,
              ),

            ),
          );
        });
  }
}
