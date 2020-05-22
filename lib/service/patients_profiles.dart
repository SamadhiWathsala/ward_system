import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myward/models/patients_details.dart';
import 'package:myward/models/test_details.dart';
import 'package:myward/models/treatment_details.dart';

class PatientDetailsService{
  
  final CollectionReference patientCollection = Firestore.instance.collection('Patients');
  final CollectionReference testCollection = Firestore.instance.collection('Test');
  final CollectionReference treatmentCollection = Firestore.instance.collection('Treatment');

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
  
  


/*
  Future<List<Test>> getTest(String testCategory) async{
    try{

      QuerySnapshot snapshot = await testCollection.where('testStatus',isEqualTo: 'pending').where('category',isEqualTo: testCategory).getDocuments();

      return snapshot.documents.map((DocumentSnapshot doc){
        return Test(
          testStatus: doc.data['testStatus'],
          testDescription: doc.data['name'],
          testCategory: doc.data['testCategory'],
          patientId: doc.data['patientId'],
          bht: doc.data['bht'],
          patientName: doc.data['patientName'],
        );
      }).toList();


    }on ArgumentError{
      throw 'Failed to find category data';
    }on NoSuchMethodError{
      throw 'internal error';
    }


  }
  */


  //After getting the test sample update test status as done
  Future updateTestStatus(String testID,String status) async{
    return await testCollection.document(testID).updateData({
      'testStatus' : status,
    });
  }


  //fetch test list from snapshots
  List<Test>_testListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((DocumentSnapshot doc){

      return Test(
          testID: doc.documentID,
          testCategory: doc.data['category'],
          testDescription: doc.data['name'],
          testStatus: doc.data['testStatus'],
          bht: doc.data['bht'],
          patientId: doc.data['patientId'],
          patientName: doc.data['patientName']
      );
    }).toList();

  }

    //get test stream
    Stream<List<Test>> get test{
      return testCollection.where('testStatus',isEqualTo: 'pending').snapshots().map(_testListFromSnapshot);
    }


    //After complete the treatment update treatment as done
    Future updateTreatmentStatus(String treatmentId,String treatmentStatus)async{
      await testCollection.document(treatmentId).updateData({
        'treatmentStatus' : treatmentStatus,
      });
    }


    
    //fetch treatment list from snapshot
    List<Treatment>_treatmentListFromSnapshot(QuerySnapshot snapshot){
      return snapshot.documents.map((DocumentSnapshot doc){

        return Treatment(
          treatmentId: doc.documentID,
          treatmentStatus: doc.data['treatmentStatus'],
          type: doc.data['type'],
          patientName: doc.data['patientName'],
          description: doc.data['description'],
          bht: doc.data['bht'],
          dosage: doc.data['givenTime'],
        );

      }).toList();
    }
    
    
    //get treatment stream
    Stream<List<Treatment>>get treatment{
    return treatmentCollection.where('treatmentStatus',isEqualTo: 'todo').snapshots().map(_treatmentListFromSnapshot);
    }
}