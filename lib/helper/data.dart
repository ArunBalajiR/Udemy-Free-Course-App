import 'package:bookmycourse/model/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel;

  //1
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Development";
  categoryModel.imageURL = "https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/development.jpg";
  category.add(categoryModel);

  //2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "IT-Software";
  categoryModel.imageURL = "https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/itsoftware.jpg";
  category.add(categoryModel);

  //3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageURL = "https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/business.jpg";
  category.add(categoryModel);

  //4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Office-Productivity";
  categoryModel.imageURL = "https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/officeproductivity.jpg";
  category.add(categoryModel);

  //5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Personal-Development";
  categoryModel.imageURL = "https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/personaldevelopment.jpg";
  category.add(categoryModel);

  //6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = " Design";
  categoryModel.imageURL = "https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/design.jpg";
  category.add(categoryModel);

  //7
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Marketing";
  categoryModel.imageURL = "https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/marketing.jpg";
  category.add(categoryModel);

  //8
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Language";
  categoryModel.imageURL = "https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/language.jpg";
  category.add(categoryModel);

  //9
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "Test-Prep";
  categoryModel.imageURL = "https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/testprep.jpg";
  category.add(categoryModel);

  return category;

}