import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
// import 'package:media_kit/media_kit.dart';
// import 'package:media_kit_video/media_kit_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../app.dart';

class FitnessHome extends StatefulWidget {
  const FitnessHome({super.key});

  @override
  State<FitnessHome> createState() => _FitnessHomeState();
}

class _FitnessHomeState extends State<FitnessHome>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool isActice = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.color2,
      appBar: AppBar(
        backgroundColor: AppColor.color2,
        iconTheme: IconThemeData(color: AppColor.color1),
        actions: [
          GestureDetector(
            onTap: () {
              if (isActice) {
                isActice = !isActice;
                _controller.forward();
              } else {
                isActice = !isActice;
                _controller.reset();
              }
            },
            child: Lottie.asset(
              "assets/lotties/favourite.json",
              controller: _controller,
              height: 60,
              delegates: LottieDelegates(
                values: [
                  ValueDelegate.color(
                    const ["**"],
                    value: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: FitnessBody(),
    );
  }
}

class FitnessBody extends StatefulWidget {
  FitnessBody({Key? key}) : super(key: key);

  @override
  State<FitnessBody> createState() => _FitnessBodyState();
}

class _FitnessBodyState extends State<FitnessBody> {
  int _currentIndex = 0;

  final List<String> images = [
    "assets/images/dumbbell1.png",
    "assets/images/dumbbell2.png",
    "assets/images/dumbbell3.png",
  ];

  final videoURL =
      "https://www.youtube.com/watch?v=oo0bZ6Vrepg&ab_channel=GYMBODYMOTIVATION";
  late YoutubePlayerController _controller;

  final List<String> labels = [
    'Pectoralis Major',
    'Sternal',
    'Pectoralis Major',
    'Sternal',
    'Pectoralis Major',
    'Sternal',
  ];

  final List<String> step1 = [
    "Lie flat on a bench with your feet firmly planted on the ground.Lie flat on a bench with your feet firmly planted on the ground.",
    "Hold a dumbbell in each hand, resting them on your thighs.",
  ];

  final List<String> step2 = [
    "Using a controlled motion, bring the dumbbells up to shoulder level while sitting on the bench. This is your starting position.",
    "Your palms should be facing forward, and your wrists should be in a neutral position.",
  ];

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColor.color2,
              automaticallyImplyLeading: false,
              expandedHeight: 250.0,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    CarouselSlider(
                      items: images.map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.map((url) {
                          int index = images.indexOf(url);
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? AppColor.color4
                                  : AppColor.color5,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Container(
                      height: 6,
                      width: 200,
                      decoration: BoxDecoration(
                          color: AppColor.color2,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "DUMBBELL PRESS",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColor.color1,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "The dumbbell press is a classic upper-body strengthening exercise that works your chest. Your chest muscle are the main muscles targeted by the exercise, but as an added bonus it also works your anterior deltoid and triceps. It is an alternative to the barbell bench press and offers some unique benefits due to the use of individual dumbbells.",
                    style: TextStyle(
                      color: AppColor.color1,
                    ),
                  ),
                  SizedBox(height: 10),
                  YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    onReady: () {
                      _controller.addListener(() {
                        if (_controller.value.isReady &&
                            !_controller.value.hasPlayed) {
                          _controller.play();
                        }
                      });
                    },
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: ProgressBarColors(
                          playedColor: Colors.red,
                          handleColor: Colors.red,
                        ),
                      ),
                      PlaybackSpeedButton(),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 170,
                    //padding: EdgeInsets.all(16.0),
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 600),
                            child: TabBar(
                              indicatorColor: AppColor.color4,
                              tabs: [
                                Tab(
                                  child: Text(
                                    "MUSCLE GROUPS",
                                    style: TextStyle(
                                      color: AppColor.color1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "EQUIPMENT",
                                    style: TextStyle(
                                      color: AppColor.color1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: TabBarView(
                              children: [
                                ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Wrap(
                                          spacing: 8.0,
                                          runSpacing: 4.0,
                                          alignment: WrapAlignment.start,
                                          children: labels
                                              .map((label) =>
                                                  LabelChip(label: label))
                                              .toList(),
                                        )),
                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Wrap(
                                          spacing: 8.0,
                                          runSpacing: 4.0,
                                          alignment: WrapAlignment.start,
                                          children: labels
                                              .map((label) =>
                                                  LabelChip(label: label))
                                              .toList(),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "HOW TO DO:",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColor.color1,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Image.asset(
                          "assets/icons/DumbbellPress.gif",
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 10),
                      StepWidget(
                        title: "Setup",
                        content: step1,
                        index: 0,
                      ),
                      StepWidget(
                        title: "Starting Positions",
                        content: step2,
                        index: 1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          left: 16,
          right: 16,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.color4),
                  onPressed: () {
                    setState(() {
                      // if (_controller.value.isPlaying) {
                      //   _controller.pause();
                      // } else {
                      //   _controller.play();
                      // }
                    });
                  },
                  child: Text(
                    'Start',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColor.color2),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class StepWidget extends StatelessWidget {
  final String title;
  final List<String> content;
  final int index;

  const StepWidget({
    super.key,
    required this.title,
    required this.content,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${index + 1}. $title",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Column(
          children: content.map((item) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class LabelChip extends StatelessWidget {
  final String label;

  LabelChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: AppColor.color2),
      ),
      backgroundColor: AppColor.color4,
      labelStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}



// video player
// FutureBuilder(
//   future: _initializeVideoPlayerFuture,
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.done) {
//       // If the VideoPlayerController has finished initialization, use
//       // the data it provides to limit the aspect ratio of the video.
//       return AspectRatio(
//         aspectRatio: _controller.value.aspectRatio,
//         // Use the VideoPlayer widget to display the video.
//         child: VideoPlayer(_controller),
//       );
//     } else {
//       // If the VideoPlayerController is still initializing, show a
//       // loading spinner.
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//   },
// )

// tab menu
// Container(
//   height: 500,
//   //padding: EdgeInsets.all(16.0),
//   child: DefaultTabController(
//     length: 2,
//     child: Column(
//       children: [
//         Container(
//           constraints: BoxConstraints(maxWidth: 600),
//           child: TabBar(
//             tabs: [
//               Tab(text: 'Tab 1'),
//               Tab(text: 'Tab 2'),
//             ],
//           ),
//         ),
//         Expanded(
//           child: TabBarView(
//             children: [
//               ListView(
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   Center(child: Text("")),
//                 ],
//               ),
//               ListView(
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   Center(
//                     child: Text('Content for Tab 2'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// ),

// full screen youtube
//YoutubePlayerBuilder(
//   player: YoutubePlayer(
//     controller: _controller,
//     bottomActions: [
//       CurrentPosition(),
//       ProgressBar(
//         isExpanded: true,
//         colors: ProgressBarColors(
//           playedColor: Colors.red,
//           handleColor: Colors.red,
//         ),
//       ),
//       PlaybackSpeedButton(),
//     ],
//   ),
//   builder: (context, player) {
//     return Column(
//       children: [player],
//     );
//   },
// ),
