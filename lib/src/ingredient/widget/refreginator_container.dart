import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';
import 'package:yum_application/src/ingredient/widget/ingredient_edit_bottom_sheet.dart';
import 'package:yum_application/src/ingredient/widget/page_indicator.dart';

class RefreginatorContainer extends StatefulWidget {
  final List<Ingredient> children;
  final int rowCount;
  final String label;
  const RefreginatorContainer({
    super.key,
    required this.children,
    this.rowCount = 2,
    required this.label,
  });

  @override
  State<RefreginatorContainer> createState() => _RefreginatorContainerState();
}

class _RefreginatorContainerState extends State<RefreginatorContainer>
    with SingleTickerProviderStateMixin {
  int _pageIndex = 0;
  late final List<List<List<dynamic>>> _items = convertTo3D(widget.children);
  late final int _totalPage;
  late final PageController _pageController;
  late final TabController _tabController;

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _pageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageController.jumpToPage(index);
  }

  List<List<List<dynamic>>> convertTo3D(List<Ingredient> children) {
    final oneDArray = children.map((i) => _buildItem(i)).toList();
    int groupSize = widget.rowCount * 4;

    // 3차원 배열을 저장할 리스트
    List<List<List<Widget>>> threeDArray = [];

    // 배열을 8개씩 나누어 처리
    for (int i = 0; i < oneDArray.length; i += groupSize) {
      // 8개씩 자른 서브 리스트를 만듦
      List<Widget> sublist = oneDArray.sublist(i,
          i + groupSize > oneDArray.length ? oneDArray.length : i + groupSize);

      // 마지막 그룹이 8개 미만이면 Empty Item으로 채움
      if (sublist.length < groupSize) {
        sublist = sublist +
            List.generate(
                groupSize - sublist.length, (index) => _generateEmtpy());
      }

      // 3차원 배열 규칙에 맞게 추가
      threeDArray.add(List.generate(widget.rowCount,
          (index) => sublist.sublist(index * 4, (index + 1) * 4)));
    }

    return threeDArray;
  }

  @override
  void initState() {
    _totalPage = widget.children.length ~/ (4 * widget.rowCount) + 1;
    _pageController = PageController();
    _tabController = TabController(length: _totalPage, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: widget.rowCount * 130),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Theme.of(context).colorScheme.onPrimaryContainer),
      child: Stack(
        children: [
          _header(),
          (widget.children.isNotEmpty) ? _displayPageView() : _emptyPageView(),
          _indicator(),
        ],
      ),
    );
  }

  Widget _displayPageView() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: PageView(
            key: const Key("Ingredient Page View"),
            controller: _pageController,
            onPageChanged: _handlePageViewChanged,
            children: List.generate(
              _items.length,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(widget.rowCount, (jndex) {
                      final rowItem = _items[index][jndex];
                      return _displayItemRow(rowItem);
                    })),
              ),
            )),
      );

  /// 재료가 아예 없는 경우에 빌드되는 위젯
  /// 재료가 없으면 랜덤한 6개의 문자열 중 하나를 선택해서
  /// 가운데에 빌드
  Center _emptyPageView() {
    // 랜덤 글자
    final emptyStatusString = <String>[
      "꼬르륵",
      "밥꼭챙",
      "뭐먹지",
      "냉파하는 날",
      "청소하는 날",
      "밥먹어"
    ];

    // 글자 중 하나를 선택해서 빌드
    final randomString =
        emptyStatusString[Random().nextInt(emptyStatusString.length)];
    return Center(
      key: const Key("Random empty string widget"),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          randomString,
          style: Theme.of(context).textTheme.bodyLarge,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }

  Widget _divider() => Container(
        height: 10,
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(
              top: BorderSide.none,
              left: BorderSide(width: 2.0, color: Color(0xffE8EEF2)),
              right: BorderSide(width: 2.0, color: Color(0xffE8EEF2)),
              bottom: BorderSide(width: 2.0, color: Color(0xffE8EEF2)),
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0))),
      );

  Widget _displayItemRow(List<dynamic> row) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(row.length, (index) => row[index]),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: _divider(),
              ))
        ],
      );

  Widget _buildItem(Ingredient item) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32.0))),
              context: context,
              builder: (context) => IngredientEditBottomSheet(
                    ingredient: item,
                  ));
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(2.0), child: item.image),
              Builder(builder: (context) {
                return Text(
                  item.name,
                  style: Theme.of(context).textTheme.displaySmall,
                );
              })
            ],
          ),
        ),
      );

  Widget _generateEmtpy() {
    return Opacity(
      opacity: 0.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 40,
              height: 40,
              color: Colors.grey,
            ),
          ),
          const Text(
            "Item",
          )
        ],
      ),
    );
  }

  Widget _header() {
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.label, style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ));
  }

  Widget _indicator() => Align(
        alignment: Alignment.bottomCenter,
        child: (_totalPage > 1)
            ? PageIndicator(
                key: const Key("Indicator"),
                tabController: _tabController,
                currentPageIndex: _pageIndex,
                onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              )
            : Container(
                padding: const EdgeInsets.all(8.0),
              ),
      );
}
