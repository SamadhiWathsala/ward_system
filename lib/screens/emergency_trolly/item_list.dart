import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/models/trolley_item.dart';
import 'package:myward/service/trolley_details.dart';

class ItemList extends StatefulWidget {

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {

  final TrolleyDataService trolleyDataService = TrolleyDataService();

  Future _existItemList;
  bool isSearch = false;

  Future<List<Trolley>> getExistItemList() async{
    return await TrolleyDataService().getTrolleyItemList('exsist');
  }

  @override
  void initState() {
    _existItemList = getExistItemList() ?? [];
    super.initState();
  }


  void _filterItem(value){
    print(value);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: !isSearch ? Text('Emergency Trolley')
            : TextField(
          onChanged: (value){
            _filterItem(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search item here',
              icon: Icon(Icons.search,color: Colors.white,),
              hintStyle: TextStyle(color: Colors.white)
          ),
        ),
        actions: <Widget>[
          isSearch ?
          IconButton(
              icon: Icon(Icons.cancel,color: Colors.white,),
              onPressed: (){
                setState(() {
                  this.isSearch = false;
                });
              }
          )
              :
          IconButton(
              icon: Icon(Icons.search,color: Colors.white,),
              onPressed: (){
                setState(() {
                  this.isSearch = true;
                });
              }
          )
        ],
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
                                color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)
                                  ),
                                  onPressed: (){
                                    trolleyDataService.updateItemStatus(item.itemId, 'used');
                                  }, child: Text('Use',style: TextStyle(color: Colors.white),)
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
    /*
    final items = Provider.of<List<Trolley>>(context) ?? [];


    if(items.isEmpty){
      return Scaffold(
        appBar: AppBar(
          title: Text('Emergency Trolley'),
        ),
        body: Center(
          child: Text(
            "Emergency trolley is empty",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[400]),
          ),
        ),
      );
    }else{

      return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: !isSearch ? Text('Emergency Trolley')
              : TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: 'Search item here',
                icon: Icon(Icons.search,color: Colors.white,),
              hintStyle: TextStyle(color: Colors.white)
            ),
          ),
          actions: <Widget>[
            isSearch ?
            IconButton(
                icon: Icon(Icons.cancel,color: Colors.white,),
                onPressed: (){
                  setState(() {
                    this.isSearch = false;
                  });
                }
            )
                :
            IconButton(
                icon: Icon(Icons.search,color: Colors.white,),
                onPressed: (){
                  setState(() {
                    this.isSearch = true;
                  });
                }
            )
          ],
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          items[index].item,
                          style: TextStyle(
                              color: Colors.black, fontSize: 18.0, letterSpacing: 2.0),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  );
                }
            ),
          ),
        ),
      );

    }

    */

  }
}
