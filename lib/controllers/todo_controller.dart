


import 'package:get/get.dart';
import 'package:todoapp/view/homescreen_view.dart';

class TODOcontroller extends GetxController{

  List listOfTodos = [].obs;


  List sampleTodos = [
    {
      "task": "check emails",
      "status": false,
      "isDeleted": false

  },
    {
      "task": "Pay for rent",
      "status": false,
      "isDeleted": false

  },
    {
      "task": "Meditaion",
      "status": false,
      "isDeleted": false

  },
   {
      "task": "Lunch with Emma",
      "status": true,
      "isDeleted": false

  },
  ];


  addSampleTodos(){
    listOfTodos= sampleTodos ;
  }

  updatesStatus(int i){
     listOfTodos[i]['status'] = true;
 
 update();
  }

  updatesStatusfalse(int i){
     listOfTodos[i]['status'] = false;
 
 update();
  }

  updatesDeleteStatus(int i){
 listOfTodos[i]['isDeleted'] = true;
 update();
  }

  updatesUndoDeleteStatus(int i){
  listOfTodos[i]['isDeleted'] = false;
  print("updated ,,,,,,,,");
  update();
  }


  removeFromTODO(int i){
 listOfTodos.removeAt(i);
 listOfTodos[i]['isDeleted'] = false;
 update();
  }



  addNewTask(String task){
    listOfTodos.insert(0,{
      "task": task,
      "status": false,
      "isDeleted": false
    });
     
     Get.off(HomeScreen());
   
    update();
  }

}