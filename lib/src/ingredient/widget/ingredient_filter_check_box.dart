import 'package:flutter/material.dart';

class IngredientFilterCheckBox extends StatefulWidget {
  /// [value] 로 초기 위젯의 상태값을 지정할 수 있습니다.
  final bool value;

  /// [label]을 지정하면 위젯의 label을 [CheckBoxWidget] 오른쪽에 배치할 수 있습니다.
  final String label;

  /// [onChanged]는 [value]값을 변경할 수 있도록 동작하는 메소드를 전달할 수 있습니다.
  final ValueSetter<bool> onChanged;
  const IngredientFilterCheckBox(
      {super.key,
      required this.value,
      required this.label,
      required this.onChanged});

  @override
  State<IngredientFilterCheckBox> createState() =>
      _IngredientFilterCheckBoxState();
}

class _IngredientFilterCheckBoxState extends State<IngredientFilterCheckBox> {
  late bool _isChecked;

  void _toggle() => setState(() {
        _isChecked = !_isChecked;
      });

  @override
  void initState() {
    _isChecked = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      _basicBox(),
      Text(
        widget.label,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    ]);
  }

  /// 기본 테두리 위젯
  Widget _basicBox() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: GestureDetector(
          key: const Key("ingredient-filter-check-box-toggle-tap"),
          onTap: () {
            widget.onChanged(!widget.value);
            _toggle();
          },
          child: SizedBox(
            width: 20,
            height: 20,
            child: (_isChecked) ? _checkedBox() : _unCheckedBox(),
          ),
        ),
      );

  /// [value == true]인 경우 반환되는 위젯
  Widget _checkedBox() => Builder(builder: (context) {
        return Container(
          key: const Key("ingredient-filter-on-check-box"),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Theme.of(context).colorScheme.secondary),
          child: const Icon(
            Icons.check,
            size: 12,
            color: Color(0xffffffff),
          ),
        );
      });

  /// [value == false]인 경우 반환되는 위젯
  Widget _unCheckedBox() => Container(
        key: const Key("ingredient-filter-off-check-box"),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(width: 1, color: const Color(0xffa2a2a2))),
      );
}
