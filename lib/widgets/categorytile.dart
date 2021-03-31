import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bookmycourse/views/category.dart';

class CategoryTile extends StatelessWidget {

  final String imageURL,categoryName;
  CategoryTile({this.imageURL,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=> Category(category: categoryName.toLowerCase(),)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageURL,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black.withOpacity(0.5),
                ),

                child: Text(
                  categoryName,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),)
            ),
          ],
        ),
      ),
    );
  }
}

