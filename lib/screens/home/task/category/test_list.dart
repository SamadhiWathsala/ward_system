import 'package:flutter/material.dart';
import 'package:myward/models/test_details.dart';
import 'package:myward/screens/home/task/full_details_ofEachTask.dart';
import 'package:provider/provider.dart';


class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final tests = Provider.of<List<Test>>(context) ?? [];


    if(tests.isEmpty){
      return Center(
        child: Text(
          "There are no test request at this time",
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


  //common view for each category
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
    final xRayTest = Provider.of<List<Test>>(context).where((test)=> test.testCategory == 'X-ray').toList();
    final cultureTest = Provider.of<List<Test>>(context).where((test)=> test.testCategory == 'culture').toList();
    final biopsyTest = Provider.of<List<Test>>(context).where((test)=> test.testCategory == 'biopsy').toList();


      return ListView(
          children: <Widget>[
            bloodTest.length > 0 ?
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> Scaffold(
                        backgroundColor: Colors.blue[900],
                        appBar: AppBar(title: Text('All blood test request'),elevation: 0.0,),
                        body: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60.0),
                                topRight: Radius.circular(60.0)
                            ),
                            // gradient: Gradient(colors: [Colors.blue,Colors.grey])
                          ),

                          child: ListView.builder(
                            itemCount: bloodTest.length,
                              itemBuilder: (context,index){
                                return FullDetails(bloodTest[index].bht, bloodTest[index].testDescription, bloodTest[index].patientName,bloodTest[index].testID);
                              }
                          ),
                        ),
                      )
                  ));
                },
                child: categoryCardItem('blood',bloodTest.length)
              ) : SizedBox(),

            scanTest.length > 0 ?
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> Scaffold(
                        backgroundColor: Colors.blue[900],
                        appBar: AppBar(title: Text('All scan request'),elevation: 0.0,),
                        body: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60.0),
                                topRight: Radius.circular(60.0)
                            ),
                            // gradient: Gradient(colors: [Colors.blue,Colors.grey])
                          ),

                          child: ListView.builder(
                              itemCount: scanTest.length,
                              itemBuilder: (context,index){
                                return FullDetails(scanTest[index].bht,scanTest[index].testDescription,scanTest[index].patientName,scanTest[index].testID);
                              }
                          )
                        ),
                      )
                  ));
                },
                child: categoryCardItem(
                    'Scan',scanTest.length
                ),
            ) : SizedBox(),


            xRayTest.length > 0 ?
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> Scaffold(
                      backgroundColor: Colors.blue[900],
                      appBar: AppBar(title: Text('All X-ray request'),elevation: 0.0,),
                      body: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60.0),
                                topRight: Radius.circular(60.0)
                            ),
                            // gradient: Gradient(colors: [Colors.blue,Colors.grey])
                          ),

                          child: ListView.builder(
                              itemCount: xRayTest.length,
                              itemBuilder: (context,index){
                                return FullDetails(xRayTest[index].bht,xRayTest[index].testDescription,xRayTest[index].patientName,xRayTest[index].testID,);
                              }
                          ),
                      ),
                    )
                ));
              },
              child: categoryCardItem(
                  'X-Ray',xRayTest.length
              ),
            ) : SizedBox(),


            cultureTest.length > 0 ?
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> Scaffold(
                      backgroundColor: Colors.blue[900],
                      appBar: AppBar(title: Text('All culture request'),elevation: 0.0,),
                      body: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60.0),
                              topRight: Radius.circular(60.0)
                          ),
                          // gradient: Gradient(colors: [Colors.blue,Colors.grey])
                        ),

                        child: ListView.builder(
                            itemCount: cultureTest.length,
                            itemBuilder: (context,index){
                              return FullDetails(cultureTest[index].bht,cultureTest[index].testDescription,cultureTest[index].patientName,cultureTest[index].testID);
                            }
                        ),
                      ),
                    )
                ));
              },
              child: categoryCardItem(
                  'Culture',cultureTest.length
              ),
            ) : SizedBox(),

            biopsyTest.length > 0 ?
            InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> Scaffold(
                        backgroundColor: Colors.blue[900],
                        appBar: AppBar(title: Text('All biopsy request'),elevation: 0.0,),
                        body: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60.0),
                                topRight: Radius.circular(60.0)
                            ),
                            // gradient: Gradient(colors: [Colors.blue,Colors.grey])
                          ),

                          child: ListView.builder(
                              itemCount: biopsyTest.length,
                              itemBuilder: (context,index){
                                return FullDetails(biopsyTest[index].bht,biopsyTest[index].testDescription,biopsyTest[index].patientName,biopsyTest[index].testID);
                              }
                          ),
                        ),
                      )
                  ));
                },
                child: categoryCardItem('Biopsy',biopsyTest.length)
            ) : SizedBox()
            ,
          ],
      );

  }
}







