import 'package:flutter/material.dart';

class ReviewKeywordContainer extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Function(bool) onSelected;

  const ReviewKeywordContainer(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onSelected});

  @override
  State<ReviewKeywordContainer> createState() => _ReviewKeywordContainerState();
}

class _ReviewKeywordContainerState extends State<ReviewKeywordContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(!widget.isSelected);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 40,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _getButtonColor(widget.isSelected),
            border: _getButtonBorder(widget.isSelected),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: Text(
              widget.text,
              style: TextStyle(
                color: _getTextColor(widget.isSelected),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  // 버튼 배경색
  Color _getButtonColor(bool isSelected) {
    return isSelected ? Color(0xffFFB300) : Colors.white;
  }

  // 텍스트 색상
  Color _getTextColor(bool isSelected) {
    return isSelected ? Colors.white : Color(0xffA2A2A2);
  }

  // 테두리 유무
  Border _getButtonBorder(bool isSelected) {
    return isSelected
        ? Border.all(color: Colors.transparent)
        : Border.all(color: Color(0xffd7d7d7), width: 1.0);
  }
}
