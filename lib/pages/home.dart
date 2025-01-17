import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<dynamic, dynamic> data ={};

  @override
  Widget build(BuildContext context) {

    data=ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    //set background

    String bgImage= data['isDaytime']? 'day.png':'night.png';
    Color? bgColor= data['isDaytime']? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                  TextButton.icon(onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                    icon: Icon(Icons.edit_location),
                    label: Text('Edit Location',
                      style: TextStyle(
                         color: Colors.green,
                      ),
                    ),

                  ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.deepOrange,
                  ),
                )
              ]
                  ),
          ),
        ),
    ),
    );
  }
}
