import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myward/models/trolley_item.dart';


class TrolleyDataService{
  
  final CollectionReference trolleyCollection = Firestore.instance.collection('Emergence_trolly');
  
  /*
  //fetch item from snapshot
  List<Trolley> _itemListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((DocumentSnapshot doc){
      return Trolley(
        item: doc.data['itemName'],
        itemStatus: doc.data['itemStatus'],
        //expireDate: doc.data['expDate'],
        quantity: doc.data['quantity']
      );
    }).toList();
  }
  
  //get trolley item stream
  Stream<List<Trolley>> get items{
    return trolleyCollection.snapshots().map(_itemListFromSnapshot);
  }

  */


  //update the test status after it use
  Future updateItemStatus(String itemID,String itemStatus) async{
    return await trolleyCollection.document(itemID).updateData({
      'itemStatus' : itemStatus
    });
  }
  
  
  //fetch item list according to their status
  Future <List<Trolley>> getTrolleyItemList(String itemStatus)async{
    QuerySnapshot snapshot = await trolleyCollection.where('itemStatus',isEqualTo: itemStatus).getDocuments();
    return snapshot.documents.map((DocumentSnapshot doc){
      return Trolley(
          itemId: doc.documentID,
          item: doc.data['itemName'],
          itemStatus: doc.data['itemStatus'],
          //expireDate: doc.data['expDate'],
          quantity: doc.data['quantity']
      );
    }).toList();
  }




}