import 'package:flutter/material.dart';

class spalsh_screen extends StatefulWidget
{
  @override 
  State<spalsh_screen> createState() => _splash_screen_state();
}

class _splash_screen_state extends State<spalsh_screen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: ListView(
        children: [ 
          Container(
          width: double.infinity,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Column(
                children: [ 
                  SizedBox(
                    height: 50
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xff5E5E63).withValues(alpha: 0.9)
                        ),
                      )
                      ,
                      Text("  ATELIER EDITION  " , style: TextStyle(
                        color: Color(0xff5E5E63).withValues(alpha: 0.9),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),) ,
        
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xff5E5E63).withValues(alpha: 0.9), 
                        ),
                      )
                    ],
                  ),
                  
                  SizedBox(height: 8,) ,
        
                  Text("L O O M A" , style: TextStyle(
                    fontSize: 34, 
                    fontWeight: FontWeight.bold,
                    color: Color(0xff000000),
                  ),) ,
        
                  SizedBox(
                    height: 8,
                  ) ,
        
                  Text("Your Style. Your Way." , style: TextStyle(
                    color: Color(0xff5E5E63).withValues(alpha: 0.9),
                    fontWeight: FontWeight.w400,
                    fontSize: 14
                  ),)
                ],
              ),
        
              SizedBox(height: 93.43),
        
              Container(
                padding: EdgeInsets.symmetric(horizontal: 54), 
        
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Stack(
                    children:[ Image.asset("assets/images/man.jpg" , height: 371.33,
                      width: 278, fit: BoxFit.cover,
                    ),
                    
                      Positioned(
                        bottom: 16,
                        right: 16,
                        left: 16,
                        child: 
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          height: 30,
                          width: 246,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            borderRadius: BorderRadius.circular(12) ,
                            boxShadow: [ BoxShadow(
                              blurRadius: 12 ,
                              spreadRadius: 0,
                              color: Color.fromRGBO(255, 255, 255, 0.1),
                              blurStyle: BlurStyle.inner
                            )]
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("FALL CAPSULE 01" , style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10 ,
                                color: Color.fromRGBO(255, 255, 255, 1)
                              ),) ,

                              Text("PARIS / MILAN" , style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10 ,
                                color: Color.fromRGBO(255, 255, 255, 1)
                              ),) 
                            ],)
                        )
                      )

                    ] ,
                  )
                  ),
              ) ,
        
              SizedBox(height: 93.43),
        
              Container(
                width: 356,
                height: 52,
                
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    
                    onPressed: () => {}, 
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Get Started " , style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),),
                        Icon(Icons.arrow_forward)
                      ],
                    ) 
                    )
                ),
              )  ,

              SizedBox(height: 20),

              Container(
                height: 2 ,
                width: 96 ,
                color: Colors.black,
              ) ,

              SizedBox(height: 24),    

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("v2.4 " , style: TextStyle(
                    color: Color(0xff747878).withValues(alpha: 0.9),
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                  ),) ,

                   Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(0xff747878).withValues(alpha: 0.9)
                        ),
                      ) ,

                  
                  Text(" Spring / Summer Collection " , style: TextStyle(
                    color: Color(0xff747878).withValues(alpha: 0.9),
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                  ),) 
                ],)       
            ],
          ),
        ),]
      ),
    );
  }
}