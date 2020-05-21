import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/models/trolley_item.dart';
import 'package:myward/service/trolley_details.dart';

class Warning extends StatefulWidget {

  @override
  _WarningState createState() => _WarningState();
}

class _WarningState extends State<Warning> {

  final TrolleyDataService trolleyDataService = TrolleyDataService();

  Future _existItemList;
  bool isSearch = false;

  Future<List<Trolley>> getExistItemList() async{
    return await TrolleyDataService().getTrolleyItemList('used');
  }

  @override
  void initState() {
    _existItemList = getExistItemList() ?? [];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text('Warning..!!!',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 25.0,letterSpacing: 4),),
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60.0),
              topRight: Radius.circular(60.0)
          ),
          // gradient: Gradient(colors: [Colors.blue,Colors.grey])
        ),
        child: FutureBuilder(
            future: _existItemList,
            builder:  (_,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child:CircularProgressIndicator(),
                );
              }
              else if(snapshot.hasError){
                return Center(
                    child:Text(snapshot.error)
                );
              }
              else{
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        Trolley item = snapshot.data[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Text(
                                item.item,
                                maxLines: 3,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.bold),
                              ),
                              trailing: FlatButton(
                                  color: Colors.green[500],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0)
                                  ),
                                  onPressed: (){
                                    trolleyDataService.updateItemStatus(item.itemId, 'exsist');
                                  }, child: Text('Add',style: TextStyle(color: Colors.white),)
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        );
                      }
                  ),
                );
              }
            }
        ),
      ),
    );
  }
}
