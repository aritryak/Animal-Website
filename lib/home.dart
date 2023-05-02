// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dummy_education_website/model/animal.model.dart';
import 'package:dummy_education_website/model/color.model.dart';
import 'package:dummy_education_website/model/fonts.model.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> selectedIndex = ValueNotifier(0);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // bgImage,
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: double.infinity,
                  width: 80,
                  color: AppColors.primary,
                  child: leftSlider,
                ),
                sliderScreen
              ],
            ),
          ),
        ],
      ),
    );
  }

  // left slider
  Widget get leftSlider => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [logo, sliderPointers, slideDown],
      );

  // Slider pointers
  Widget get sliderPointers => Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
            wildNatureAnimal.length,
            (index) => Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ValueListenableBuilder<int>(
                      valueListenable: selectedIndex,
                      builder: (context, sliderindex, child) {
                        return CircleAvatar(
                          radius: 3.0,
                          backgroundColor: sliderindex == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.5),
                        );
                      }),
                )),
      );
  // logo
  Widget get logo => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          height: 30,
          width: 30,
          color: AppColors.white,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Icon(
                Icons.badge,
                color: AppColors.primary,
              )),
        ),
      );

  // slide down
  Widget get slideDown => Padding(
        padding: const EdgeInsets.all(20.0),
        child: RotatedBox(
          quarterTurns: 1,
          child: Row(
            children: [
              Text(
                'Scroll Down',
                style: TextStyle(color: AppColors.white),
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors.white,
                size: 22,
                opticalSize: 10,
              ),
            ],
          ),
        ),
      );

  // carousel slider
  Widget get sliderScreen => Expanded(
        child: CarouselSlider.builder(
          itemCount: wildNatureAnimal.length,
          options: CarouselOptions(
              onPageChanged: (index, reason) {
                selectedIndex.value = index;
              },
              height: double.infinity,
              viewportFraction: 1,
              scrollDirection: Axis.vertical,
              // height: double.infinity,
              autoPlay: true,
              autoPlayCurve: Curves.slowMiddle,
              // autoPlayCurve: Curves.easeOutCirc,
              // autoPlayCurve: Curves.elasticOut,
              autoPlayInterval: const Duration(seconds: 5)),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Stack(
              children: [
                // background image -------------------------------------
                Container(
                    decoration: BoxDecoration(
                  color: AppColors.background,
                  image: DecorationImage(
                    opacity: 0.45,
                    image: NetworkImage(wildNatureAnimal[index].image!),
                    fit: BoxFit.cover,
                  ),
                )),
                // screen
                Container(
                  width: double.infinity,
                  // color: AppColors.background,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          navigation,

                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                width: 300,
                                height: 300,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // species
                                    species,

                                    // species name
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: AnimatedContainer(
                                        duration: const Duration(seconds: 3),
                                        child: Text(
                                          wildNatureAnimal[index].name!,
                                          style: TextStyle(
                                            fontSize: 35,
                                            fontFamily: Fonts.medium,
                                            // fontWeight: FontWeight.bold,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // about,
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(
                                        wildNatureAnimal[index].about!,
                                        style: TextStyle(
                                          fontSize: 14,
                                          height: 1.6,
                                          color:
                                              AppColors.white.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                    // watch video------------
                                    watchVideo,
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // bottom row
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // territory,
                                  Container(
                                    width: 350,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Territory of habitat',
                                          style: TextStyle(
                                              color: AppColors.primary),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Text(
                                              wildNatureAnimal[index]
                                                  .territory!,
                                              style: TextStyle(
                                                  color: AppColors.white)),
                                        )
                                      ],
                                    ),
                                  ),

                                  // trinomial,
                                  Container(
                                    width: 350,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Trinomial name',
                                          style: TextStyle(
                                              color: AppColors.primary),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            wildNatureAnimal[index].trinomial!,
                                            style: TextStyle(
                                                color: AppColors.white),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20.0),
                                          child: Text(
                                            'Conservation status',
                                            style: TextStyle(
                                                color: AppColors.primary),
                                          ),
                                        ),
                                        conservationStatus
                                      ],
                                    ),
                                  ),

                                  // lections,
                                  Container(
                                    width: 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Lections',
                                          style: TextStyle(
                                              color: AppColors.primary),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Text(
                                            wildNatureAnimal[index].lections!,
                                            style: TextStyle(
                                                color: AppColors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                          )
                        ]),
                  ),
                ),
              ],
            );
          },
        ),
      );

  // navigation
  Widget get navigation => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('Wild',
                  style: TextStyle(color: AppColors.primary, fontSize: 20)),
              Text('Nature',
                  style: TextStyle(color: AppColors.white, fontSize: 20))
            ],
          ),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Species',
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.5),
                      fontSize: 12.0,
                    )),
                Text('Locations',
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.5),
                      fontSize: 12.0,
                    )),
                Text('Donate',
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.5),
                      fontSize: 12.0,
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.search,
                    size: 18.0,
                    color: AppColors.white.withOpacity(0.5),
                  ),
                )
              ],
            ),
          )
        ],
      );

  // species of america
  Widget get species => Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          'SPECIES OF AMERICA',
          style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 10,
              color: AppColors.white,
              letterSpacing: 1),
        ),
      );

  // Watch video
  Widget get watchVideo => Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 18.0,
            backgroundColor: AppColors.primary,
            child: Icon(
              Icons.play_arrow_rounded,
              color: AppColors.white,
            ),
          ),
          title: Text(
            'Watch video',
            style: TextStyle(color: AppColors.white, fontSize: 15.0),
          ),
        ),
      );

// conservation status
  Widget get conservationStatus => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'EX',
                    style: TextStyle(color: AppColors.white),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'EW',
                    style: TextStyle(color: AppColors.white),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CR',
                    style: TextStyle(color: AppColors.white),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'EN',
                    style: TextStyle(color: AppColors.white),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'EX',
                    style: TextStyle(color: AppColors.white),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'VU',
                    style: TextStyle(color: AppColors.white),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'NT',
                    style: TextStyle(color: AppColors.white),
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    // border: Border.all(color: AppColors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'LC',
                    style: TextStyle(color: AppColors.white),
                  ),
                ))
          ],
        ),
      );
  // lections
}
