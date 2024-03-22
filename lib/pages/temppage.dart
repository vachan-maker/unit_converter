import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  const TempPage({super.key});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  String selectedValue = "Celcius";
  String toUnit = "Kelvin";
  double inputValue = 0.0;
  double convertedValue = 0.0;
  final _textController = TextEditingController();
  final _outTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          _inputTextField(),
          _inputTempUnit(),
          _outputTextField(),
          _outputTempUnit(),
          FilledButton.tonal(
              onPressed: () {
                _convert();
                _outTextController.text = convertedValue.toString();
              },
              child: Text('Submit'))
        ],
      ),
    ));
  }

  TextField _inputTextField() {
    return TextField(
      controller: _textController,
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        labelText: "Temperature",
      ),
      onChanged: (String value) {
        setState(() {
          inputValue = double.parse(_textController.text);
        });
      },
    );
  }

  TextField _outputTextField() {
    return TextField(
      controller: _outTextController,
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(labelText: "Result"),
    );
  }

  DropdownButton<String> _inputTempUnit() {
    return DropdownButton<String>(
      value: selectedValue,
      items: <String>["Celcius", "Farenheit", "Kelvin"].map((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
    );
  }

  DropdownButton<String> _outputTempUnit() {
    return DropdownButton<String>(
      value: toUnit,
      items: <String>["Celcius", "Farenheit", "Kelvin"].map((String value) {
        return DropdownMenuItem(value: value, child: Text(value));
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          toUnit = newValue!;
        });
      },
    );
  }

  void _convert() {
    if (selectedValue == 'Celcius' && toUnit == 'Kelvin') {
      convertedValue = 273.15 + inputValue;
    } else if (selectedValue == 'Kelvin' && toUnit == 'Celcius') {
      convertedValue = inputValue - 273.15;
    } else if (selectedValue == 'Celcius' && toUnit == 'Farenheit') {
      convertedValue = (9 / 5 * inputValue) + 32;
    } else if (selectedValue == 'Farenheit' && toUnit == 'Celcius') {
      convertedValue = (inputValue - 32) * 5 / 9;
    } else if (selectedValue == 'Farenheit' && toUnit == 'Kelvin') {
      convertedValue = ((inputValue - 32) * 5 / 9) + 273.15;
    } else if (selectedValue == 'Kelvin' && toUnit == 'Farenheit') {
      convertedValue = ((inputValue - 273.15) * 9 / 5) + 32;
    }
  }
}
