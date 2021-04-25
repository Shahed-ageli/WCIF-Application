class QustionsModel {
  final String questionTitle;
  final String auther;
  final String questionContent;
  final String date="5-4-2021";
  final int userid;


  QustionsModel({this.questionTitle, this.auther, this.questionContent,this.userid});

  factory QustionsModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return QustionsModel(
      questionTitle: jsonData['QuestionTitle'],
      auther: jsonData['LoginName'] ,
      questionContent: jsonData['QuestionContent'],
      userid: int.parse(jsonData['CreatedBy']),
    );
  }
}