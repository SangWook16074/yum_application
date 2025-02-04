import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({super.key});

  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  List<TextField> _ingredientsInputFields = List.empty(growable: true);

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
      style: Theme.of(context).textTheme.labelMedium,
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
              _inputTotalTime(),
            ],
          ),
        ));
  }

  Widget _header() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Text(
          "레시피 한눈에 작성하기",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );

  Widget _inputAmount() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "레시피 양",
              style: Theme.of(context).textTheme.headlineSmall,
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
                        hintStyle: TextStyle(
                            color:
                                Theme.of(context).colorScheme.surfaceContainer),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.tertiary,
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
                  style: Theme.of(context).textTheme.bodyMedium,
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
                  style: Theme.of(context).textTheme.headlineSmall,
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

  Widget _inputTotalTime() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Text(
              "소요시간",
              style: Theme.of(context).textTheme.headlineSmall,
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
                        color: Theme.of(context).colorScheme.surfaceContainer),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.tertiary,
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
                style: Theme.of(context).textTheme.bodyMedium,
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
                      hintStyle: TextStyle(
                          color:
                              Theme.of(context).colorScheme.surfaceContainer),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.tertiary,
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
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ]),
          ),
        ],
      );
}
