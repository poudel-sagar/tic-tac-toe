import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

var cross = Icon(Icons.cancel, size:80);
var circle = Icon(Icons.circle, size: 80);
var edit = Icon(Icons.edit, size:80);

bool isCross = true;
String message;
List<String> gameState;

@override
  void initState() {
    gameState = List.filled(9, "empty");
    this.message="";
    // TODO: implement initState
    super.initState();
  }

// To play game
playgame(int index){
  if(this.gameState[index]=="empty"){
    setState(() {
          if(this.isCross){
            this.gameState[index]="cross";
          }else{
            this.gameState[index]="circle";
          }
          isCross = !isCross;
        });
  }

}

resetGame(){
  setState(() {
      gameState = List.filled(9, "empty");
      this.message = "";
    });
}

Icon getIcon(String title){
  switch(title){
    case('empty'):
    return edit;
    break;

    case('cross'):
    return cross;
    break;

    case('circle'):
    return circle;
    break;

  }
}

checkWin(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tic Tac Toe"),),
      body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              itemCount: gameState.length,
               itemBuilder: (context,i)=>SizedBox(
                 width: 100,
                 height: 100,
                 child: MaterialButton(onPressed: (){
                   this.playgame(i);

                 },
                 child: getIcon(this.gameState[i])
                 ),
               )),
          ),

          ElevatedButton(onPressed: (){
            resetGame();
          }, 
          child: Text("Reset Game"),
          
          )
       

        ],),
    );
  }
}
