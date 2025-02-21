import 'package:flutter/material.dart';

class UserInfoEditButton extends StatelessWidget {
  final Function() onTap;
  const UserInfoEditButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: const Color(0xffa2a2a2)),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        "회원정보 수정",
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
