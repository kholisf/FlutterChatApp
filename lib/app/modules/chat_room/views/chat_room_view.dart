import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart' as foundation;
import '../controllers/chat_room_controller.dart';

class ChatRoomView extends GetView<ChatRoomController> {
  ChatRoomView({super.key});

  final RxList<Widget> isiPesann =
      [
        ItemChat(
          isSender: true,
          isiPesan:
              "berikut beberapa cara alami merawat di Indonesia dengan kartu fisik maupun psikologis anak yang tidak bisa ",
          jamPesan: "10:12 AM",
        ),
        ItemChat(
          isSender: false,
          isiPesan: "ini balasan",
          jamPesan: "10:13 PM",
        ),
      ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(context.mediaQueryViewPadding.top + 30),
        child: Container(
          color: Colors.red[900],
          child: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Colors.white),

            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                      // Get.arguments ??
                          //  AssetImage("assets/logo/noimage.png")
                           NetworkImage(Get.arguments["photoUrl"]),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      Get.arguments["name"]??"lorem ipsum",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Online",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            centerTitle: false,
          ),
        ),
      ),
      body: PopScope(
        // canPop: !controller.emojiShow.value,
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (controller.emojiShow.isTrue) {
            controller.emojiShow.value = false;
          } else {
            Get.back();
          }
        },
        child: Column(
          children: [
            Expanded(
              child: SizedBox(child: Obx(() => ListView(children: isiPesann))),
            ),

            Container(
              // color: Colors.amber,
              padding: EdgeInsets.only(
                bottom:
                    controller.emojiShow.value
                        ? 0
                        : context.mediaQueryViewPadding.bottom,
              ),
              margin: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: controller.focusNode,
                      controller: controller.messageC,
                      minLines: 1,
                      maxLines: 5,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Obx(
                            () => Icon(
                              Icons.emoji_emotions_outlined,
                              size: 35,
                              color:
                                  controller.focusNode.hasFocus
                                      ? Colors.red
                                      : controller.emojiShow.value
                                      ? Colors.red
                                      : Colors.black,
                            ),
                          ),
                          onPressed: () {
                            controller.emojiShow.toggle();
                            if (controller.emojiShow.value == true) {
                              controller.focusNode.unfocus();
                            }
                          },
                        ),
                        hintText: "Type a message",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.red[900]!),
                        ),
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      if (controller.messageC.text.isNotEmpty) {
                        isiPesann.add(
                          ItemChat(
                            isSender: true,
                            isiPesan: controller.messageC.text,
                            jamPesan: DateFormat(
                              'hh:mm a',
                            ).format(DateTime.now()),
                          ),
                        );
                        controller.messageC.clear();
                      }
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red[900],
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(Icons.send, size: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () =>
                  (controller.emojiShow.value)
                      ? SizedBox(
                        height: 288,
                        // child: EmojiPicker(
                        //   textEditingController: controller.messageC,

                        //   // scrollController: _scrollController,
                        //   config: Config(
                        //     height: 256,
                        //     checkPlatformCompatibility: true,
                        //     viewOrderConfig: const ViewOrderConfig(),
                        //     emojiViewConfig: EmojiViewConfig(
                        //       // Issue: https://github.com/flutter/flutter/issues/28894
                        //       emojiSizeMax:
                        //           28 *
                        //           (foundation.defaultTargetPlatform ==
                        //                   TargetPlatform.iOS
                        //               ? 1.2
                        //               : 1.0),
                        //     ),
                        //     skinToneConfig: const SkinToneConfig(),
                        //     categoryViewConfig: const CategoryViewConfig(),
                        //     bottomActionBarConfig: const BottomActionBarConfig(
                        //       backgroundColor: Colors.transparent,
                        //     ),
                        //     searchViewConfig: const SearchViewConfig(),

                        //     customBackspaceIcon: const Icon(
                        //       Icons.backspace,
                        //       color: Colors.red,
                        //     ),
                        //   ),
                        // ),
                        child: EmojiPicker(
                          // onEmojiSelected: (Category category, Emoji emoji) {
                          //     // Do something when emoji is tapped (optional)
                          // },
                          onBackspacePressed: () {
                            // Do something when the user taps the backspace button (optional)
                            // Set it to null to hide the Backspace-Button
                          },
                          textEditingController:
                              controller
                                  .messageC, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]

                          config: Config(
                            height: 256,

                            // bgColor: const Color(0xFFF2F2F2),
                            checkPlatformCompatibility: true,
                            emojiViewConfig: EmojiViewConfig(
                              // Issue: https://github.com/flutter/flutter/issues/28894
                              emojiSizeMax:
                                  28 *
                                  (foundation.defaultTargetPlatform ==
                                          TargetPlatform.iOS
                                      ? 1.20
                                      : 1.0),
                            ),
                            viewOrderConfig: const ViewOrderConfig(
                              top: EmojiPickerItem.categoryBar,
                              middle: EmojiPickerItem.emojiView,
                              bottom: EmojiPickerItem.searchBar,
                            ),
                            skinToneConfig: const SkinToneConfig(),
                            categoryViewConfig: const CategoryViewConfig(),
                            bottomActionBarConfig: const BottomActionBarConfig(
                              backgroundColor: Color(0xFFB71C1C),
                            ),
                            searchViewConfig: const SearchViewConfig(
                              backgroundColor: Color(0xFFB71C1C),
                              buttonIconColor: Colors.white,
                              inputTextStyle: TextStyle(color: Colors.white),
                              hintTextStyle: TextStyle(color: Colors.white60),
                              hintText: "Search",
                            ),
                            // customSearchIcon: const Icon(
                            //   Icons.search,
                            //   color: Colors.white,

                            // ),
                            // emojiTextStyle: const TextStyle(
                            //   color: Colors.white,
                            // ),
                          ),
                        ),
                      )
                      : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    super.key,
    required this.isSender,
    required this.isiPesan,
    required this.jamPesan,
  });
  final bool isSender;
  final String isiPesan, jamPesan;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,

      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Get.width * 0.7),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red[800],
                borderRadius:
                    isSender
                        ? BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          // bottomRight: Radius.circular(20),
                        )
                        : BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          // bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
              ),

              padding: EdgeInsets.all(15),
              child: Text(
                isiPesan,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(jamPesan),
        ],
      ),
    );
  }
}

// https://flutter.github.io/assets-for-api-docs/assets/material/Colors.red.png
