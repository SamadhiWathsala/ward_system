import 'package:flutter/material.dart';
import 'package:myward/models/test_details.dart';
import 'package:myward/screens/home/task/tests/test_category_details.dart';
import 'package:myward/service/patients_profiles.dart';
import 'package:provider/provider.dart';


class TaskList extends StatelessWidget {


//create general template for each and every test category
  Widget categoryCardItem(String categoryName){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(
            categoryName,
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

  @override
  Widget build(BuildContext context) {

    final tests = Provider.of<List<Test>>(context) ?? [];


    if(tests.isEmpty){
      return Center(
        child: Text(
          "There are no test at this time",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400]),
        ),
      );
    }
    else{
      return TestCategories();
    }
  }
}



class TestCategories extends StatelessWidget {



  final Test test;
  TestCategories({this.test});

  Widget categoryCardItem(String categoryName, int count){

    String stringCount = count.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          title: Text(
            categoryName,
            style: TextStyle(
                color: Colors.black, fontSize: 18.0, letterSpacing: 2.0),
          ),
          trailing: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(stringCount),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    //filter test according their category and get each category list
    final bloodTest = Provider.of<List<Test>>(context).where((test)=> test.testCategory == 'blood').toList();
    final scanTest = Provider.of<List<Test>>(context).where((test)=> test.testCategory == 'scan').toList();
    final xRayTest = Provider.of<List<Test>>(context).where((test)=> test.testCategory == 'scan').toList();
    final cultureTest = Provider.of<List<Test>>(context).where((test)=> test.testCategory == 'culture').toList();


      return ListView(

          children: <Widget>[
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CategorizedTest()));
              },
              child: categoryCardItem(
                  'Blood',bloodTest.length
              ),
            ),
            categoryCardItem(
                'Scan',scanTest.length
            ),
            categoryCardItem(
                'X-Ray',xRayTest.length
            ),
            categoryCardItem(
                'Culture',cultureTest.length
            )
          ],
      );

  }
}







