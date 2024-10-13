import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:convert';
//import 'package:travel_app/Pages/HomePage_Featurs/Components/Button.dart' as HomePageButton;

class Currency {
  final String code;
  final String imagePath;

  Currency(this.code, this.imagePath);
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({Key? key}) : super(key: key);

  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  String _fromCurrency = "USD";
  String _toCurrency = "LKR";
  double _conversionRate = 0.0;
  double _amount = 0.0;
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  double _convertedAmount = 0.0;

  final List<Currency> _currencies = [
    Currency("USD", "assets/flags/usd.png"),
    Currency("GBP", "assets/flags/gbp.png"),
    Currency("INR", "assets/flags/inr.png"),
    Currency("JPY", "assets/flags/jpy.png"),
    Currency("AUD", "assets/flags/aud.png"),
    Currency("LKR", "assets/flags/lkr.png"),
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_clearOutputOnEmpty);
    _fetchConversionRate();
  }

  @override
  void dispose() {
    _controller.removeListener(_clearOutputOnEmpty);
    _controller.dispose();
    super.dispose();
  }

  void _clearOutputOnEmpty() {
    if (_controller.text.isEmpty) {
      setState(() {
        _convertedAmount = 0.0;
      });
    }
  }

  Future<void> _fetchConversionRate() async {
    setState(() {
      _isLoading = true;
    });

    final String url =
        'https://api.exchangerate-api.com/v4/latest/$_fromCurrency';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _conversionRate = data['rates'][_toCurrency];
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      throw Exception('Failed to load exchange rate');
    }
  }

  void _convert() {
    setState(() {
      _amount = double.tryParse(_controller.text) ?? 0.0;
      _convertedAmount = _amount * _conversionRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdown(
                  _currencies
                      .firstWhere((currency) => currency.code == _fromCurrency),
                  (newValue) {
                    setState(() {
                      _fromCurrency = newValue!.code;
                      _fetchConversionRate();
                    });
                  },
                ),
                const Text("to", style: TextStyle(fontSize: 18)),
                _buildDropdown(
                  _currencies
                      .firstWhere((currency) => currency.code == _toCurrency),
                  (newValue) {
                    setState(() {
                      _toCurrency = newValue!.code;
                      _fetchConversionRate();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildConversionResult(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convert,
              child: Text(
                "Convert",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: Size(150, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(
      Currency selectedCurrency, ValueChanged<Currency?> onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Currency>(
          value: selectedCurrency,
          items: _currencies
              .map((currency) => DropdownMenuItem<Currency>(
                    value: currency,
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.all(8.0), // Add padding here
                          child: Image.asset(
                            currency.imagePath,
                            width: 45,
                          ),
                        ),
                        const SizedBox(
                            width: 5), // Space between image and text
                        Text(currency.code),
                      ],
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildConversionResult() {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color.fromARGB(255, 75, 71, 71)),
      ),
      child: Text(
        _controller.text.isEmpty
            ? ""
            : "${_convertedAmount.toStringAsFixed(2)}",
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}