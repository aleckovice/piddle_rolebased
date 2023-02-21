import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addQuizData(Map<String, dynamic> quizData, String quizID) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizID)
        .set(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuestionData(questionData, String quizID) async {
    await FirebaseFirestore.instance
        .collection("Quiz")
        .doc(quizID)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizData() async {
    return await FirebaseFirestore.instance.collection("Quiz").snapshots();
  }
}
