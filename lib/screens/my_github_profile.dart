import 'package:flutter/material.dart';
import 'package:hngx_first_project/utils/constants.dart';
import 'package:hngx_first_project/utils/reuseables/custom_texts.dart';
import 'package:hngx_first_project/utils/size_config.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyGitHubProfileScreen extends StatefulWidget {
  const MyGitHubProfileScreen({super.key});

  @override
  State<MyGitHubProfileScreen> createState() => _MyGitHubProfileScreenState();
}

class _MyGitHubProfileScreenState extends State<MyGitHubProfileScreen> {
  double webProgress = 0;
  late WebViewController _controller;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    runWebView();
  }

  runWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColor.generalWhite)
      ..setNavigationDelegate(
        NavigationDelegate(
            onProgress: (int progress) {
              setState(() {
                webProgress = progress / 100;
              });
            },
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) {
              if (request.url.contains(AppTexts.gitHubUrl)) {
                return NavigationDecision.navigate;
              }
              return NavigationDecision.prevent;
            }),
      )
      ..loadRequest(Uri.parse(AppTexts.gitHubUrl));
  }

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
          WebViewWidget(
            controller: _controller,
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
