import 'package:doan/app/modules/home/controllers/home.controller.dart';
import 'package:doan/app/routes/app_pages.dart';
import 'package:doan/app/theme/color_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/modules/navigation/views/navigation.view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: kPrimaryColor,
          title: Text(
            "School Kids",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: GetBuilder<HomeController>(
            init: Get.find(),
            builder: (controller) {
              return SingleChildScrollView(
                child: RefreshIndicator(
                  onRefresh: () {
                    controller.getAlbum(controller.classId);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: Get.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Icon(
                                    Icons.image,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(width: 7),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'Album ',
                                        style: TextStyle(color: Colors.black),
                                        children: [
                                          TextSpan(
                                              text: controller.nameAlbum,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black))
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0xFF81E272),
                          ),
                          // Container(
                          //   height: 40,
                          //   padding: const EdgeInsets.symmetric(horizontal: 10),
                          //   child: Row(
                          //     children: [
                          //       Container(
                          //         width: 40,
                          //         height: 40,
                          //         child: ClipRRect(
                          //           borderRadius: new BorderRadius.circular(50),
                          //           child: Image(
                          //             fit: BoxFit.fill,
                          //             image:
                          //             AssetImage('assets/images/school.jpg'),
                          //           ),
                          //         ),
                          //       ),
                          //       SizedBox(width: 7),
                          //       Expanded(
                          //         child: Padding(
                          //           padding:
                          //           const EdgeInsets.symmetric(vertical: 2),
                          //           child: Column(
                          //             mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //             crossAxisAlignment:
                          //             CrossAxisAlignment.start,
                          //             children: [
                          //               RichText(
                          //                 text: TextSpan(
                          //                     text: 'Cô giáo Hoa Sen',
                          //                     style: TextStyle(
                          //                         color: Colors.black,
                          //                         fontWeight: FontWeight.bold),
                          //                     children: [
                          //                       TextSpan(
                          //                         text: ' đã thêm 4 ảnh mới',
                          //                         style: TextStyle(
                          //                             color: Colors.black),
                          //                       ),
                          //                     ]),
                          //               ),
                          //               Text(
                          //                 'Hoa Sen - Thứ 7, 14/09/2019',
                          //                 style: TextStyle(color: Colors.black),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                          SizedBox(height: 10),
                          controller.isLoading.value
                              ? CircularProgressIndicator()
                              : controller.album != null && controller.album.value.images.length > 0
                              ? buildStackImage(controller)
                              : SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
        bottomNavigationBar: NavigationView());
  }

  Widget buildStackImage(HomeController controller) {
    return GestureDetector(
      child: Stack(
        alignment: Alignment.center,
        children:
            // buildItemImage(3, Get.width)
            [
          Container(
            width: Get.width,
            height: 260,
          ),
          Positioned(
            top: 0,
            child: Container(
              width: Get.width - 60,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withOpacity(0.5))),
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: controller.album.value.images[2] != null
                    ? Image.network(
                        "${controller.album.value.images[2]}",
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: Get.width,
                        height: Get.height,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              width: Get.width - 40,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withOpacity(0.5))),
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: controller.album.value.images[1] != null
                    ? Image.network(
                        "${controller.album.value.images[1]}",
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: Get.width,
                        height: Get.height,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Container(
              width: Get.width - 20,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white.withOpacity(0.5))),
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(10.0),
                child: controller.album.value.images[0] != null
                    ? Image.network(
                        "${controller.album.value.images[0]}",
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: Get.width,
                        height: Get.height,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        Get.toNamed(Routes.ALBUM);
      },
    );
  }

  List<Widget> buildItemImage(int length, double width) {
    List<Widget> items = [];
    Widget item1 = Container(
      width: width,
      height: 260,
    );
    items.add(item1);
    length = length < 3 ? length : 3;
    for (int i = 0; i < length; i++) {
      double widthItem = width - (length - i) * 2 * 10;
      Widget item = Positioned(
        top: i * 10.0,
        child: Container(
          width: width - widthItem,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.pink.withOpacity(0.5))),
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(10.0),
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/school.jpg'),
            ),
          ),
        ),
      );
      items.add(item);
    }
    return items;
  }
}
