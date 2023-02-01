import 'package:flutter/material.dart';

class BMICacluator extends StatefulWidget {
  const BMICacluator({Key? key}) : super(key: key);

  @override
  State<BMICacluator> createState() => _BMICacluatorState();
}

class _BMICacluatorState extends State<BMICacluator> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.blue.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Center(
        child: Container(
          width: 300,
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "BMI Calculator",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Row(
                    children: [
                      Text("Enter ur Weight",style: TextStyle(fontSize: 20),),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red,fontSize: 30),
                      )
                    ],
                  ),
                  prefixIcon: Icon(Icons.line_weight_rounded),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Row(
                    children: [
                      Text("Enter ur Height(in Feet)",style: TextStyle(fontSize: 20),),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red,fontSize: 30),
                      )
                    ],
                  ),
                  prefixIcon: Icon(Icons.height_rounded),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                  label: Row(
                    children: [
                      Text("Enter ur Height(in Inch)",style: TextStyle(fontSize: 20),),
                      Text(
                        "*",
                        style: TextStyle(color: Colors.red,fontSize: 30),
                      )
                    ],
                  ),
                  prefixIcon: Icon(Icons.height_rounded),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {

                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt*12)+iInch;
                      var tCm = tInch*2.54;
                      var tM = tCm/100;
                      var bmi = iWt/(tM*tM);
                      var msg = "";

                      if(bmi>25){
                        msg = " You're Over Weighted!!";
                        bgColor = Colors.red.shade100;
                      }
                      else if(bmi<18){
                        msg = " You're Under Weighted!!";
                        bgColor = Colors.yellow.shade200;
                      }
                      else{
                        msg = " You're Healthy!!";
                        bgColor = Colors.green.shade200;
                      }

                    setState(() {
                      result = '$msg \n Your BMI is : ${bmi.toStringAsFixed(4)}';
                    });

                    } else {
                      setState(() {
                        result = "Kindly Enter Mendatory (*) Fileds";
                      });
                    }
                  },
                  child: Text("Calculate")),

              SizedBox(height: 20,),
              Text(
                result,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
      ),
    );
  }
}
