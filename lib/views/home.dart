import 'package:bookmycourse/helper/course.dart';
import 'package:bookmycourse/helper/data.dart';
import 'package:bookmycourse/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:bookmycourse/model/category_model.dart';
import 'package:bookmycourse/widgets/coursetile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bookmycourse/widgets/categorytile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<CourseModel> courses = [];

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getCourse();
  }

  getCourse() async {
    Course courseClass = Course();
    await courseClass.getCourse();
    courses =  courseClass.course;
    setState((){
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Book",style: TextStyle(fontWeight: FontWeight.bold)),
            CachedNetworkImage(imageUrl: 'https://raw.githubusercontent.com/ArunBalajiR/Udemy-Free-Course-App/main/Images/my.png',height: 40,),
            Text("Course",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),),
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading ? Center(
      child: Container(
        child: SpinKitWave(
          color: Colors.redAccent,
          size: 30.0,
        ),
      ),
      ////categories
        ) : SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child:Column(
          children: <Widget>[
            Container(
              height: 70,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    imageURL: categories[index].imageURL,
                    categoryName: categories[index].categoryName,
                  );
                },
              ),
            ),

            ///Courses
            Container(

              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CourseTile(
                    imageURL: courses[index].image,
                    title: courses[index].heading,
                    courseURL: courses[index].courseLink,
                    // successRate: courses[index].successRate,
                  );
                },
              ),
            ),

          ],
        ),
      ),
        ),
    );
  }
}


