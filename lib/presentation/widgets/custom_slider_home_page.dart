import 'package:learning_app/domain/entities/banner_entity.dart';
import 'package:learning_app/presentation/screens/home_screen/components/home_banner.dart';
import 'package:learning_app/presentation/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselHomePage extends StatefulWidget {
  final List<BannerEntity> items;
  // final List<Function> onTap;

  const CustomCarouselHomePage({
    Key? key,
    required this.items,
    // required this.onTap
  }) : super(key: key);

  @override
  _CustomCarouselHomePageState createState() => _CustomCarouselHomePageState();
}

class _CustomCarouselHomePageState extends State<CustomCarouselHomePage> {
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
                    viewportFraction: 1,
                  ),
                  items: widget.items
                      .map((item) => HomeBannerItem(item: item))
                      .toList(),
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
