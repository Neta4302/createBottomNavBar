import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:video_player/video_player.dart';

//like_icon
class LikeIcon extends StatelessWidget {
  const LikeIcon({super.key});

  Future<int> tempFuture() async {
    return Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: tempFuture(),
        builder: (context, snapshot) =>
            snapshot.connectionState != ConnectionState.done
                ? const Icon(Icons.favorite, size: 110)
                : const SizedBox(),
      ),
    );
  }
}

//option_screen
class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 110),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 16,
                        child: Icon(Icons.person, size: 18, color: Colors.white),
                      ),
                      const SizedBox(width: 6),
                      const Text('noobmaster69', style: TextStyle(color: Colors.white)),
                      const SizedBox(width: 10),
                      const Icon(Icons.verified, size: 15, color: Colors.blue),
                      const SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 6),
                  const Text('I Love You 3000!', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                        color: Colors.white
                      ),
                      Text('Original Audio - some music track--', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Icon(Icons.favorite_outline, color: Colors.white),
                  const Text('300k', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  const Icon(Icons.comment_rounded, color: Colors.white),
                  const Text('3000', style: TextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                  const SizedBox(height: 50),
                  const Icon(Icons.more_vert, color: Colors.white),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

//content_screen
class ContentScreen extends StatefulWidget {
  final String? src;

  const ContentScreen({Key? key, this.src}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _liked = !_liked;
                  });
                },
                child: Chewie(
                  controller: _chewieController!,
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 10),
                  Text('Loading...')
                ],
              ),
        if (_liked)
          const Center(
            child: LikeIcon(),
          ),
        const OptionsScreen()
      ],
    );
  }
}

class UserReel extends StatelessWidget {
  UserReel({super.key});

  final List<String> videos = [
    'https://assets.mixkit.co/videos/preview/mixkit-panoramic-aerial-shot-of-a-metropolis-at-night-49875-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-old-street-at-night-3456-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-slow-motion-flame-when-burning-wood-3431-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-view-of-the-night-sky-filled-with-stars-39770-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-scary-halloween-pumpkin-lit-up-in-the-dead-of-night-33888-large.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.dark,
              darkTheme: ThemeData.dark(),
            ),
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ContentScreen(
                  src: videos[index],
                );
              },
              itemCount: videos.length,
              scrollDirection: Axis.vertical,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Video',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                  Icon(Icons.camera_alt, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}