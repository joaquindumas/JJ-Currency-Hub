import 'package:currency_converter/functions/fetchrates.dart';
import 'package:flutter/material.dart';

class PhptoAny extends StatefulWidget {
  final rates;
  final Map currencies;
  const PhptoAny({Key? key, required this.currencies, required this.rates})
      : super(key: key);

  @override
  State<PhptoAny> createState() => _PhptoAnyState();
}

class _PhptoAnyState extends State<PhptoAny> {
  TextEditingController phpController = TextEditingController();
  String dropdownvalue = 'USD';
  String answer = 'Converted Currency will be shown here';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Card(
      margin: EdgeInsets.symmetric(vertical:20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Convert PHP',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            SizedBox(height: 10),
            TextFormField(
              key: ValueKey('PHP'),
              controller: phpController,
              decoration: InputDecoration(hintText: 'Enter PHP'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: DropdownButton<String>(
                      value: dropdownvalue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: Colors.grey.shade400,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                      items: widget.currencies.keys
                          .toSet()
                          .toList()
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
                SizedBox(height: 10),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        answer = phpController.text +
                            ' PHP =' +
                            convertphp(widget.rates, phpController.text,
                                dropdownvalue) +
                            ' ' +
                            dropdownvalue;
                      });
                    },
                    child: Text('Convert'),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 10),
            Container(
              child: Text(answer),
            )
          ],
        ),
      ),
    );
  }
}
