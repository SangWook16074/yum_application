import 'package:flutter/material.dart';
import 'package:yum_application/src/ingredient/widget/single_button.dart';
import 'package:yum_application/src/ui/recipe/widget/review_keyword_container.dart';

class ReviewWriteView extends StatefulWidget {
  const ReviewWriteView({super.key});

  @override
  State<ReviewWriteView> createState() => _ReviewWriteViewState();
}

class _ReviewWriteViewState extends State<ReviewWriteView> {
  List<bool> selectedStates = List.generate(17, (index) => false);

  void handleSelection(int index, bool isSelected) {
    setState(() {
      selectedStates[index] = isSelected;

      if (!isSelected && selectedStates.where((selected) => selected).isEmpty) {
        selectedStates[index] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profile(),
            _keyword(),
            _write(),
            _button(),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) => AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.0),
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        title: Text(
          "레시피 리뷰 작성",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      );

  Widget _profile() => Builder(builder: (context) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 12, top: 30),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Text(
                    "토마토 스프",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Text(
                  "000 님",
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            )
          ],
        );
      });

  Widget _keyword() => Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            width: 350,
            height: 530,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "레시피가 어땠나요?",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),

                /// 키워드
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ReviewKeywordContainer(
                              text: "맛있어요",
                              isSelected: selectedStates[0],
                              onSelected: (isSelected) =>
                                  handleSelection(0, isSelected)),
                        ),
                        ReviewKeywordContainer(
                            text: "간단해요",
                            isSelected: selectedStates[1],
                            onSelected: (isSelected) =>
                                handleSelection(1, isSelected)),
                        ReviewKeywordContainer(
                            text: "저렴해요",
                            isSelected: selectedStates[2],
                            onSelected: (isSelected) =>
                                handleSelection(2, isSelected)),
                        ReviewKeywordContainer(
                            text: "든든해요",
                            isSelected: selectedStates[3],
                            onSelected: (isSelected) =>
                                handleSelection(3, isSelected)),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ReviewKeywordContainer(
                              text: "자세해요",
                              isSelected: selectedStates[4],
                              onSelected: (isSelected) =>
                                  handleSelection(4, isSelected)),
                        ),
                        ReviewKeywordContainer(
                            text: "만들기 편해요",
                            isSelected: selectedStates[5],
                            onSelected: (isSelected) =>
                                handleSelection(5, isSelected)),
                        ReviewKeywordContainer(
                            text: "또 해 먹고 싶어요",
                            isSelected: selectedStates[6],
                            onSelected: (isSelected) =>
                                handleSelection(6, isSelected)),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ReviewKeywordContainer(
                              text: "간이 딱 맞아요",
                              isSelected: selectedStates[7],
                              onSelected: (isSelected) =>
                                  handleSelection(7, isSelected)),
                        ),
                        ReviewKeywordContainer(
                            text: "양이 적당해요",
                            isSelected: selectedStates[8],
                            onSelected: (isSelected) =>
                                handleSelection(8, isSelected))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ReviewKeywordContainer(
                          text: "건강한 맛이에요",
                          isSelected: selectedStates[9],
                          onSelected: (isSelected) =>
                              handleSelection(9, isSelected)),
                    )
                  ],
                ),

                /// 장점 키워드
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: Text(
                    "이런 점이 좋았어요!",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ReviewKeywordContainer(
                          text: "혼자 먹기 좋아요",
                          isSelected: selectedStates[10],
                          onSelected: (isSelected) =>
                              handleSelection(10, isSelected)),
                    ),
                    ReviewKeywordContainer(
                        text: "파티 음식으로 좋아요",
                        isSelected: selectedStates[11],
                        onSelected: (isSelected) =>
                            handleSelection(11, isSelected)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ReviewKeywordContainer(
                          text: "간단히 먹기 좋아요",
                          isSelected: selectedStates[12],
                          onSelected: (isSelected) =>
                              handleSelection(12, isSelected)),
                    ),
                    ReviewKeywordContainer(
                        text: "오래 먹기 좋아요",
                        isSelected: selectedStates[13],
                        onSelected: (isSelected) =>
                            handleSelection(13, isSelected)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ReviewKeywordContainer(
                          text: "활용하기 좋아요",
                          isSelected: selectedStates[14],
                          onSelected: (isSelected) =>
                              handleSelection(14, isSelected)),
                    ),
                    ReviewKeywordContainer(
                        text: "사진이 잘 나와요",
                        isSelected: selectedStates[15],
                        onSelected: (isSelected) =>
                            handleSelection(15, isSelected)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: ReviewKeywordContainer(
                      text: "혼술하기 좋아요",
                      isSelected: selectedStates[16],
                      onSelected: (isSelected) =>
                          handleSelection(16, isSelected)),
                )
              ],
            ),
          ),
        );
      });

  Widget _write() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
          width: 350,
          height: 290,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "후기 작성",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              Container(
                width: 320,
                height: 170,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text(
                          "최대 4 장",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      bottom: 1,
                      right: 1,
                      left: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/gallery.png',
                              color: const Color(0xffA2A2A2)),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "사진 추가하기",
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Text(
                    "레시피를 사용하면서 좋았던 점, 변형한 부분 등 자유롭게 적어 주세요!",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _button() => SingleButton(text: "등록하기", onTap: () {});
}
