import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant/app_fonts.dart';
import 'package:todoapp/controllers/todo_controller.dart';



class AddTODOScreen extends StatefulWidget {
  AddTODOScreen({Key? key}) : super(key: key);

  @override
  _AddTODOScreenState createState() => _AddTODOScreenState();
}

class _AddTODOScreenState extends State<AddTODOScreen> {
  final todoController = Get.find<TODOcontroller>();
  
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
             const SizedBox(width: 5,),
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Padding(
                  padding:  EdgeInsets.all(15.0),
                  child: Icon(CupertinoIcons.xmark_circle,size: 50,color: Colors.black45,),
                ),
              )
            ],

          ),

            const SizedBox(height: 150),

            Padding(
              padding: const EdgeInsets.fromLTRB(15,5,15,5),
              child: TextField(
                cursorColor: Colors.black54,
                  style: const TextStyle(fontSize: 30),
                  
                cursorHeight: 50,
                decoration:const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter new task"
                 ),
                controller: textController,
              ),
            ),
             const SizedBox(height: 30),
             
             Padding(
               padding: const EdgeInsets.only(left: 50),
               child: Row(
                 children: [
                     Container(
                       height: 50,
                                                   width: 110,
                                                  margin: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                                                    decoration: BoxDecoration(
                                                      color:  Colors.white,
                                                     boxShadow: const <BoxShadow>[
                                                      BoxShadow(
                                                          color: Colors.black12,
                                                          blurRadius: 2.0,
                                                      )
                                                    ],
                                                        borderRadius: BorderRadius.circular(30), ),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        const Padding(
                                                          padding:  EdgeInsets.only(left: 15),
                                                          child:  Icon(Icons.date_range_rounded,color: Colors.black38,),
                                                        ),
                                                         Padding(
                                                          padding: const EdgeInsets.only(left: 5,bottom: 5,top: 10),
                                                          child: Text("Today", style: kSubheadingstyle2,),
                                                        ),
                                                        
                 ])
                                                  ),

                                                     Container(
                                                     height: 50,
                                                   width: 50,
                                                  margin: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                                                    decoration: BoxDecoration(
                                                      color:  Colors.white,
                                                     boxShadow: const <BoxShadow>[
                                                      BoxShadow(
                                                          color: Colors.black12,
                                                          blurRadius: 2.0,
                                                      )
                                                    ],
                                                        borderRadius: BorderRadius.circular(30), ),
                                                    child: Radio(value: 1, groupValue: 1, onChanged: (value){})
                                                  ),
                 ],
               ),
             ),

             const SizedBox(height: 100),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: const[
                 Icon(Icons.drive_folder_upload_outlined,color: Colors.black38,),
              SizedBox(width: 50),
                 Icon(Icons.flag_outlined,color: Colors.black38,),
              SizedBox(width: 50),
                 Icon(Icons.dark_mode_outlined,color: Colors.black38,),
               ],
             )
        ],
      ),

        floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          if(textController.text.isNotEmpty || textController.text != ""){

          todoController.addNewTask(textController.text);
          }else{
            Get.snackbar("Task Can't be Empty", "Please enter a new task to continue",backgroundColor: Colors.red,colorText: Colors.white);
          }
        },
        tooltip: 'Add TODO',
         label: Row(
           children: const[
             Text("New task"),
             SizedBox(width: 5),
             Icon(CupertinoIcons.chevron_up,size: 15,)
           ],
         )
      ),
    );
  }
}