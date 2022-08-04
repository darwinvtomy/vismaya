import 'package:flutter/material.dart';
import 'package:vismaya/dummy/data.dart';
import 'package:vismaya/widgets/featured/page_transformer.dart';

import 'intro_page_item.dart';


class IntroPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox.fromSize(
          size: const Size.fromHeight(200.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: sampleItems.length,
                itemBuilder: (context, index) {
                  final item = sampleItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return IntroPageItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
                onPageChanged: (int index) {
                  debugPrint('Bjnsdkajs');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
