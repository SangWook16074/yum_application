import 'package:flutter/material.dart';
import 'package:yum_application/src/ui/ingredient/widget/single_button.dart';
import 'package:yum_application/src/ui/recipe/view/recipe_stepper.dart';

class StepperView extends StatefulWidget {
  final int initStepperCount;
  final void Function()? onTap;
  const StepperView({super.key, required this.initStepperCount, this.onTap});

  @override
  State<StepperView> createState() => _StepperViewState();
}

class _StepperViewState extends State<StepperView> {
  List<RecipeStepper> _steppers = List.empty(growable: true);

  void _generateRecipeStepper() {
    final newStepper = RecipeStepper(sequence: _steppers.length + 1);
    setState(() {
      _steppers.add(newStepper);
    });
  }

  @override
  void initState() {
    _steppers = List.generate(
        widget.initStepperCount, (index) => RecipeStepper(sequence: index + 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ..._steppers,
        _addButton(),
      ],
    );
  }

  Widget _addButton() {
    return Padding(
        key: const Key("Stepper View Button"),
        padding: const EdgeInsets.only(top: 24.0, bottom: 10.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width - 35, 40),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ),
          onPressed: _generateRecipeStepper,
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.grey,
          ),
        ));
  }
}
