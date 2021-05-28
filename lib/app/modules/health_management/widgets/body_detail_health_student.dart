import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doan/app/theme/color_theme.dart';

class BodyDetailHealthStudent extends StatelessWidget {
  const BodyDetailHealthStudent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.5, vertical: kDefaultPadding),
          margin: const EdgeInsets.only(
              top: kDefaultPadding * 2,
              left: kDefaultPadding * 2,
              right: kDefaultPadding * 2),
          width: Get.width,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 0),
                    color: kPrimaryColor.withOpacity(0.3),
                    blurRadius: 7),
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: RichText(
                        text: TextSpan(
                            text: "Height: ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: "1.65 m",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                  ))
                            ]),
                      )),
                  Expanded(
                      flex: 1,
                      child: RichText(
                        text: TextSpan(
                            text: "Weight: ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: "60 kg",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                  ))
                            ]),
                      )),
                  Expanded(
                      flex: 1,
                      child: RichText(
                        text: TextSpan(
                            text: "Date: ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                  text: "22/02/2022",
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                  ))
                            ]),
                      )),
                ],
              ),
              SizedBox(height: 5),
              Expanded(
                  flex: 1,
                  child: RichText(
                    text: TextSpan(
                        text: "Note: ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: "Aut neque incidunt eius corporis ratione voluptas nihil ad",
                              style: TextStyle(
                                color: kPrimaryColor,
                              )
                          )
                        ]
                    ),
                  )
              ),
            ],
          ),
        );
      },
    );
  }
}
