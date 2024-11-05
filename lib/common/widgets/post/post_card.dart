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
      radius: 8,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              decoration:  BoxDecoration(
                color: Colors.white,
                 borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: NetworkImage(postEntity.featuredimage ?? "")),
              ),
              child: postEntity.featuredimage == null
                  ? const Center(child: Text('No image available'),)
                  : null,
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                        postEntity.about ?? "No description available",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        ),
                    Row(
                      children: [
                        Text(formattedDate),
                        Text('${postEntity.views ?? 0} views'),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
