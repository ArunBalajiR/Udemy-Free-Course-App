import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CourseView extends StatefulWidget {
  final String courseUrl;
  CourseView({@required this.courseUrl});

  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();


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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.courseUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: ((WebViewController webviewController) {
            _controller.complete(webviewController);
          }),
        ),
      ),
    );
  }
}
