class CategoryModel {
  final int id;
  final String categoryName;


  CategoryModel({this.id,this.categoryName});

  factory CategoryModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return CategoryModel(
      //id: int.parse(jsonData['Id']),
      categoryName: jsonData['CategoryName'],
    );
  }
}