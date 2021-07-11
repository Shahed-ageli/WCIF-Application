class CategoryRejectModel {
  final int Id;
  final String CategoryName;
  final String Description;
  final int CreatedBy;
  final DateTime CreatedOn;
  final int Status;
  final String CreaterFirstName;
  final String CreaterLastName;

  CategoryModel({this.Id, this.CategoryName, this.Description, this.CreatedBy, this.CreatedOn, this.Status, this.CreaterFirstName, this.CreaterLastName} );

  factory CategoryModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return CategoryModel(
      Id: jsonData['Id'],
      CategoryName: jsonData['CategoryName'],
      Description: jsonData['Description'],
      CreatedBy:  int.parse(jsonData['CreatedBy']),
      CreatedOn: DateTime.parse(jsonData['CreatedOn']),
      Status: jsonData['Status'],
      CreaterFirstName: jsonData['CreaterFirstName'],
      CreaterLastName: jsonData['CreaterLastName'],
    );
  }
}

