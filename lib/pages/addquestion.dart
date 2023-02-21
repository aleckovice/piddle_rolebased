// ignore_for_file: unused_import, prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:piddle_rolebased/pages/addquestion.dart';
import 'package:piddle_rolebased/services/database.dart';
import 'package:random_string/random_string.dart';

class AddQuestion extends StatefulWidget {
  final String quizID;
  const AddQuestion(this.quizID);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  late String question, option1, option2, option3, option4;
  bool _isLoading = false;

  DatabaseService databaseService = new DatabaseService();

  uploadQuestionData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };

      print("${widget.quizID}");
      await databaseService
          .addQuestionData(questionMap, widget.quizID)
          .then((value) {
        question = "";
        option1 = "";
        option2 = "";
        option3 = "";
        option4 = "";
        setState(() {
          _isLoading = false;
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print("error is happening ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text("Teacher"),
        titleTextStyle: TextStyle(
            fontFamily: 'OpenSans', color: Colors.white, fontSize: 20),
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) => val!.isEmpty ? "Enter Question" : null,
                      decoration: InputDecoration(
                          hintText: "Question",
                          hintStyle: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold)),
                      onChanged: (val) {
                        question = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Option One" : null,
                      decoration: InputDecoration(
                          hintText: "Option One (Correct Answer)",
                          hintStyle: TextStyle(fontFamily: 'OpenSans')),
                      onChanged: (val) {
                        option1 = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Option Two" : null,
                      decoration: InputDecoration(
                          hintText: "Option Two",
                          hintStyle: TextStyle(fontFamily: 'OpenSans')),
                      onChanged: (val) {
                        option2 = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Option Three" : null,
                      decoration: InputDecoration(
                          hintText: "Option Three",
                          hintStyle: TextStyle(fontFamily: 'OpenSans')),
                      onChanged: (val) {
                        option3 = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? "Enter Option Four" : null,
                      decoration: InputDecoration(
                          hintText: "Option Four",
                          hintStyle: TextStyle(fontFamily: 'OpenSans')),
                      onChanged: (val) {
                        option4 = val;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        uploadQuestionData();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Add Question",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'OpenSans'),
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          "Finish Quiz",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.deepPurple,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
          ),
    );
  }
}
