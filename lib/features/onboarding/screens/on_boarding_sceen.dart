import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_cash/helper/route_helper.dart';
import 'package:six_cash/util/app_constants.dart';
import 'package:six_cash/util/color_resources.dart';
import 'package:six_cash/util/dimensions.dart';
import 'package:six_cash/util/styles.dart';
import 'package:six_cash/common/widgets/custom_small_button_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/image/onboarding_bg.png',
              fit: BoxFit.cover,
            ),
          ),

          /// Overlay Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              /// Welcome Text
              Padding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeOverLarge),
                child: Text(
                  'Seja bem-vindo(a) ao Banco Diferente',
                  style: rubikSemiBold.copyWith(
                    fontSize: Dimensions.fontSizeOverOverLarge,
                    color: Colors.white, // Use a cor de texto conforme o tema
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const Spacer(flex: 5),

              /// Proceeding Text
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeDefault,
                  vertical: Dimensions.paddingSizeSmall,
                ),
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: rubikRegular.copyWith(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeSmall,
                        ),
                        text: "${'by_proceeding_you'.tr} ",
                      ),
                      TextSpan(
                        style: rubikRegular.copyWith(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeSmall,
                          decoration: TextDecoration.underline,
                        ),
                        text: 'privacy_policy'.tr,
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () async => Get.toNamed(RouteHelper.privacy),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: context.width * 0.7,
                padding: const EdgeInsets.only(
                    left: Dimensions.paddingSizeDefault,
                    right: Dimensions.paddingSizeDefault,
                    bottom: Dimensions.paddingSizeExtraExtraLarge),
                child: CustomSmallButtonWidget(
                  onTap: () => Get.toNamed(RouteHelper.getRegistrationRoute()),
                  backgroundColor: Theme.of(context).primaryColor,
                  text: 'login_registration'.tr,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
