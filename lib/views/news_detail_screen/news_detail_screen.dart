import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/consts/spacing.dart';
import 'package:newsapp/consts/typography.dart';
import 'package:newsapp/model/news_data_model.dart';

class NewsDetailScreen extends StatelessWidget {
  NewsDetailScreen({super.key, required this.model});
  static String id = "NewsDetailScreen";

  Articles model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: Spacing.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.heightBox(20.h),
            Image.network(
              "${model.urlToImage}",
              // height: 80.h,
              width: double.infinity,
            ),
            Spacing.heightBox(20.h),
            Text("Date : ${model.publishedAt}"),
            Spacing.heightBox(5.h),
            Text("Author : ${model.author}"),
            Spacing.heightBox(25.h),
            Text(
              "${model.title}",
              style: TextStyle(fontSize: 18.sp, fontFamily: Typo.semiBold),
            ),
            Spacing.heightBox(12.h),
            Text(
              "${model.description}",
              style: TextStyle(fontFamily: Typo.medium, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
