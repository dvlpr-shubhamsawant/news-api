import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/consts/app_info.dart';
import 'package:newsapp/consts/app_lists.dart';
import 'package:newsapp/consts/color_pallet.dart';
import 'package:newsapp/consts/spacing.dart';
import 'package:newsapp/consts/typography.dart';
import 'package:newsapp/controller/home_controller.dart';
import 'package:newsapp/shared_widget/news_letter_widget.dart';
import 'package:newsapp/views/news_detail_screen/news_detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppInfo.appName),
      ),
      body: Container(
        padding: Spacing.screenPadding,
        child: Consumer<HomeController>(builder: (context, controller, _) {
          return Column(
            children: [
              Spacing.heightBox(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    AppLists.categoryList.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          controller.updateSelectedCategory =
                              AppLists.categoryList[index];
                          controller.fetchNews();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                              color: controller.selectedCategory ==
                                      AppLists.categoryList[index]
                                  ? AppColors.greenColor
                                  : null,
                              border: Border.all(
                                color: controller.selectedCategory ==
                                        AppLists.categoryList[index]
                                    ? AppColors.greenColor
                                    : AppColors.greyColor,
                              ),
                              borderRadius: BorderRadius.circular(12.r)),
                          margin: EdgeInsets.only(right: 14.w),
                          child: Text(
                            "${AppLists.categoryList[index]}",
                            style: TextStyle(
                              color: controller.selectedCategory ==
                                      AppLists.categoryList[index]
                                  ? AppColors.whiteColor
                                  : null,
                              fontFamily: Typo.semiBold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Spacing.heightBox(18.r),
              controller.isLoading == true
                  ? Center(child: CircularProgressIndicator())
                  : controller.newsDataModel != null
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => newsLettersWidget(
                                controller.newsDataModel!.articles![index],
                                ontap: () {
                              context.goNamed(NewsDetailScreen.id,
                                  extra: controller
                                      .newsDataModel!.articles![index]);
                            }),
                            itemCount:
                                controller.newsDataModel!.articles!.length,
                          ),
                        )
                      : Text("No Data Found"),
            ],
          );
        }),
      ),
    );
  }
}
