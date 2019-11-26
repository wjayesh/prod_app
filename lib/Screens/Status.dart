import 'package:flutter/material.dart';

class Status extends StatefulWidget{
  Status(); 

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status>{
  // Widget indicator = 
  // //Image.asset("assets/liberal.jpg") ;
  // Image(
  //   image: AssetImage("assets/liberal.jpg"),
  //   fit: BoxFit.cover,
  //   height: 200,);
  MaterialColor ind = Colors.pink;  
  int n = 1;

  @override
  Widget build(BuildContext context){


    return Scaffold(

    appBar: PreferredSize(
      preferredSize: Size.fromHeight(200),
      child: 
     AppBar(
      backgroundColor: ind,
      title: Text("Status", style: TextStyle(fontSize: 40)),
      //flexibleSpace: indicator,
       
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20.0)
          ) ,
           child :Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.transparent,
                  child: Text(
                    "Strict",
                    style: TextStyle(fontSize: 16,
                    color: Colors.white.withOpacity(n==1? 1 : 0.1)),
                    
                  ),
                  onPressed: (){
                    setState(() {
                     //indicator = Image.asset("assets/strict.jpg") ;
                     ind = Colors.red;
                     n =1;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.transparent,
                  child: Text(
                    "Liberal",
                     style: TextStyle(fontSize: 16,
                     color: Colors.white.withOpacity(n==2? 1 : 0.1)),
                  ),
                  onPressed: (){
                    setState(() {
                     //indicator = Image.asset("assets/liberal.jpg") ;
                     ind = Colors.green;
                     n =2;
                    });
                  },
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.transparent,
                  child: Text(
                    "Business",
                     style: TextStyle(fontSize: 16,
                     color: Colors.white.withOpacity(n==3? 1 : 0.1)),
                  ),
                  onPressed: (){
                    setState(() {
                      n = 3;
                      ind = Colors.blue;
                     //indicator = Image.asset("assets/liberal.jpg") ;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    )
    )
    )
      
    ,
    body: 
    Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        
        
        Flexible(child:ListView(
          children: <Widget>[
            Card(
              ),
            GestureDetector(
              onDoubleTap: () {
               
              }
               ,
              child:ListTile(
                contentPadding: EdgeInsets.all(10.0),
                //title: Image.asset("assets/outdoors2.jpg",width: 200,height: 200,) ,
                subtitle: Text.rich(TextSpan(text:"Go out! Meet a few people today"),
                        style: TextStyle(fontWeight:FontWeight.bold ),),
              )

            ),
            GestureDetector(
              onDoubleTap: (){
                },
              child:ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal:10.0),
              //title: Image.asset("assets/music2.jpg",width: 200,height: 200,) ,
              subtitle: Text.rich(TextSpan(text:"Listen to your favourite tracks"),
                        style: TextStyle(fontWeight:FontWeight.bold ),),
              )
              ),
              
              
              GestureDetector(
              onDoubleTap: (){
              
                },
              child:ListTile(
                contentPadding: EdgeInsets.all(10.0),
                //title: Image.asset("assets/work2.jpg",width: 200,height: 200) ,
                subtitle: Padding(child:Text.rich(TextSpan(text:"Take up some job!"),
                
                        style: TextStyle(fontWeight:FontWeight.bold ),),
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                ),
              )

            ),
            
              ListTile(
                  //title: Image.asset("assets/happy.jpg",width: 200,height: 200,),
                  subtitle: Padding(child:Text.rich(TextSpan(text:"Yay! You did good today"),
                
                        style: TextStyle(fontWeight:FontWeight.bold ),),
                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                ), ) 
              
          ],
        ),
        
      )
      ],
      )
     
    );
      
  }

  

}