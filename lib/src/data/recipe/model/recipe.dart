class Ingredient {
  final String name;
  final String ea;

  Ingredient({required this.name, required this.ea});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(name: json['name'], ea: json['ea']);
  }
  Map<String, dynamic> toJson() => {'name': name, 'ea': ea};
}

class Steps {
  final String text;
  final String? imageUrl;

  Steps({required this.text, required this.imageUrl});
  factory Steps.fromJson(Map<String, dynamic> json) {
    return Steps(text: json['text'], imageUrl: json['image_url']);
  }

  Map<String, dynamic> toJson() => {'text': text, 'image_url': imageUrl};
}

class Recipe {
  final String id;
  final String name;
  final String description;
  final String amount;
  final String cookTime;
  final String imageUrl;
  final List<Ingredient> ingredient;
  final List<Steps> steps;

  Recipe(
      {required this.id,
      required this.name,
      required this.description,
      required this.amount,
      required this.cookTime,
      required this.imageUrl,
      required this.ingredient,
      required this.steps});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final ingredientList = List<Map<String, dynamic>>.from(json['ingredients']);
    final stepsList = List<Map<String, dynamic>>.from(json['steps']);

    return Recipe(
        id: json['id'],
        name: json['title'],
        description: json['description'],
        amount: json['amount'],
        cookTime: json['cook_time'],
        imageUrl: json['image_url'],
        ingredient:
            ingredientList.map((item) => Ingredient.fromJson(item)).toList(),
        steps: stepsList.map((item) => Steps.fromJson(item)).toList());
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "amount": amount,
        "cook_time": cookTime,
        "image_url": imageUrl,
        "ingredient": ingredient.map((item) => item.toJson()).toList(),
        "steps": steps.map((item) => item.toJson()).toList()
      };
}

class CursorPaginationMeta {
  final int page;
  final int size;

  CursorPaginationMeta({required this.page, required this.size});

  factory CursorPaginationMeta.fromJson(Map<String, dynamic> json) {
    return CursorPaginationMeta(page: json['page'], size: json['size']);
  }
}

class RecipeResponse {
  final List<Recipe> recipes;
  final CursorPaginationMeta meta;

  RecipeResponse({required this.recipes, required this.meta});

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    var recipesJson = json['recipes'] as List;
    List<Recipe> recipesList =
        recipesJson.map((recipe) => Recipe.fromJson(recipe)).toList();

    return RecipeResponse(
      recipes: recipesList,
      meta: CursorPaginationMeta.fromJson(json['meta']),
    );
  }
}
