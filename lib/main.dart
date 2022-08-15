import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCurrencyConvertor(),
    );
  }
}

class MyCurrencyConvertor extends StatefulWidget {
  const MyCurrencyConvertor({Key? key}) : super(key: key);

  @override
  State<MyCurrencyConvertor> createState() => _MyCurrencyConvertorState();
}

class _MyCurrencyConvertorState extends State<MyCurrencyConvertor> {
  final TextEditingController _value1 = TextEditingController();
  final TextEditingController _value2 = TextEditingController();
  //TextEditingController _amount = TextEditingController();
  double calculate =0;
  double result =0;
  String convert ='ILS';
  String convert1 = 'USD';
  String _amount = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Currency Convertor',
          style: GoogleFonts.poppins(
            color: const Color(0xFF192965),
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF0EFEF),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: _value1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.attach_money),
                filled: true,
                fillColor: const Color(0xFFBBCFFF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _value2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.currency_exchange),
                filled: true,
                fillColor: const Color(0xFFBBCFFF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(300),
                  gradient : const LinearGradient(
                    begin: AlignmentDirectional.topCenter,
                    end: AlignmentDirectional.bottomCenter,
                    colors:[
                      Color(0xFFBBCFFF),
                      Color(0xFFFED1EF),
                    ],
                  ),
              ),
              child: MaterialButton(
                onPressed:() {
                  if (convert == 'ILS' && convert1 == 'USD') {
                    calculate = int.parse(_value1.text) * 3.50;
                    result = calculate;
                    _value2.text = result.toString();
                  }
                  else if (convert == 'USD' && convert1 == 'ILS') {
                    calculate = int.parse(_value1.text) / 3.50;
                    result = calculate;
                    _value2.text = result.toString();
                  }
                  setState((){
                    _amount = calculate as String;
                  });
                },
                child: Text(
                  'Convert',
                  style: GoogleFonts.cabin(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
           // TextField(
           //   controller: _amount,
           //   keyboardType: TextInputType.number,
           //   decoration: InputDecoration(
           //     prefixIcon: const Icon(Icons.monetization_on_rounded),
           //     filled: true,
           //     fillColor: const Color(0xFFBBCFFF),
           //     border: OutlineInputBorder(
           //       borderRadius: BorderRadius.circular(5),
           //     ),
           //     //
           //     // hintText: 'Enter the currency ',
           //   ),
           // ),
            Text(
              _amount,
              style: GoogleFonts.cabin(
                fontSize: 26,
              ),
            )
        ],
    ),
      ),
    );
  }
}