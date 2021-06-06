import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_hack2/domain/models/club.dart';
import 'package:dev_hack2/domain/models/event.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class EventCard extends StatelessWidget {
  EventCard(
      {Key? key,
      required this.onPressed,
      required this.event,
      this.club,
      this.running = false,
      this.showClub = true,
      required this.tag})
      : super(key: key);
  final Club? club;
  final bool showClub;
  final VoidCallback onPressed;
  final Event event;
  final Object tag;
  final bool running;
  final _format = DateFormat('MMM');

  @override
  Widget build(BuildContext context) {
    print(tag);
    return Hero(
      tag: tag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Material(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: InkWell(
            onTap: onPressed,
            child: Stack(
              children: [
                _buildBackground(context),
                if (event.attachment!.url.contains('https'))
                  Positioned.fill(
                      child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(1)
                      ],
                      stops: [0.2, 0.3, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                  )),
                if (running)
                  Positioned(
                      left: 16,
                      top: 16,
                      child: Chip(
                        backgroundColor: Colors.green,
                        label: Text('началось',
                            style: TextStyle(color: Colors.white)),
                      )),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12),
                      child: Column(
                        children: [
                          Text(
                            event.date.day.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            _format.format(event.date),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (showClub)
                        CircleAvatar(
                          child: Shimmer.fromColors(
                            enabled: true,
                            child: Container(height: 100, width: 100),
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                          ),
                          backgroundImage: NetworkImage(club!.logo?.url ?? ''),
                        ),
                      if (showClub)
                        SizedBox(
                          height: 5,
                        ),
                      if (showClub)
                        Text(
                          club!.name,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                      Text(
                        event.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        event.count != null
                            ? _buildCount(event.count!)
                            : 'Неизвество',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _buildCount(int count) {
    if (count > 10 && count < 19) {
      return '${count} участников';
    } else {
      final mod = count % 10;
      if (mod == 1) return '${count} участник';
      if (mod < 5 && mod > 1) return '${count} участника';
      return '${count} участников';
    }
  }

  Widget _buildBackground(BuildContext context) {
    late var res;
    if (event.attachment!.url.contains('https')) {
      res = CachedNetworkImage(
        imageUrl: event.attachment!.url,
        placeholder: (context, url) => Shimmer.fromColors(
          enabled: true,
          child: Container(
            height: 200,
          ),
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
        ),
      );
    } else {
      res = Container(
        height: 200,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff8E2DE2), Color(0xFF4A00E0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      );
    }
    return res;
  }
}
