import 'package:flutter/material.dart';

class DropdownCalculator extends StatefulWidget {
  final void Function(int)? onFormulaIndexChanged;
  final void Function(int)? onCalculatorIndexChanged; // Define the callback

  DropdownCalculator({
    required this.onFormulaIndexChanged,
    required this.onCalculatorIndexChanged,
  });

  @override
  State<DropdownCalculator> createState() => _DropdownCalculatorState();
}

class _DropdownCalculatorState extends State<DropdownCalculator> {
  String calculatorDropdownValue = "FX570Ex";
  final List<String> calculatorDropdownItems = ['FX570Ex', 'FX570MS'];

  String formulaDropdownValue = "Factorization";
  final List<String> formulaDropdownItems = ['Factorization', 'Power Of'];

  int formulaIndex = 0;
  int calculatorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          // calculator dropdown menu
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Color(0xFFE8E8E8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton(
                borderRadius: BorderRadius.circular(10),
                itemHeight: 50,
                value: calculatorDropdownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                items: calculatorDropdownItems.map(
                  (String list) {
                    return DropdownMenuItem(
                      value: list,
                      child: Text(list),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    calculatorDropdownValue = newValue!;
                    calculatorIndex = calculatorDropdownItems.indexOf(newValue);
                    if (widget.onCalculatorIndexChanged != null) {
                      widget.onCalculatorIndexChanged!(calculatorIndex);
                    }
                  });
                },
              ),
            ),
          ),

          // formula dropdown menu
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Color(0xFFE8E8E8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: DropdownButton(
              borderRadius: BorderRadius.circular(10),
              itemHeight: 50,
              value: formulaDropdownValue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: formulaDropdownItems.map(
                (String list) {
                  return DropdownMenuItem(
                    value: list,
                    child: Text(list),
                  );
                },
              ).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  formulaDropdownValue = newValue!;
                  formulaIndex = formulaDropdownItems.indexOf(newValue);
                  if (widget.onFormulaIndexChanged != null) {
                    widget.onFormulaIndexChanged!(formulaIndex);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
