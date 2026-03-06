import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'app_config.dart';
import 'loading_screen.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key, this.cookieManager});
  final PlatformWebViewCookieManager? cookieManager;
  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final PlatformWebViewController _controller;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _controller =
        PlatformWebViewController(
          WebKitWebViewControllerCreationParams(
            allowsInlineMediaPlayback: true,
          ),
        )..setPlatformNavigationDelegate(
          PlatformNavigationDelegate(
            const PlatformNavigationDelegateCreationParams(),
          )..setOnPageFinished((String url) async {
            await Future.delayed(const Duration(seconds: 10));
            setState(() {
              isLoading = false;
            });
          }),
        );
    _controller.loadRequest(
      LoadRequestParams(uri: Uri.parse(AppConfig.webGLEndpoint)),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(AppConfig.webGLAllowedOrientations);
    return Scaffold(
      body: Stack(
        children: [
          PlatformWebViewWidget(
            PlatformWebViewWidgetCreationParams(controller: _controller),
          ).build(context),

          // Индикатор загрузки поверх WebView
          if (isLoading) LoadingScreen(),
        ],
      ),
    );
  }
}
