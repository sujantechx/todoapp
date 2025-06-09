import 'package:flutter/material.dart';

class Complete extends StatelessWidget {
  const Complete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 150,
          child: ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Exercise",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),

                        Text("Carry out a yoga session",style: TextStyle(
                          fontSize: 12,
                        ),),
                        SizedBox(height: 10,),

                        Text("Date time",style: TextStyle(
                          fontSize: 12,
                        ),),


                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.edit),

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Text("Mark as complete  ",style: TextStyle(
                              fontSize: 12,
                            ),),
                            Icon(Icons.check_box_outline_blank)
                          ],
                        ),


                      ],
                    )

                  ],
                ),
              ),
            );

          },),
        ),
      ),
    );
  }
}
