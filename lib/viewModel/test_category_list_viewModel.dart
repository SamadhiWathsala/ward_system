import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/models/test_details.dart';
import 'package:myward/service/patients_profiles.dart';

class CategoryListViewModel extends ChangeNotifier{

  final PatientDetailsService _patientDetailsService = PatientDetailsService();
  List<CategoryViewModel> tests;

  //fetch all test category wise
  Future<void> fetchTestCategory(String testCategory) async{
  final testCategoryData = await _patientDetailsService.getTest(testCategory);
  this.tests = testCategoryData.map((test)=> CategoryViewModel(test:test)).toList();
  notifyListeners();


  }


}

class CategoryViewModel{

  final Test test ;
  CategoryViewModel({this.test});

  String get testStatus{
    return this.test.testStatus;
  }

  String get testDescription{
    return this.test.testDescription;
  }

  String get bht{
    return this.test.bht;
  }

  String get patientId{
    return this.test.patientId;
  }

  String get testCategory{
    return this.test.testCategory;
  }
}