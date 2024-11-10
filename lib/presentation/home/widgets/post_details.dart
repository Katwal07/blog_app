import 'package:flutter/material.dart';

import '../../../common/res/size_configs.dart';
import '../../../domain/post/entity/post.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({
    super.key,
    required this.postEntity,
  });

  final PostEntity postEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 5.5 * AppSizeConfigs.widthMultiplier),
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.4,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Material(
                            color: Colors.transparent,
                            child: Container(
                              width: MediaQuery.of(context).size.width *
                                  1,
                              height: MediaQuery.of(context).size.height *
                                  0.4,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: InteractiveViewer(
                                      maxScale: 4.0,
                                      child: Image.network(
                                        postEntity.featuredimage ?? "No Image",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.18 * AppSizeConfigs.imageSizeMultiplier)),
                      image: DecorationImage(
                          image: NetworkImage(
                              postEntity.featuredimage ?? "No Image"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.6,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 2.1 * AppSizeConfigs.heightMultiplier,
                    ),
                    Text(
                      postEntity.title ?? "No title",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: 1.1 * AppSizeConfigs.heightMultiplier,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.remove_red_eye),
                        SizedBox(
                          width: 1.1 * AppSizeConfigs.heightMultiplier,
                        ),
                        Text(
                          "${postEntity.views}views",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.thumb_up,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 1.1 * AppSizeConfigs.heightMultiplier,
                        ),
                        Text(postEntity.like ?? "0"),
                        SizedBox(
                          width: 1.1 * AppSizeConfigs.heightMultiplier,
                        ),
                        const Icon(
                          Icons.thumb_down,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 1.1 * AppSizeConfigs.heightMultiplier,
                        ),
                        Text(postEntity.dislike ?? "0"),
                        SizedBox(
                          height: 2.1 * AppSizeConfigs.heightMultiplier,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.1 * AppSizeConfigs.heightMultiplier,
                    ),
                    Text(
                      postEntity.about ?? "",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 1.1 * AppSizeConfigs.heightMultiplier,
                    ),
                    Text(
                      postEntity.body ?? "",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
