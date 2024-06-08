import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  String pressedValue = "0";
  String calculationText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 200,),
            Padding(
              padding: const EdgeInsets.only(right: 36),
              child: Text(calculationText, style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 36),
              child: Text(pressedValue, style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.grey ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                  calculatorButton(buttonName: "mc"),
                  calculatorButton(buttonName: "c"),
                  calculatorButton(buttonName: "7"),
                  calculatorButton(buttonName: "4"),
                  calculatorButton(buttonName: "1"),
                  calculatorButton(buttonName: "%")
                 ],
                ),
                Column(
                  children: [
                  calculatorButton(buttonName: "m+"),
                  calculatorButton(buttonName: "x"),
                  calculatorButton(buttonName: "8"),
                  calculatorButton(buttonName: "5"),
                  calculatorButton(buttonName: "2"),
                  calculatorButton(buttonName: "0")
                 ],
                ),
                Column(
                  children: [
                  calculatorButton(buttonName: "m-"),
                  calculatorButton(buttonName: "/", isGreeenButton: true),
                  calculatorButton(buttonName: "9"),
                  calculatorButton(buttonName: "6"),
                  calculatorButton(buttonName: "3"),
                  calculatorButton(buttonName: ".")
                 ],
                ),
                Column(
                  children: [
                  calculatorButton(buttonName: "mr"),
                  calculatorButton(buttonName: "*", isGreeenButton: true),
                  calculatorButton(buttonName: "-", isGreeenButton: true),
                  calculatorButton(buttonName: "+", isGreeenButton: true),
                  calculatorButton(buttonName: "=", isGreeenButton: true, isEqualButton: true),
                  
                 ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget calculatorButton({required String buttonName, bool isGreeenButton = false, bool isEqualButton = false}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if(buttonName=="c"){
              
                pressedValue="0";
              
            }
            else if(buttonName !="+" && 
            buttonName !="-" && 
            buttonName !="*" && 
            buttonName !="/" &&
            buttonName != "=" &&
            buttonName != "mc" &&
            buttonName != "m+" &&
            buttonName != "m-" &&
            buttonName != "mr" &&
            buttonName != "x" &&
            buttonName != "%"){
              if(pressedValue[0]=="0"){
                pressedValue = buttonName;
              }else{               
              pressedValue += buttonName;
              }
            }
             if(buttonName =="+" ||
            buttonName =="-" ||
            buttonName =="/" ||
            buttonName =="*" ||
            buttonName =="%"

            ){
              calculationText += pressedValue + buttonName;
            }
            
        });
          
        },
        child: Container(
                      width: 60,
                      height: isEqualButton ? 132 : 60,
                      decoration:  BoxDecoration(
                        color: isGreeenButton?Colors.green : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Center(
                        child:  Text(buttonName,
                         style: TextStyle(fontWeight: FontWeight.bold),
                         ),
                         ),
                    ),
      ),
    );
  }
}