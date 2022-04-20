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

// To play gaame
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
// to reset the game
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
  if((gameState[0]!="empty") &&(gameState[0]==gameState[1])&&(gameState[1])==gameState[2])){
    setstate((){
      this.message = this.gameState[0] +'win';
    });
  }else if((gameState[3]!="empty") &&(gameState[3]==gameState[4])&&(gameState[4])==gameState[5])){
    setstate((){
      this.message = this.gameState[3] +'win';
    });
  }else if((gameState[6]!="empty") &&(gameState[6]==gameState[7])&&(gameState[7])==gameState[8])){
    setstate((){
      this.message = this.gameState[8] +'win';
    });
  }else if((gameState[0]!="empty") &&(gameState[0]==gameState[3])&&(gameState[3])==gameState[6])){
    setstate((){
      this.message = this.gameState[6] +'win';
    });
  }else if((gameState[3]!="empty") &&(gameState[3]==gameState[4])&&(gameState[4])==gameState[5])){
    setstate((){
      this.message = this.gameState[0] +'win';
    });
  }else if((gameState[1]!="empty") &&(gameState[1]==gameState[4])&&(gameState[4])==gameState[7])){
    setstate((){
      this.message = this.gameState[0] +'win';
    });
  }else if((gameState[2]!="empty") &&(gameState[2]==gameState[5])&&(gameState[5])==gameState[8])){
    setstate((){
      this.message = this.gameState[0] +'win';
    });
  }else if((gameState[0]!="empty") &&(gameState[0]==gameState[4])&&(gameState[4])==gameState[8])){
    setstate((){
      this.message = this.gameState[0] +'win';
    });
  }else if((gameState[2]!="empty") &&(gameState[2]==gameState[4])&&(gameState[4])==gameState[6])){
    setstate((){
      this.message = this.gameState[2] +'win';
    });
  }

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
