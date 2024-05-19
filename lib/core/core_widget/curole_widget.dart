/*

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CarouslImages extends StatefulWidget {
  final List<String> imagesList;
  final Color circlecolor;
  const CarouslImages({
    super.key,
    required this.imagesList,
    this.circlecolor = const Color.fromRGBO(0, 0, 0, 0.9),
  });

  @override
  State<CarouslImages> createState() => _CarouslImagesState();
}

class _CarouslImagesState extends State<CarouslImages> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                //aspectRatio: 16 / 9,
                viewportFraction: 0.94,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              items: widget.imagesList
                  .map(
                    (item) => CachedNetworkImage(
                      imageUrl: 'item',
                      fit: BoxFit.cover,
                      //width: 350,
                      height: 250,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ), /*Image.asset(
                      item,
                      fit: BoxFit.cover,
                      //width: 350,
                      height: 250,
                    ),*/
                  )
                  .toList()),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imagesList.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? widget.circlecolor
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CarouslImagesBanner extends StatefulWidget {
  final List<BannerModel> banners;
  final Color circlecolor;
  const CarouslImagesBanner({
    super.key,
    required this.banners,
    this.circlecolor = const Color.fromRGBO(0, 0, 0, 0.9),
  });

  @override
  State<CarouslImagesBanner> createState() => _CarouslImagesBannerState();
}

class _CarouslImagesBannerState extends State<CarouslImagesBanner> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: double.infinity,
          child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                //aspectRatio: 16 / 9,
                viewportFraction: 0.94,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              items: widget.banners
                  .map(
                    (item) => CachedNetworkImage(
                      imageUrl: 'item.image',
                      fit: BoxFit.cover,
                      //width: 350,
                      height: 250,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                  .toList()),
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.banners.asMap().entries.map((entry) {
            int index = entry.key;
            return Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? widget.circlecolor
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
*/