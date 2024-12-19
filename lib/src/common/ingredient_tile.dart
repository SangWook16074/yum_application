import 'package:flutter/material.dart';
import 'package:yum_application/src/data/ingredient/model/ingredient.dart';

class IngredientTile extends StatelessWidget {
  final Ingredient ingredient;
  final void Function()? onTap;
  const IngredientTile({
    super.key,
    required this.ingredient,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ingredient.image,
              Text(ingredient.name,
                  style: Theme.of(context).textTheme.displaySmall)
            ],
          ),
          Positioned(
            top: 2.0,
            right: 2.0,
            child: GestureDetector(
                onTap: onTap,
                child: (ingredient.isFavorite)
                    ? const Icon(
                        Icons.favorite,
                        color: Color(0xffF5713E),
                      )
                    : Icon(
                        Icons.favorite_outline,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      )),
          )
        ],
      ),
    );
  }
}
