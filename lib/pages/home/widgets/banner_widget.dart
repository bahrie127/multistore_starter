import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/images.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int indexIndicator = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width,
          height: width * 0.4,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  disableCenter: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      indexIndicator = index;
                    });
                  },
                ),
                itemCount: 3,
                itemBuilder: (context, index, _) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                          placeholder: Images.placeholder,
                          fit: BoxFit.cover,
                          image: 'https://picsum.photos/250',
                          imageErrorBuilder: (c, o, s) => Image.asset(
                            Images.placeholder,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TabPageSelectorIndicator(
                    backgroundColor: indexIndicator == 0
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    borderColor: indexIndicator == 0
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    size: 10,
                  ),
                  TabPageSelectorIndicator(
                    backgroundColor: indexIndicator == 1
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    borderColor: indexIndicator == 1
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    size: 10,
                  ),
                  TabPageSelectorIndicator(
                    backgroundColor: indexIndicator == 2
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    borderColor: indexIndicator == 2
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    size: 10,
                  ),
                ]),
              ),
            ],
          ),
          // Shimmer.fromColors(
          //   baseColor: Colors.grey[300]!,
          //   highlightColor: Colors.grey[100]!,
          //   enabled: true,
          //   child: Container(
          //       margin: const EdgeInsets.symmetric(horizontal: 10),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: ColorResources.white,
          //       )),
          // ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
