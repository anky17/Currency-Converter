import 'package:flutter/material.dart';

// Steps:-
// 1. Create a vareiable that stores the converted currency value
// 2. Create a function that multiplies the value given by the textfield
// 3. Store the value in the variable that we created
// 4. Display the variable

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(5),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 207, 162),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 222, 206, 160),
        title: const Text('Currency Converter'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: 'Times New Roman',
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w900,
          fontSize: 25,
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "NPR ${result != 0 ? result.toStringAsFixed(4) : result.toStringAsFixed(0)}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Please enter amount in USD',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                  contentPadding: const EdgeInsets.all(10),
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * 131;
                  });
                },
                style: ElevatedButton.styleFrom(
                  elevation: (10),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
