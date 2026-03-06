import 'package:flutter/material.dart';

import 'app_config.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppConfig.webGLLoadingDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Image(
            image: AssetImage(AppConfig.logoPath),
            width: 200,
            height: 200,
          ),

          // const SizedBox(height: 100),
          Column(
            children: [
              const Center(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    color: AppConfig.webGLSpinerColor,
                    strokeWidth: 8,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppConfig.webGLLoadingText,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
