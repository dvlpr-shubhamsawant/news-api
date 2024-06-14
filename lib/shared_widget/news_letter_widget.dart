import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:newsapp/consts/color_pallet.dart';
import 'package:newsapp/consts/spacing.dart';
import 'package:newsapp/model/news_data_model.dart';

Widget newsLettersWidget(Articles model, {ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          model.urlToImage == null
              ? SizedBox(
                  height: 80.h,
                  width: 100.w,
                )
              : Image.network(
                  "${model.urlToImage}",
                  height: 80.h,
                  width: 100.w,
                ),
          Spacing.widthBox(10.r),
          Expanded(
            child: Text(
              overflow: TextOverflow.visible,
              "${model.title}",
            ),
          ),
        ],
      ),
    ),
  );
}
