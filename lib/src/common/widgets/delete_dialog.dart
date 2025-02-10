import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Center(
        child: Text(
          '정말 삭제하시겠습니까?',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    width: 106,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(46),
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        '취소',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 106,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(46),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirm();
                    },
                    child: Text(
                      "삭제",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
