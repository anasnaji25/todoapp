import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constant/app_fonts.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:todoapp/view/add_todo_screen.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoController = Get.find<TODOcontroller>();
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    todoController.addSampleTodos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(Icons.short_text) ,
        actions: const[
          Icon(CupertinoIcons.search),
          SizedBox(width: 20,),
          Icon(CupertinoIcons.bell),
          SizedBox(width: 30,),
        ],
        elevation: 0,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("What's Up , Joy!",style: kheadingstyle,),
          ),
          const SizedBox(height: 36,),

           Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("categories".toUpperCase(),style: kSubheadingstyle,),
          ),
           const SizedBox(height: 16,),
          Container(
            height: 135,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                    const SizedBox(width: 20,),
                          Container(
                            width: 200,
                                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                                                  decoration: BoxDecoration(
                                                    color:  Colors.white,
                                                   boxShadow: const <BoxShadow>[
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 2.0,
                                                    )
                                                  ],
                                                      borderRadius: BorderRadius.circular(20), ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 10,bottom: 5,top: 10),
                                                        child: Text("40 tasks", style: kSubheadingstyle,),
                                                      ),
                                                       Padding(
                                                        padding: const EdgeInsets.only(left: 8),
                                                         child: Text("Business", style: kboldStyle),
                                                       ),
                                                        const SizedBox(height: 20,),

                                                       Padding(
                                                         padding: const EdgeInsets.only(left: 8),
                                                         child: Container(
                                                      height: 10,   
                                                         width: 70,
                                                         decoration: BoxDecoration(
                                                            color:  Colors.pink,
                                                             boxShadow: const <BoxShadow>[
                                                            BoxShadow(
                                                                color: Colors.black12,
                                                                blurRadius: 2.0,
                                                            )
                                                          ],
                                                              borderRadius: BorderRadius.circular(30), ),
                                                          child: Padding(
                                                           padding: const EdgeInsets.only(left: 10,bottom: 5,top: 5),
                                                           child: Text("", style: kSubheadingstyle2,),
                                                              )
                                                      ),
                                                       ),
                                                    ],
                                                  )
                                                ),
                                                  Container(
                                                 width: 200,
                                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 25),
                                                  decoration: BoxDecoration(
                                                    color:  Colors.white,
                                                   boxShadow: const <BoxShadow>[
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 2.0,
                                                    )
                                                  ],
                                                      borderRadius: BorderRadius.circular(20), ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                       Padding(
                                                        padding: const EdgeInsets.only(left: 10,bottom: 5,top: 10),
                                                        child: Text("18 tasks", style: kSubheadingstyle,),
                                                      ),
                                                       Padding(
                                                        padding: const EdgeInsets.only(left: 8),
                                                         child: Text("Personal",style: kboldStyle),
                                                       ),
                                                      const SizedBox(height: 20,),

                                                       Padding(
                                                         padding: const EdgeInsets.only(left: 8),
                                                         child: Container(
                                                      height: 10,   
                                                         width: 60,
                                                         decoration: BoxDecoration(
                                                            color:  Colors.blue,
                                                             boxShadow: const <BoxShadow>[
                                                            BoxShadow(
                                                                color: Colors.black12,
                                                                blurRadius: 2.0,
                                                            )
                                                          ],
                                                              borderRadius: BorderRadius.circular(30), ),
                                                          child: Padding(
                                                           padding: const EdgeInsets.only(left: 10,bottom: 5,top: 5),
                                                           child: Text("", style: kSubheadingstyle2,),
                                                              )
                                                      ),
                                                       ),
                                                    ],
                                                  )
                                                ),
              ]
            ),
          ),
          const SizedBox(height: 30,),

           Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("Today's Task".toUpperCase(),style: kSubheadingstyle,),
          ),
     const SizedBox(height: 15,),
    GetBuilder<TODOcontroller>(
               builder: (todoCntrl)=>  ListView.builder(
            shrinkWrap: true,
            itemCount: todoCntrl.listOfTodos.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
               return  todoCntrl.listOfTodos[index]['isDeleted'] ? Container(
                     height: 50,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 15),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Row(children: [
                           const  Icon(Icons.delete_outline,color: Colors.black45,),
                           const  SizedBox(width: 5,),
                             Text("This task was deleted",style: kSubheadingstyle2,),
                           ],),

                             Padding(
                               padding: const EdgeInsets.only(right: 15),
                               child: InkWell(
                                 onTap: (){
                                    todoCntrl.updatesUndoDeleteStatus(index);
                                 },
                                 child: Container(
                                                      height: 25,   
                                                       width: 60,
                                                       decoration: BoxDecoration(
                                                          color:  Colors.white,
                                                           boxShadow: const <BoxShadow>[
                                                          BoxShadow(
                                                              color: Colors.black12,
                                                              blurRadius: 2.0,
                                                          )
                                                        ],
                                                            borderRadius: BorderRadius.circular(30), ),
                                                        child: Padding(
                                                         padding: const EdgeInsets.only(left: 10,bottom: 5,top: 5),
                                                         child: Text("UNDO", style: kSubheadingstyle2,),
                                                            )
                                                      ),
                               ),
                             ),
                         ],
                       ),
                     ),
                   ):   Dismissible(
                   key: UniqueKey(),
                   onDismissed: (direction) async{
                         print("happended");
                     
                         todoCntrl.updatesDeleteStatus(index);
                          
                        await Future.delayed(const Duration(seconds: 3));
                           if(todoCntrl.listOfTodos[index]['isDeleted']){
                             print("removing....");
                             todoCntrl.removeFromTODO(index);
                           }
                   },
                   
                 child: Container(
                   height: 50, margin: const EdgeInsets.fromLTRB(15, 2, 15, 5),
                                                  decoration: BoxDecoration(
                                                    color:  Colors.white,
                                                   boxShadow: const <BoxShadow>[
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 1.0,
                                                    )
                                                  ],
                                                      borderRadius: BorderRadius.circular(20), ),
                                                  child: Row(
                                                    children: [
               
                                                     const SizedBox(
                                                        width: 10
                                                      ),
                                                                        Stack(
                                                                          children: [
                                        InkWell(
                                        onTap: () {
                                          if(todoCntrl.listOfTodos[index]['status'] == true){
                                                 todoCntrl.updatesStatusfalse(index);         
                                          }else{

                                             todoCntrl.updatesStatus(index);
                                          }
                                        },
                                        child: Container(
                                           height: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: todoCntrl.listOfTodos[index]['status'] ?  Colors.teal : Colors.white,
                                            border: Border.all(
                                              color: Colors.blue
                                            )
                                          ),
                                          child: todoCntrl.listOfTodos[index]['status']
                                              ? const Icon(
                                                  Icons.check,
                                                  size: 23.0,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  Icons.check,
                                                  size: 23.0,
                                                  color: Colors.white,
                                                )
                                        ),
                                          ),
               
                                       todoCntrl.listOfTodos[index]['status']?    Container(
                                           height: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:  Colors.white54,
                                            border: Border.all(
                                              color: Colors.white24
                                            )
                                          ),
                                          child: todoCntrl.listOfTodos[index]['status']
                                              ? const Icon(
                                                  Icons.check,
                                                  size: 23.0,
                                                  color: Colors.white,
                                                )
                                              : const Icon(
                                                  Icons.check,
                                                  size: 23.0,
                                                  color: Colors.white,
                                                )
                                        ) : Container(   height: 25,)
                                                                          ],
                                                                        ),
                                                      Padding(
                                                       padding: const EdgeInsets.only(left: 8),
                                                        child: Text(todoCntrl.listOfTodos[index]['task'],style: todoCntrl.listOfTodos[index]['status'] ? knormalStyle2 : knormalStyle),
                                                      ),
                                                    ],
                                                  )
                                                ),
               );
          })),

          

        ],
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(AddTODOScreen());
        },
        tooltip: 'Add TODO',
        child: const Icon(Icons.add),
      ),
    );
  }
}