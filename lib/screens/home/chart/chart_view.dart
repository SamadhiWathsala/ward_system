import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class ChartView extends StatelessWidget {
  
   final List temperatureCharts;
  ChartView(this.temperatureCharts);
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text('Tempreture charts'),
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
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: temperatureCharts.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(temperatureCharts[index].bht),
                  subtitle: Text(temperatureCharts[index].patientName),
                );
              }
          ),
        ),
      ),
    );
  }
}
