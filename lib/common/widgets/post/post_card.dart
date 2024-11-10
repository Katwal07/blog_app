import 'package:blog_app/common/res/size_configs.dart';
import 'package:blog_app/common/widgets/container/rounded_container.dart';
import 'package:blog_app/core/configs/theme/colors.dart';
import 'package:blog_app/domain/post/entity/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Postcard extends StatelessWidget {
  final PostEntity postEntity;
  const Postcard({super.key, required this.postEntity});

  @override
  Widget build(BuildContext context) {
 String formattedDate = postEntity.createdAt != null
        ? DateFormat('dd MMM yyyy').format(postEntity.createdAt!)
        : 'Unknown date';
    return CustomRoundedContainer(
      backgroundColor: AppColor.secondaryColor2,
      borderColor: AppColor.secondaryColor2,
      radius:  1.85 * AppSizeConfigs.widthMultiplier,
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              decoration:  BoxDecoration(
                color: Colors.white,
                 borderRadius: BorderRadius.circular(1.85 * AppSizeConfigs.widthMultiplier),
                image: DecorationImage(image: NetworkImage(postEntity.featuredimage ?? "")),
              ),
              child: postEntity.featuredimage == null
                  ? const Center(child: Text('No image available'),)
                  : null,
            ),
          ),
         // const Spacer(),
          SizedBox(height: 1.6 * AppSizeConfigs.heightMultiplier,),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(left: 1.16 * AppSizeConfigs.widthMultiplier,right: 1.16 * AppSizeConfigs.widthMultiplier,bottom: 0.5 * AppSizeConfigs.heightMultiplier),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        postEntity.title ?? "No title available",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: AppColor.primaryColor),
                        ),
                        SizedBox(height: 0.5 * AppSizeConfigs.heightMultiplier,),
                    Row(
                      children: [
                        FittedBox(child: Text(formattedDate,style: TextStyle(fontSize: 0.96 * AppSizeConfigs.textMultiplier, fontWeight: FontWeight.w600),)),
                        const Spacer(),
                        FittedBox(child: Text('${postEntity.views ?? 0} views',style: TextStyle(fontSize: 0.96 * AppSizeConfigs.textMultiplier, fontWeight: FontWeight.w600),)),
                      ],
                    )
                  ],
                ),
              ),),
        ],
      ),
    );
  }
}
