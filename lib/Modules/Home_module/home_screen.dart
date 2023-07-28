import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:new_project_k/Widgets/text_widget.dart';
import 'package:new_project_k/utils/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_textField.dart';
import '../../generated/assets.dart';
import '../../utils/Constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxBool photoLike = false.obs;
  RxBool comment1Like = false.obs;
  RxBool comment2Like = false.obs;
  RxBool bookMark = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.blackColor,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.grey,
            ),
          )
        ],
        title: const TextWidget(
          "자유톡",
          color: AppColors.blackColor,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      setProfileImage(image: Assets.imagesProfileImage),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              TextWidget(
                                "안녕 나 응애",
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              Icon(
                                Icons.check_circle,
                                size: 20,
                                color: AppColors.buttonColor,
                              ),
                              TextWidget(
                                "1일전",
                                fontSize: 10,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          const TextWidget(
                            "165cm . 53kg",
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                      const Spacer(),
                      CustomButton(
                        text: '팔로우',
                        buttonHeight: 3.h,
                        buttonWidth: 20.w,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const TextWidget(
                    "지난 월요일에 했던 이벤트 중 가장 괜찮은 상품 뭐야?",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const TextWidget(
                    """지난 월요일에 2023년 S/S 트렌드 알아보기 이벤트 참석했던 팝들아~\n혹시 어떤 상품이 제일 괜찮았어?\n\n후기 올라오는거 보면 로우라이즈? 그게 제일 반응 좋고 그 테이블이\n제일 재밌었다던데 맞아???\n\n 올해 로우라이즈가 트렌드라길래 나도 도전해보고 싶은데 말라깽이가\n아닌 사람들도 잘 어울릴지 너무너무 궁금해ㅜㅜ로우라이즈 테이블에\n있었던 팝들 있으면 어땠는지 후기 좀 공유해주라~~!""",
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                    color: AppColors.black54Color,
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: List.generate(
                        hashtag.length,
                        (index) => Container(
                              margin:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                  color: AppColors.hashButtonBorder
                                      .withOpacity(0.3),
                                  border: Border.all(
                                      color: AppColors.hashButtonBorder),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextWidget(
                                "${hashtag[index]}",
                                color: AppColors.hashButtonText,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(Assets.imagesPostImage),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Obx(
                    () => Row(
                      children: [
                        commonLikeButton(photoLike),
                        SizedBox(
                          width: 2.w,
                        ),
                        const TextWidget(
                          "5",
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Image.asset(
                          Assets.imagesMessage,
                          height: 25,
                          width: 25,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        const TextWidget(
                          "5",
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            bookMark.value = !bookMark.value;
                          },
                          child: bookMark.value == false
                              ? Image.asset(
                                  Assets.imagesBookmark,
                                  height: 25,
                                  width: 25,
                                )
                              : const Icon(
                                  Icons.bookmark,
                                  size: 25,
                                  color: AppColors.redColor,
                                ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const Icon(
                          Icons.more_horiz,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: AppColors.black12Color,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      setProfileImage(image: Assets.imagesProfileImage),
                      SizedBox(
                        width: 2.w,
                      ),
                      Row(
                        children: [
                          const TextWidget(
                            "안녕 나 응애",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          const Icon(
                            Icons.check_circle,
                            size: 20,
                            color: AppColors.buttonColor,
                          ),
                          const TextWidget(
                            "1일전",
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TextWidget(
                          """어머 제가 있던 테이블이 제일 반응이 좋았나보네요🤭 우짤래미님도 아시겠지만 저도 일반인 몸매 그 이상도 이하도아니잖아요?! 그런 제가 기꺼이 도전해봤는데 생각보다괜찮았어요! 오늘 중으로 라이브 리뷰 올라온다고 하니꼭 봐주세용~!""",
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Obx(
                          () => Row(
                            children: [
                              commonLikeButton(comment1Like),
                              SizedBox(
                                width: 2.w,
                              ),
                              const TextWidget(
                                "5",
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Image.asset(
                                Assets.imagesMessage,
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              const TextWidget(
                                "5",
                                color: Colors.grey,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            setProfileImage(image: Assets.imagesProfile),
                            SizedBox(
                              width: 2.w,
                            ),
                            Row(
                              children: [
                                const TextWidget(
                                  "ㅇㅅㅇ",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                const Icon(
                                  Icons.check_circle,
                                  size: 20,
                                  color: AppColors.buttonColor,
                                ),
                                const TextWidget(
                                  "1일전",
                                  fontSize: 10,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.more_horiz,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Obx(
                          () => commonLikeButton(comment2Like),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
              color: AppColors.black12Color,
            ),
            CustomFormField(
              suffixIcon: const TextWidget(
                "등록",
                color: Colors.grey,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  Assets.imagesImagesmode,
                  height: 18,
                  width: 18,
                ),
              ),
              hintText: '댓글을 남겨주세요.',
            )
          ],
        ),
      ),
    );
  }

  commonLikeButton(RxBool value) {
    return GestureDetector(
      onTap: () {
        value.value = !value.value;
      },
      child: value.value == false
          ? Image.asset(
              Assets.imagesHeart,
              height: 20,
              width: 20,
            )
          : const Icon(
              Icons.favorite,
              size: 20,
              color: AppColors.redColor,
            ),
    );
  }
}
