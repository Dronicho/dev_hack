import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_hack2/domain/models/club.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Club club;
  final Object tag;
  final double topPad;

  MySliverAppBar(
      {required this.topPad,
      required this.tag,
      required this.club,
      required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        if (club.backgroundImage != null)
          CachedNetworkImage(
              placeholder: (context, url) => Shimmer.fromColors(
                    child: Container(
                      height: 200,
                    ),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                  ),
              imageUrl: (club.backgroundImage!.url)),
        if (club.backgroundImage == null)
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff8E2DE2), Color(0xFF4A00E0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
        Positioned(
          top: topPad + kToolbarHeight / 2 - 23,
          child: BackButton(
            color: Colors.white,
          ),
        ),
        Padding(
          padding: MediaQuery.of(context).viewPadding,
          child: Center(
            child: Opacity(
              opacity: shrinkOffset / expandedHeight,
              child: Text(
                club.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight - 35 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 2 - 35,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Hero(
              tag: tag,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(club.logo!.url))),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + topPad;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
