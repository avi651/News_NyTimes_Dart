import 'package:flutter/material.dart';
import 'package:ny_news/core/components/image_with_shimmer.dart';
import 'package:ny_news/core/resources/app_colors.dart';
import 'package:ny_news/core/resources/app_values.dart';

import '../../data/models/article_model.dart';

class VerticalListViewCard extends StatelessWidget {
  final ArticleModel articleModel;

  const VerticalListViewCard({
    super.key,
    required this.articleModel,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(AppSize.s8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s8),
              child: articleModel.media!.isNotEmpty
                  ? ImageWithShimmer(
                      imageUrl:
                          articleModel.media?.first.mediaMetadata?[2].url ?? "",
                      width: AppSize.s110,
                      height: AppSize.s110,
                    )
                  : const Text(
                      "No Image Found",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: AppPadding.p6,
                    top: AppPadding.p14,
                  ),
                  child: Text(
                    articleModel.title ?? "",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: AppPadding.p14, bottom: AppPadding.p6),
                  child: Text(
                    articleModel.adxKeywords ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
