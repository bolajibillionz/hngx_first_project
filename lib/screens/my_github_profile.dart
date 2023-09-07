import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hngx_first_project/utils/constants.dart';
import 'package:hngx_first_project/utils/reuseables/custom_texts.dart';
import 'package:hngx_first_project/utils/size_config.dart';

class MyGitHubProfileScreen extends StatefulWidget {
  const MyGitHubProfileScreen({super.key});

  @override
  State<MyGitHubProfileScreen> createState() => _MyGitHubProfileScreenState();
}

class _MyGitHubProfileScreenState extends State<MyGitHubProfileScreen> {
  double webProgress = 0;
  late InAppWebViewController webController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: AppColor.generalWhite,
        elevation: 0,
        centerTitle: true,
        title: buildCustomText(
            inputText: AppTexts.title,
            fontSize: 16,
            weight: FontWeight.bold,
            colorName: AppColor.primaryColor),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(AppTexts.gitHubUrl)),
            onWebViewCreated: (InAppWebViewController controller) {
              webController = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                webProgress = progress / 100;
              });
            },
          ),
          webProgress < 1
              ? SizedBox(
                  height: getProportionateScreenHeight(3),
                  child: LinearProgressIndicator(
                    value: webProgress,
                    color: AppColor.primaryColor,
                    backgroundColor: AppColor.generalWhite,
                  ),
                )
              : SizedBox()
        ],
      )),
    );
  }
}
