import 'package:learning_app/domain/entities/banner_entity.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselProductDetails extends StatefulWidget {
  final List<BannerEntity> items;
  final Alignment alignment;
  final BoxFit boxFit;
  // final List<Function> onTap;

  const CustomCarouselProductDetails({
    Key? key,
    required this.items,
    required this.alignment,
    required this.boxFit,
    // required this.onTap
  }) : super(key: key);

  @override
  _CustomCarouselProductDetailsState createState() =>
      _CustomCarouselProductDetailsState();
}

class _CustomCarouselProductDetailsState
    extends State<CustomCarouselProductDetails> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.items.isEmpty
        ? defaultSpacer
        : AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * .4,
                    onPageChanged: (index, reason) {
                      setActiveDot(index);
                    },
                    autoPlay: widget.items.length == 1 ? false : true,
                    autoPlayCurve: Curves.ease,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                    viewportFraction: .9,
                  ),
                  items: widget.items.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () => item.onTap(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: defaultPadding / 2),
                            alignment: widget.alignment,
                            // child: ClipRRect(
                            //   borderRadius:
                            //       BorderRadius.circular(defaultPadding),
                            child: CachedNetworkImage(
                              imageUrl: item.image,
                              fit: widget.boxFit,
                              errorWidget: (context, url, error) => Image.asset(
                                "assets/no_image.png",
                              ),
                            ),
                          ),
                          // ),
                        );
                      },
                    );
                  }).toList(),
                ),
                if (widget.items.length != 1)
                  Positioned(
                    left: 0,
                    right: 0,
                    // bottom: -10,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(widget.items.length, (idx) {
                          return activeIndex == idx
                              ? const ActiveDot()
                              : const InactiveDot();
                        })),
                  )
              ],
            ),
          );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 25,
        height: 8,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
