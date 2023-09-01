import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserAccountState createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 450,
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/profile.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(.3)
                          ]
                        )
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Nattaphat Sangsunt", style: 
                              TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)
                            ,),
                            SizedBox(height: 20,),
                            Row(
                              children: <Widget>[ 
                                Text("1M Following", style: TextStyle(color: Colors.grey, fontSize: 16),),
                                SizedBox(width: 50,),
                                Text("0 Followers", style: 
                                  TextStyle(color: Colors.grey, fontSize: 16)
                                ,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("My name is Nattaphat Sansgunt. I am a junior at King Mongkut University of Technology North Bangkok. Now, I am learning and practicing web design and web development skills. Using my knowledge of information technology, I can do assigned tasks with self-training, research, and studying at the university stimulus.", 
                        style: TextStyle(color: Colors.grey, height: 1.4),),
                        SizedBox(height: 40,),
                        Text("Born", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("March, 4th 2002, Bangkok, Thailand", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 20,),
                        Text("Nationality", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Thai", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 20,),
                        SizedBox(height: 120,)
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
          Positioned.fill(
            bottom: 50,
              child: Align(
                alignment: Alignment.bottomCenter,
                child:
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.yellow[700]
                  ),
                  child: const Align(child: Text("Follow", style: TextStyle(color: Colors.white),)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}