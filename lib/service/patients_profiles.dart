import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myward/models/patients_details.dart';

class PatientDetailsService{
  
  final CollectionReference patientCollection = Firestore.instance.collection('Patients');

  //patients list from snapshot
  List<Patients> _patientsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((DocumentSnapshot doc){
      return Patients(
        bht: doc.data['bht'],
        patientName: doc.data['name'],
        category: doc.data['category'],
        //state: doc.data['status'] ?? 100,
        address: doc.data['addres'],
      );
    }
    ).toList();
  }

  //get patients stream
  Stream<List<Patients>> get patients {
    return patientCollection.snapshots().map(_patientsListFromSnapshot);
  }
  
}