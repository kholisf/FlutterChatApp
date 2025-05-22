import 'package:chat_aplikasi/app/controllers/auth_controller.dart';
import 'package:chat_aplikasi/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';


class IntroductionView extends GetView<IntroductionController> {
  IntroductionView({super.key});
  final authC =Get.find<AuthController>();
  final List<PageViewModel> listPageViewModels = [
    PageViewModel(
      title: "Mulai berintraksi dengan mudah",
      body: "Kamu cuma perlu dirumah saja untuk mendapatkan teman baru",
      image: Lottie.asset(
        "assets/lottie/main-laptop-duduk.json",
        repeat: true,
        fit: BoxFit.fill,
        width: Get.width * 0.6,
        height: Get.width * 0.6,
      ),
    ),
    PageViewModel(
      title: "Temukan sahabat baru",
      body:
          "Jika kamu menemukan jodoh dengan aplikasi ini kamu sangat beruntung",
      image: Lottie.asset(
        "assets/lottie/ojek.json",
        repeat: true,
        fit: BoxFit.fill,
        width: Get.width * 0.6,
        height: Get.width * 0.6,
      ),
    ),
    PageViewModel(
      title: "Aplikasi bebas biaya",
      body: "Kamu tidak perlu hawatir aplikasi ini bebas dari biaya",
      image: Lottie.asset(
        "assets/lottie/payment.json",
        repeat: true,
        fit: BoxFit.fill,
        width: Get.width * 0.6,
        height: Get.width * 0.6,
      ),
    ),
    PageViewModel(
      title: "Daftar sekarang juga",
      body:
          "Daftarkan diri kamu untuk menjadi bagian dari kamu kami akan menemukan teman baru bagi kamu",
      image: Lottie.asset(
        "assets/lottie/register.json",
        repeat: true,
        fit: BoxFit.fill,
        width: Get.width * 0.6,
        height: Get.width * 0.6,
      ),
    ),
  ];

  //    void _onIntroEnd(context) {
  //    Get.off()
  //   }

  //   Widget _buildImage(String assetName, [double width = 350]) {
  //     return Image.asset('assets/$assetName', width: width);
  //   }

  // List<PageViewModel> listPageViewIntro =[
  //         PageViewModel(
  //           title: "Fractional shares",
  //           body:
  //               "Instead of having to buy an entire share, invest any amount you want.",
  //           image: _buildImage('img1.jpg'),
  //           decoration: pageDecoration,
  //         ),
  //         PageViewModel(
  //           title: "Learn as you go",
  //           body:
  //               "Download the Stockpile app and master the market with our mini-lesson.",
  //           image: _buildImage('img2.jpg'),
  //           decoration: pageDecoration,
  //         ),
  //         PageViewModel(
  //           title: "Kids and teens",
  //           body:
  //               "Kids and teens can track their stocks 24/7 and place trades that you approve.",
  //           image: _buildImage('img3.jpg'),
  //           decoration: pageDecoration,
  //         ),
  //         PageViewModel(
  //           title: "Full Screen Page",
  //           body:
  //               "Pages can be full screen as well.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc id euismod lectus, non tempor felis. Nam rutrum rhoncus est ac venenatis.",
  //           backgroundImage: backgroundImage,
  //           decoration: pageDecoration.copyWith(
  //             contentMargin: const EdgeInsets.symmetric(horizontal: 16),
  //             bodyFlex: 2,
  //             imageFlex: 3,
  //             safeArea: 100,
  //           ),
  //         ),
  //         PageViewModel(
  //           title: "Another title page",
  //           body: "Another beautiful body text for this example onboarding",
  //           image: _buildImage('img2.jpg'),
  //           footer: ElevatedButton(
  //             onPressed: () {
  //               introKey.currentState?.animateScroll(0);
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.lightBlue,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(8.0),
  //               ),
  //             ),
  //             child: const Text(
  //               'FooButton',
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //           decoration: pageDecoration.copyWith(
  //             bodyFlex: 6,
  //             imageFlex: 6,
  //             safeArea: 80,
  //           ),
  //         ),
  //         PageViewModel(
  //           title: "Title of last page - reversed",
  //           bodyWidget: const Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text("Click on ", style: bodyStyle),
  //               Icon(Icons.edit),
  //               Text(" to edit a post", style: bodyStyle),
  //             ],
  //           ),
  //           decoration: pageDecoration.copyWith(
  //             bodyFlex: 2,
  //             imageFlex: 4,
  //             bodyAlignment: Alignment.bottomCenter,
  //             imageAlignment: Alignment.topCenter,
  //           ),
  //           image: _buildImage('img1.jpg'),
  //           reverse: true,
  //         ),
  //       ];

  @override
  Widget build(BuildContext context) {
    // const  bodyStyle = TextStyle(fontSize: 19.0);
    //      const pageDecoration = PageDecoration(
    //       titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    //       bodyTextStyle: bodyStyle,
    //       bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    //       pageColor: Colors.white,
    //       imagePadding: EdgeInsets.zero,
    //     );

    return Scaffold(
      body: IntroductionScreen(
        pages: listPageViewModels,
        onDone: () { Get.offAllNamed(Routes.LOGIN);
        authC.isSkipInto.value = true;
        GetStorage box = GetStorage();
        box.write("skipIntro", true);
        },
        // onSkip: () => Get.offAllNamed(Routes.LOGIN), // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back),
        skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
        // next: const Icon(Icons.arrow_forward),
        next: Text('Next', style: TextStyle(fontWeight: FontWeight.w600)),
        done: const Text('Login', style: TextStyle(fontWeight: FontWeight.w600)),
        // curve: Curves.fastLinearToSlowEaseIn,
        // controlsMargin: const EdgeInsets.all(16),
        // controlsPadding: kIsWeb
        //     ? const EdgeInsets.all(12.0)
        //     : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        // dotsDecorator: const DotsDecorator(
        //   size: Size(10.0, 10.0),
        //   color: Color(0xFFBDBDBD),
        //   activeSize: Size(22.0, 10.0),
        //   activeShape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(25.0)),
        //   ),
        // ),
        // dotsContainerDecorator: const ShapeDecoration(
        //   color: Colors.black87,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
        //   ),
        // ),
      ),
    );
  }
}
