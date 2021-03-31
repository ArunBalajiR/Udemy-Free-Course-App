import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookmycourse/views/course.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CourseTile extends StatelessWidget {
  final String imageURL,title,courseURL,successRate;
  CourseTile({@required this.imageURL, @required this.title, @required this.courseURL, this.successRate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0),
      child: new Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 8.0,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=> CourseView(courseUrl: courseURL,),


            ),);
          },
          // launch(snapshot.data[index].link),
          child: new Column(children: [
            new Container(
              width:
              MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl :imageURL,
                fit: BoxFit.fill,
              ),
            ),
            new Container(
              child: new Text(
                title.replaceAll("[100% OFF]", ""),
                style: GoogleFonts.quicksand(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              padding: const EdgeInsets.fromLTRB(
                  20.0, 20.0, 20.0, 5.0),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(
                  20.0, 4.0, 20.0, 20.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.whatshot,color: Colors.redAccent,),
                  Text(successRate ?? '100%',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color:Colors.redAccent)),
                  Spacer(),
                  GestureDetector(
                    onTap: ()=> launch(courseURL),

                    child: Icon(Icons.open_in_browser,color:Colors.grey,size:24),
                  ),
                  SizedBox(width:20),
                  GestureDetector(
                    onTap: () {

                      Share.share(
                          'Check out this Udemy Course $courseURL \n\nGet Unlimited Paid Udemy Courses for FREE.\nDownload the app from https://github.com/ArunBalajiR/Udemy-Free-Course-App/',
                          subject:'Get Unlimited Paid Udemy Courses for FREE.\nDownload the app from https://github.com/ArunBalajiR/Udemy-Free-Course-App/');
                    },
                    child: Icon(Icons.share,color:Colors.grey,size:20),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );

  }
}
