import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/ingredient/widget/single_button.dart';
import 'package:yum_application/src/ui/recipe/view/recipe_stepper.dart';
import 'package:yum_application/src/ui/recipe/view/stepper_view.dart';
import 'package:yum_application/src/ui/recipe/view/summary_view.dart';

class RecipeRegisterView extends StatefulWidget {
  const RecipeRegisterView({super.key});

  @override
  State<RecipeRegisterView> createState() => _RecipeRegisterViewState();
}

class _RecipeRegisterViewState extends State<RecipeRegisterView> {
  final List<Widget> _steps = List.generate(
      (2), (index) => RecipeStepper(sequence: index + 1),
      growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.0),
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        leading: GestureDetector(
          onTap: Navigator.of(context).pop,
          child: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0.0,
        title: Text(
          "레시피 등록",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: "제목을 입력해 주세요.",
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          _summaryView(),
          _recipeSteps(),
          _buttion()
        ]),
      ),
    );
  }

  Widget _summaryView() => const SummaryView(
        key: Key("recipe resister view summary view"),
      );

  Widget _recipeSteps() => const StepperView(
        key: Key("recipe register view stepper view"),
        initStepperCount: 3,
      );

  Widget _buttion() => SingleButton(
        key: const Key("recipe register view button view"),
        text: "등록하기",
        onTap: () {},
      );
}
