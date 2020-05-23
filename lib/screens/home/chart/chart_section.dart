import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myward/models/charts_data.dart';
import 'package:myward/screens/home/chart/chart_view.dart';
import 'package:provider/provider.dart';

class ChartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final chartsDetail = Provider.of<List<Chart>>(context) ?? [];


    if(chartsDetail.isEmpty){

      return Center(
        child: Text(
          chartsDetail.length.toString() +
          "There are no patients in your word",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[400]),
        ),
      );
    }else{

      return ChartTypes();

    }
  }
}






class ChartTypes extends StatelessWidget {

  //general template for chat types
  Widget chartTypeFile(int count,String chartType){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: GridTile(
          child: Container(
            child: Center(child: Text(chartType)),
          ),
          footer: Text(count.toString()),
        ),
      ),
    );
  }


  final Chart chart;
  ChartTypes({this.chart});

  @override
  Widget build(BuildContext context) {

    //filter the chart document according to their type
    final tempChart = Provider.of<List<Chart>>(context).where((chart)=> chart.chartType == 'temp').toList();
    final ioChart = Provider.of<List<Chart>>(context).where((chart)=> chart.chartType == 'io').toList();
    final bpChart = Provider.of<List<Chart>>(context).where((chart)=> chart.chartType == 'bp').toList();
    final pulseChart = Provider.of<List<Chart>>(context).where((chart)=> chart.chartType == 'pulse').toList();
    final sugarChart = Provider.of<List<Chart>>(context).where((chart)=> chart.chartType == 'sugar').toList();
    final headInjuryChart = Provider.of<List<Chart>>(context).where((chart)=> chart.chartType == 'pupile').toList();

    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: <Widget>[
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChartView(tempChart)));
          },
            child: chartTypeFile(tempChart.length,'Tempreture')
        ),
        InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChartView(ioChart)));
            },
            child: chartTypeFile(ioChart.length,'Balancing'),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChartView(bpChart)));
          },
          child: chartTypeFile(bpChart.length,'Blood presure'),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChartView(pulseChart)));
          },
          child: chartTypeFile(pulseChart.length,'Pulse Rate'),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChartView(sugarChart)));
          },
          child: chartTypeFile(sugarChart.length,'Sugar Level'),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChartView(headInjuryChart)));
          },
          child: chartTypeFile(headInjuryChart.length,'Head Injury'),
        ),

      ],
    );
  }
}
