import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/bg.jpg',
            fit: BoxFit.cover,
          ),
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black87,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SafeArea(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          child: Text(
                            'Movies',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textCapitalization: TextCapitalization.characters,
                          decoration: InputDecoration(
                            hoverColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(20),
                          ),
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: Text(
                  'Upcoming Movies',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.black87,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.black87,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
