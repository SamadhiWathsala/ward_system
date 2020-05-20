import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myward/models/patients_details.dart';
import 'package:myward/models/test_details.dart';

class PatientDetailsService{
  
  final CollectionReference patientCollection = Firestore.instance.collection('Patients');
  final CollectionReference testCollection = Firestore.instance.collection('Test');

  //patients list from snapshot
  List<Patients> _patientsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((DocumentSnapshot doc){
      return Patients(
        bht: doc.data['bht'],
        patientName: doc.data['name'],
        category: doc.data['category'],
        state: doc.data['status'],
        address: doc.data['addres'],
      );
    }
    ).toList();
  }

  //get patients stream
  Stream<List<Patients>> get patients {

    return patientCollection.orderBy('status',descending: true).snapshots().map(_patientsListFromSnapshot);
  }



  Future<List<Test>> getTest(String testCategory) async{
    try{

      QuerySnapshot snapshot = await testCollection.where('testStatus',isEqualTo: 'pending').where('category',isEqualTo: testCategory).getDocuments();

      return snapshot.documents.map((DocumentSnapshot doc){
        return Test(
          testStatus: doc.data['testStatus'],
          testDescription: doc.data['name'],
          testCategory: doc.data['testCategory'],
          patientId: doc.data['patientId'],
          bht: doc.data['bht']
        );
      }).toList();


    }on ArgumentError{
      throw 'Failed to find category data';
    }on NoSuchMethodError{
      throw 'internal error';
    }


  }



  //fetch test list from snapshots
  List<Test>_testListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((DocumentSnapshot doc){

      return Test(
          testCategory: doc.data['category'],
          testDescription: doc.data['bht'],
          testStatus: doc.data['testStatus'],
          bht: doc.data['bht'],
          patientId: doc.data['patientId']
      );
    }).toList();

  }

    //get test stream
    Stream<List<Test>> get test{
      return testCollection.where('testStatus',isEqualTo: 'pending').snapshots().map(_testListFromSnapshot);
    }

}