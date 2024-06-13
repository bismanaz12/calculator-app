
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
class Button extends StatefulWidget {
  Button({super.key});
  
  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button>{
String  input ='' ;
String expression = '';
  String  output = "";
  OnButtonClick(String buttontext){
    setState(() {
    if(buttontext == "AC"){
      input = "0";
      output = "0";
    }
    else if(buttontext == "D" ){
     input = input.substring(0,input.length -1);

    }
    else if(buttontext == "="){
      expression = input;
      expression = expression.replaceAll('x','*');

      try{
      Parser Par = Parser();
      Expression ex = Par.parse(expression);
      ContextModel cm = ContextModel();
      output = '${ex.evaluate(EvaluationType.REAL,cm)}';


      }
      catch(e){
        output = "Error";
      }

    }

    else {
      input = input + buttontext;

    }
    });
  }
  @override
  Widget buildButton(String txt,Color co1,Color co2) {
    return  TextButton(
      style: TextButton.styleFrom(
          fixedSize: Size(90,95),
          backgroundColor: co1,
          shape:CircleBorder(
              side: BorderSide.none
          )
      ),
      onPressed: (){
    OnButtonClick(txt);
      },
      child: Text(txt,style: TextStyle(
        color: co2,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),),
    );
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Color(0xff464141),
      body: SafeArea(

          child: Column(
            children: [

              SizedBox(height: 65,),

              Container(
                decoration:BoxDecoration(

                    color:Color(0xff464141),
                ),
                  child: Text(input,style: TextStyle(

                    color:Colors.white,fontSize: 30,),
                  textAlign: TextAlign.end,
                  ),
                  height: 80,width:double.infinity),

              Container(child:Text(output,
                  textAlign: TextAlign.end,
                  style: TextStyle(color:Colors.white,fontSize: 30,)),color:Color(0xff464141),height: 80,width:double.infinity),
              SizedBox(height: 50,),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton("AC",Colors.grey,Colors.black),
                        buildButton('D',Colors.grey,Colors.black),
                        buildButton('%',Colors.amber,Colors.black),
                        buildButton('/',Colors.amber,Colors.white),


                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('7',Colors.black,Colors.white),
                        buildButton('8',Colors.black,Colors.white),
                        buildButton('9',Colors.black,Colors.white),
                        buildButton('x',Colors.amber,Colors.white),


                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('4',Colors.black,Colors.white),
                        buildButton('5',Colors.black,Colors.white),
                        buildButton('6',Colors.black,Colors.white),
                        buildButton('-',Colors.amber,Colors.white),


                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton('1',Colors.black,Colors.white),
                        buildButton('2',Colors.black,Colors.white),
                        buildButton('3',Colors.black,Colors.white),
                        buildButton('+',Colors.amber,Colors.white),


                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ElevatedButton(

                          onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(180,90),
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                )
                              )
                            ),
                            child: buildButton('0',Colors.black,Colors.white)),
                        buildButton('.',Colors.black,Colors.white),
                        buildButton('=',Colors.amber,Colors.white),


                      ],
                    ),

                  ],
                ),
              )

            ],

          )),
    );
  }
}














