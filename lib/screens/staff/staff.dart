import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/models/slider_data.dart';
import 'package:myward/models/slider_data.dart';
import 'package:myward/screens/staff/table/table_data.dart';


class Staff extends StatefulWidget {
  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<Staff> {

  List<SliderModel> slides = new List<SliderModel>();
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);


  Widget pageIndexIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      width: isCurrentPage ? 10.6 : 6.0,
      height: isCurrentPage ? 10.6 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12)
      ),
    );
  }



  @override
  void initState(){
    //TODO implement init state
    super.initState();
    slides = getSlides();
  }

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          title: Text('Duty Roster'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.email ,color: Colors.white,), onPressed: null),
          ],
        ),
        
        body: PageView.builder(
          controller: pageController,
          itemCount: slides.length,
            onPageChanged: (val){
              setState(() {
                currentIndex = val;
              });
            },
            itemBuilder: (context,index){
              return SliderTile(
                imageAssetPath: slides[index].getImageAssetPath(),
              );
            }
        ),
        
        bottomSheet: currentIndex != slides.length - 1 ? Container(
          height: Platform.isIOS ? 70 : 60,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: (){
                  pageController.animateToPage(currentIndex-1, duration: Duration(milliseconds: 400), curve: Curves.easeInOutQuart);
                },
                  child: Text('Back')
              ),
              
              Row(
                children: <Widget>[
                  for(int i=0; i < slides.length; i++) currentIndex == i ? pageIndexIndicator(true) : pageIndexIndicator(false)
                ],
              ),

              InkWell(
                  onTap: (){
                    pageController.animateToPage(currentIndex + 1, duration: Duration(milliseconds: 400), curve: Curves.easeInOutQuart);
                  },
                  child: Text('Next')
              ),
            ],
          ),
        ) : Container(
          alignment: Alignment.center,
          color: Colors.blueAccent,
          width: MediaQuery.of(context).size.width,
          height: Platform.isIOS ? 70 : 60,
          child: Text('REQUEST'),
        ),

      ),
    );
  }


}



class SliderTile extends StatelessWidget {

  String imageAssetPath;
  SliderTile({this.imageAssetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(imageAssetPath)
    );
  }
}

