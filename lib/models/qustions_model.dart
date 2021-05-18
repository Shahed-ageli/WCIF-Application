import 'package:wcif_application/services/api/data_services.dart';

class QustionsModel {
  final String QustionId;
  final int CategoryId;
  final String QuestionTitle;
  final String QuestionContent;
  final String QuestionImage;
  final int AcceptedAnswerId;
  final int AnswerCount;
  final int ViewCount;
  final int UpVotes;
  final int DownVotes;
  // RejectionReason;
  final int CreatedBy;
  final DateTime CreatedOn;
  final int Status;
  final DateTime DecisionDate;
  final String LoginName;
  final String Phone;
  final String FirstName;
  final String LastName;
  final String Email;
  final String CategoryName;

  QustionsModel({this.QustionId, this.CategoryId, this.QuestionTitle, this.QuestionContent, this.QuestionImage, this.AcceptedAnswerId, this.AnswerCount, this.ViewCount, this.UpVotes, this.DownVotes, this.CreatedBy, this.CreatedOn, this.Status, this.DecisionDate, this.LoginName, this.Phone, this.FirstName, this.LastName, this.Email, this.CategoryName});

  factory QustionsModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return QustionsModel(
      QustionId: jsonData['Id'],
      CategoryId: jsonData['CategoryId'],
      QuestionTitle: jsonData['QuestionTitle'],
      QuestionContent:jsonData['QuestionContent'],
      QuestionImage: jsonData['QuestionImage'],
      AcceptedAnswerId: jsonData['AcceptedAnswerId'],
      AnswerCount: jsonData['AnswerCount'],
      ViewCount: jsonData['ViewCount'],
      UpVotes: jsonData['UpVotes'],
      DownVotes: jsonData['DownVotes'],
      // RejectionReason: jsonData[''],
      CreatedBy:  int.parse(jsonData['CreatedBy']),
      CreatedOn: DateTime.parse(jsonData['CreatedOn']),
      Status: jsonData['Status'],
      DecisionDate: DateTime.parse(jsonData['DecisionDate']),
      LoginName: jsonData['LoginName'],
      Phone: jsonData['Phone'],
      FirstName: jsonData['FirstName'],
      LastName: jsonData['LastName'],
      Email: jsonData['Email'],
      CategoryName: jsonData['CategoryName'],
    );
  }
}
// class QustionsModel {
//   final String questionTitle;
//   final String auther;
//   final String questionContent;
//   final DateTime date;
//   final int userid;
//
//   QustionsModel({this.questionTitle, this.auther, this.questionContent,this.userid, this.date});
//   factory QustionsModel.fromJson(Map<dynamic, dynamic> jsonData) {
//     return QustionsModel(
//       questionTitle: jsonData['QuestionTitle'],
//       auther: jsonData['LoginName'] ,
//       questionContent: jsonData['QuestionContent'],
//       userid: int.parse(jsonData['CreatedBy']),
//       date: DateTime.parse(jsonData['CreatedOn']),
//     );
//   }
// }