import 'package:flutter/material.dart';

abstract class SelectIngredientWidget extends StatelessWidget {
  const SelectIngredientWidget({super.key});

  Widget _customContainer(String text) => Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Builder(builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                border: Border.all(color: Color(0xff362703))),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Icon(Icons.close),
              ],
            ),
          );
        }),
      );
}
