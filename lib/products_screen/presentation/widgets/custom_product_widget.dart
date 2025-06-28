
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/color_manager.dart';
import '../../data/model/ProductModel.dart';


class CustomProductWidget extends StatelessWidget {
  final double width;
  final double height;
  final ProductModel product;

  const CustomProductWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.product});

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: height * 0.3,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primary.withOpacity(0.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                // Not working with the lastest flutter version

                CachedNetworkImage(
                  imageUrl: product.image ?? "",
                  height: height * 0.15,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                ),
                Positioned(
                    top: height * 0.01,
                    right: width * 0.02,
                    child: Material(
                      // borderRadius: BorderRadius.circular(2),
                      color: ColorManager.white,
                      elevation: 5,
                      shape: const StadiumBorder(),
                      shadowColor: ColorManager.black,
                      child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: ImageIcon(

                            AssetImage("assets/images/heart.png"),
                            color: ColorManager.primary,
                          )),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateTitle(product.title ?? ""),
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: height * 0.002),
                  Text(
                    truncateDescription(product.description ?? ""),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          "EGP ${product.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: ColorManager.textColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: height * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        // width: width * 0.22,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Review (${product.rating})",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: ColorManager.textColor,
                                fontSize: 14.sp,
                              ),
                            ),
                            const Icon(
                              Icons.star_rate_rounded,
                              color: ColorManager.starRateColor,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          height: height * 0.036,
                          width: width * 0.08,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorManager.primary,
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
