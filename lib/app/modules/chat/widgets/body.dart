import 'package:doan/app/data/models/chat.model.dart';
import 'package:doan/app/modules/chat/controllers/chat.controller.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:doan/app/utils/keys.dart';

class Body extends StatelessWidget {
  final store = GetStorage();
    Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return GetBuilder<ChatController>(
        init: Get.find(),
        builder: (controller) {
          return controller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(kDefaultPadding * 1.5),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          primary: false,
                          itemCount: controller.messages.length,
                          itemBuilder: (context, index) {
                            final message = controller.messages[index];
                            return _buildContentChat(message);
                          },
                        ),
                      ),
                      _buildChatMessage(controller),
                    ],
                  ),
                );
        });
  }

  Padding _buildContentChat(MessageModel message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.target.id == Get.arguments
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
        children: [
          _buildWidgetMessage(message),
        ],
      ),
    );
  }

  Widget _buildChatMessage(ChatController controller) {
    return Container(
      child: SafeArea(
        child: Row(
          children: [
            Icon(
              Icons.mic,
              color: kPrimaryColor,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    children: [
                      Icon(Icons.sentiment_satisfied_alt_outlined),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          controller: controller.textChatController.value,
                          onFieldSubmitted: (text){
                            controller.onSendMessageText(text);
                          },
                          decoration: InputDecoration(
                              hintText: "Type message",
                              border: InputBorder.none),
                        ),
                      ),
                      Icon(
                        Icons.file_present,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        icon:  Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        onPressed: (){
                          controller.onSentMessagePhoto();
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetMessage(MessageModel messageModel) {
    switch (messageModel.type) {
      case "text":
        return _buildContentText(messageModel);
        break;
      case "img":
        return _buildContentImage(messageModel);
        break;
      default:
        return SizedBox();
    }
  }

  Widget _buildContentText(MessageModel message) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 10,
        maxWidth: Get.width * 0.7,
      ),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: message.target.id != Get.arguments
              ? kPrimaryColor.withOpacity(0.1)
              : kPrimaryColor,
        ),
        child: Text(
          message.content,
          style: TextStyle(
              color: message.target.id != Get.arguments
                  ? Colors.black
                  : Colors.white),
        ),
      ),
    );
  }
}

Widget _buildContentImage(MessageModel message) {
  return ConstrainedBox(
    constraints: new BoxConstraints(
      minHeight: 10,
      maxWidth: Get.width * 0.7,
    ),
    child: Container(
      width: Get.width,
      padding: const EdgeInsets.all(kDefaultPadding),
      child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(message.content),
          ),
    ),
  );
}