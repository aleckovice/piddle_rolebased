// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, use_key_in_widget_constructors, unnecessary_new

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piddle_rolebased/pages/create_quiz.dart';

import '../services/database.dart';
import 'login.dart';

class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {

  Stream? quizStream;
  final user = FirebaseAuth.instance.currentUser!;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList() {
    return Column(
      children: [
        StreamBuilder(
          stream: quizStream,
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.data == null
                ? Container()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return QuizTile(
                        noOfQuestions: snapshot.data.documents.length,
                        imageUrl:
                            snapshot.data.documents[index].data['quizImgUrl'],
                        title:
                            snapshot.data.documents[index].data['quizTitle'],
                        description:
                            snapshot.data.documents[index].data['quizDescription'],
                        id: snapshot.data.documents[index].data["quizID"],
                      );
                    });
          },
        )
      ],
    );
  }

    @override
    void initState() {
    databaseService.getQuizData().then((val) {
      quizStream = val;
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text("Teacher"),
        titleTextStyle: TextStyle(
            fontFamily: 'OpenSans', color: Colors.white, fontSize: 20),
        actions: [
          IconButton(
            onPressed: () {
              logout(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: quizList(

        
        // padding: EdgeInsets.all(10),
        // child: Column(
        //   children: [
        //     Text(
        //       "Logged in as:   \'${user.email}\'",
        //       style: TextStyle(fontFamily: 'OpenSans'),
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CreateQuiz()));
          },
          child: Icon(Icons.add)),
    );
  }

  Future<void> logout(BuildContext context) async {
    CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imageUrl, title, id, description;
  final int noOfQuestions;

  const QuizTile(
      {required this.title,
      required this.imageUrl,
      required this.description,
      required this.id,
      required this.noOfQuestions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(
      //     builder: (context) => QuizPlay(id)
      //   ));
      // },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}