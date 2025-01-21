import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({super.key});

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  List<int> _selectedApplianceIndices = [];

  List<TextField> _ingredientsInputFields = List.empty(growable: true);

// 버튼 배경색
  Color _getButtonColor(int index) {
    return _selectedApplianceIndices.contains(index)
        ? Color(0xffFFB300)
        : Colors.white;
  }

// 텍스트 색상
  Color _getTextColor(int index) {
    return _selectedApplianceIndices.contains(index)
        ? Colors.white
        : Color(0xffA2A2A2);
  }

// 테두리 유무
  Border _getButtonBorder(int index) {
    return _selectedApplianceIndices.contains(index)
        ? Border.all(color: Colors.transparent)
        : Border.all(color: Color(0xffd7d7d7), width: 1.0);
  }

  void _generateIngredientInputField() {
    final Key _fieldKey =
        Key("inputField${_ingredientsInputFields.length + 1}");
    final TextEditingController _controller = TextEditingController();
    final newField = TextField(
      key: _fieldKey,
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: GestureDetector(
          onTap: () => _deleteInputField(_fieldKey),
          child: Icon(CupertinoIcons.minus_circle_fill),
        ),
        hintText: "예) 토마토",
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        filled: true,
        fillColor: Color(0xffF3F3F3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      style: Theme.of(context).textTheme.displaySmall,
    );

    setState(() {
      _ingredientsInputFields.add(newField);
    });
  }

  void _deleteInputField(Key key) {
    if (_ingredientsInputFields.length < 3) {
      return;
    }
    setState(() {
      _ingredientsInputFields =
          _ingredientsInputFields.where((field) => field.key! != key).toList();
    });
  }

  @override
  void didChangeDependencies() {
    for (var i = 0; i < 3; i++) {
      _generateIngredientInputField();
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              _inputAmount(),
              _ingredientsInputFeilds(),
              _inputCookers(),
              _inputTotalTime(),
            ],
          ),
        ));
  }

  Widget _header() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Text(
          "레시피 한눈에 작성하기",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      );

  Widget _inputAmount() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "레시피 양",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  height: 27,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "3",
                        hintStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Color(0xffF3F3F3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5)),
                  ),
                ),
                Text(
                  "인분 기준",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ),
        ],
      );

  Widget _ingredientsInputFeilds() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Row(
              children: [
                Text(
                  "사용한 재료",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                GestureDetector(
                  onTap: _generateIngredientInputField,
                  child: Icon(Icons.add_circle_outline_outlined, size: 20),
                ),
              ],
            ),
          ),
          ..._ingredientsInputFields.map(
            (fields) => Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5.0),
              child: SizedBox(width: 350, child: fields),
            ),
          ),
        ],
      );

  Widget _inputCookers() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              "사용한 가전제품",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_selectedApplianceIndices.contains(0)) {
                      _selectedApplianceIndices.remove(0);
                    } else {
                      _selectedApplianceIndices.add(0);
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: _getButtonBorder(0),
                    color: _getButtonColor(0),
                  ),
                  alignment: Alignment.center,
                  width: 140,
                  height: 43,
                  child: Text(
                    "가스레인지(인덕션)",
                    style: TextStyle(color: _getTextColor(0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedApplianceIndices.contains(1)) {
                        _selectedApplianceIndices.remove(1);
                      } else {
                        _selectedApplianceIndices.add(1);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: _getButtonBorder(1),
                        color: _getButtonColor(1)),
                    alignment: Alignment.center,
                    width: 85,
                    height: 43,
                    child: Text(
                      "전자레인지",
                      style: TextStyle(color: _getTextColor(1)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_selectedApplianceIndices.contains(2)) {
                        _selectedApplianceIndices.remove(2);
                      } else {
                        _selectedApplianceIndices.add(2);
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: _getButtonBorder(2),
                        color: _getButtonColor(2)),
                    alignment: Alignment.center,
                    width: 94,
                    height: 43,
                    child: Text(
                      "에어프라이기",
                      style: TextStyle(color: _getTextColor(2)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      );

  Widget _inputTotalTime() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "소요시간",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(children: [
              SizedBox(
                width: 50,
                height: 30,
                child: TextField(
                  textAlignVertical: TextAlignVertical(y: 1),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "00",
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    filled: true,
                    fillColor: Color(0xffF3F3F3),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  ),
                ),
              ),
              Text(
                "시간",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: 50,
                  height: 30,
                  child: TextField(
                    textAlignVertical: TextAlignVertical(y: 1),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "00",
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Color(0xffF3F3F3),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    ),
                  ),
                ),
              ),
              Text(
                "분",
                style: Theme.of(context).textTheme.displaySmall,
              )
            ]),
          ),
        ],
      );
}
