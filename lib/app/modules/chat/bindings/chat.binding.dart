import 'package:doan/app/data/providers/chat.provider.dart';
import 'package:doan/app/data/repositories/chat.repository.dart';
import 'package:get/get.dart';
import 'package:doan/app/modules/chat/controllers/chat.controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
          () => ChatController(
        repository: ChatRepository(
          apiClient: ChatProvider(),
        ),
      ),
    );
   }
}
