import 'package:flutter/material.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return 
         Container(
          padding: EdgeInsets.symmetric(horizontal:17, vertical: 15),
          width: MediaQuery.of(context).size.width,
          height: 180,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 237, 237, 237),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Attendance',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        width: MediaQuery.of(context).size.width / 2.2,
                        // width: 20,
                        // height: 30,
                        height: MediaQuery.of(context).size.height / 7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Total Lectures',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 65, 105, 225),
                              fontSize: 9
                            ),),
                            Text('32',
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width / 3.1,
                        height: MediaQuery.of(context).size.height / 7,
                        // width: 20,
                        // height: 30,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Attended',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 255, 138, 32)
                            ),),
                            Text('24',
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                          ],
                        ),
                      ),
                    ],
              )
            ],
          ),
        );
      // );
  }
}