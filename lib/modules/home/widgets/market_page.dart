import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Наиболее популярные',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2b2d83), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                                imageUrl:
                                    'https://firebasestorage.googleapis.com/v0/b/image-rescale.appspot.com/o/2021-06-06%2009.14.33.jpg?alt=media&token=94f5d7ea-d6bc-4570-b03c-339e9b105341'),
                            Text('Футболка женская, S'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('15500 ПСБаллов',
                                style: TextStyle(
                                    color: Color(0xff2b2d83),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Наиболее популярные',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2b2d83), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                                imageUrl:
                                    'https://firebasestorage.googleapis.com/v0/b/image-rescale.appspot.com/o/2021-06-06%2009.14.33.jpg?alt=media&token=94f5d7ea-d6bc-4570-b03c-339e9b105341'),
                            Text('Футболка женская, S'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('15500 ПСБаллов',
                                style: TextStyle(
                                    color: Color(0xff2b2d83),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Наиболее популярные',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2b2d83), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                                imageUrl:
                                    'https://firebasestorage.googleapis.com/v0/b/image-rescale.appspot.com/o/2021-06-06%2009.14.33.jpg?alt=media&token=94f5d7ea-d6bc-4570-b03c-339e9b105341'),
                            Text('Футболка женская, S'),
                            SizedBox(
                              height: 10,
                            ),
                            Text('15500 ПСБаллов',
                                style: TextStyle(
                                    color: Color(0xff2b2d83),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarketCard extends StatelessWidget {
  const MarketCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
