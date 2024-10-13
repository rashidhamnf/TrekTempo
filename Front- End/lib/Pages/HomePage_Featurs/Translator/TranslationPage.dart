import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({Key? key}) : super(key: key);

  @override
  State<TranslatorPage> createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  final inputController = TextEditingController();
  final outputController = TextEditingController();
  final translator = GoogleTranslator();

  String inputLanguage = 'English';
  String outputLanguage = 'Sinhala';

  final Map<String, String> languageCodes = {
    'Sinhala': 'si',
    'Chinese': 'zh-cn',
    'English': 'en',
    'French': 'fr',
    'Hindi': 'hi',
    'Russian': 'ru',
    'Tamil': 'ta',
  };

  Future<void> translateText() async {
    final fromLangCode = languageCodes[inputLanguage] ?? 'en';
    final toLangCode = languageCodes[outputLanguage] ?? 'en';

    try {
      final translated = await translator.translate(
        inputController.text,
        from: fromLangCode,
        to: toLangCode,
      );

      setState(() {
        outputController.text = translated.text;
      });
    } catch (e) {
      setState(() {
        outputController.text = 'Error during translation: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Translator',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: inputController,
                        maxLines: 5,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter text to translate",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete,
                          color: Color.fromARGB(255, 62, 62, 66)),
                      onPressed: () {
                        inputController.clear();
                        outputController.clear(); // Clear the input text field
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Styled Input Language Dropdown
                Container(
                  width: 90, // Set a width to center the dropdown
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.grey, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true, // Expand dropdown to fit the container
                    value: inputLanguage,
                    onChanged: (newValue) {
                      setState(() {
                        inputLanguage = newValue!;
                      });
                    },
                    items: languageCodes.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                            child: Text(value)), // Center the dropdown item
                      );
                    }).toList(),
                    underline: SizedBox(), // Remove underline
                  ),
                ),

                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      final temp = inputLanguage;
                      inputLanguage = outputLanguage;
                      outputLanguage = temp;
                    });
                  },
                  child: Icon(
                    Icons.swap_horiz,
                    color: Colors.white,
                  ),
                  mini: true,
                  backgroundColor: Colors.blueAccent,
                ),

                // Styled Output Language Dropdown
                Container(
                  width: 90, // Set a width to center the dropdown
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.grey, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true, // Expand dropdown to fit the container
                    value: outputLanguage,
                    onChanged: (newValue) {
                      setState(() {
                        outputLanguage = newValue!;
                      });
                    },
                    items: languageCodes.keys
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                            child: Text(value)), // Center the dropdown item
                      );
                    }).toList(),
                    underline: SizedBox(), // Remove underline
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Card(
              color: Colors.white,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: outputController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Result here...",
                      hintStyle: TextStyle(
                        color: Colors.grey, // Change hint text color
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      )),
                  readOnly: true,
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: translateText,
              child: Text(
                "Translate",
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
}
