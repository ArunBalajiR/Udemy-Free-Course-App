import 'package:bookmycourse/helper/course.dart';
import 'package:bookmycourse/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:bookmycourse/widgets/coursetile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Category extends StatefulWidget {
  final String category;
  Category({@required this.category});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List<CourseModel> courses = [];
  bool _loading = true;



  getCategoryCourse() async {
    CategoryCourse courseClass = CategoryCourse();
    await courseClass.getCourse(widget.category);
    courses =  courseClass.course;
    setState((){
      _loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryCourse();
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
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share,)),
          )
        ],
        elevation: 0.0,
      ),
      body:   _loading ? Center(
        child: Container(
          child: SpinKitWave(
            color: Colors.redAccent,
            size: 30.0,
          ),
        ),
        ////categories
      ) : SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CourseTile(
                  imageURL: courses[index].image,
                  title: courses[index].heading,
                  courseURL: courses[index].courseLink,
                  successRate: courses[index].successRate,

                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
