import 'dart:math';

import "package:flutter/material.dart";

class PasswprdGenerator extends StatefulWidget {
  @override
  _PasswordGeneratorState createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswprdGenerator> {
  TextEditingController _textController = new TextEditingController();
  void calculatePassword() {
    if (_bSymbol == false &&
        _bNumber == false &&
        _blowerCase == false &&
        _bupperCase == false) {
    } else {
      String _passText = "";
      int _plength;
      var _bSymbolArr;
      var _bNumberArr;
      var _bLowerCaseArr;
      var _bUpperCaseArr;
      var _pDiff = 0;
      var _trueArr = [];

      // if (passwordLengthDrop == "1") _plength = 4;
      // if (passwordLengthDrop == "2") _plength = 8;
      // if (passwordLengthDrop == "3") _plength = 10;
      // if (passwordLengthDrop == "4") _plength = 16;

      _plength = _passL.toInt();
      _bSymbolArr = (_bSymbol) ? ["!", "@", "#", "\$", "%", "&"] : [];
      _bNumberArr = (_bNumber) ? [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] : [];
      _bLowerCaseArr = (_blowerCase)
          ? [
              'a',
              'b',
              'c',
              'd',
              'e',
              'f',
              'g',
              'h',
              'i',
              'j',
              'k',
              'l',
              'm',
              'n',
              'o',
              'p',
              'q',
              'r',
              's',
              't',
              'u',
              'v',
              'w',
              'x',
              'y',
              'z'
            ]
          : [];
      _bUpperCaseArr = (_bupperCase)
          ? [
              'A',
              'B',
              'C',
              'D',
              'E',
              'F',
              'G',
              'H',
              'I',
              'J',
              'K',
              'L',
              'M',
              'N',
              'O',
              'P',
              'Q',
              'R',
              'S',
              'T',
              'U',
              'V',
              'W',
              'X',
              'Y',
              'Z'
            ]
          : [];
      if ((_bSymbol)) _trueArr.add(_bSymbolArr);
      if ((_bNumber)) _trueArr.add(_bNumberArr);
      if ((_blowerCase)) _trueArr.add(_bLowerCaseArr);
      if ((_bupperCase)) _trueArr.add(_bUpperCaseArr);

      setState(() {
        if (_bSymbol) {
          _passText = _bSymbolArr[new Random().nextInt(_bSymbolArr.length)];
        } else {}
        if (_bNumber) {
          for (int i = 0; i < 1; i++) {
            _passText += _bNumberArr[new Random().nextInt(_bNumberArr.length)]
                .toString();
          }
        }
        if (_blowerCase) {
          for (int i = 0; i < 1; i++) {
            _passText +=
                _bLowerCaseArr[new Random().nextInt(_bLowerCaseArr.length)]
                    .toString();
          }
        }
        if (_bupperCase) {
          for (int i = 0; i < 1; i++) {
            _passText +=
                _bUpperCaseArr[new Random().nextInt(_bUpperCaseArr.length)]
                    .toString();
          }
        }
        if (_plength != _passText.length) {
          _pDiff = _plength - _passText.length;
        }
        for (var i = 0; i < _pDiff; i++) {
          try {
            int _trueArrIndex = Random().nextInt(_trueArr.length);
            String _trueArrStr = _trueArr[_trueArrIndex]
                    [Random().nextInt(_trueArr[_trueArrIndex].length)]
                .toString();
            _passText += _trueArrStr;
          } catch (e) {}
        }
        var _passTextArr = _passText.split('');
        for (var i = 0; i < Random().nextInt(10); i++) {
          var j = Random().nextInt(_passTextArr.length);
          var k = Random().nextInt(_passTextArr.length);
          var _ptemp = _passTextArr[j];
          _passTextArr[j] = _passTextArr[k];
          _passTextArr[k] = _ptemp;
        }
        _passText = _passTextArr.join('');
        _textController.text = _passText.toString();
      });
    }
  }

  void errorDisplay() {
    setState(() {
      if (_bSymbol == false &&
          _bNumber == false &&
          _blowerCase == false &&
          _bupperCase == false)
        _showError = true;
      else {
        _showError = false;
      }
    });
  }

  void initState() {
    super.initState();
    calculatePassword();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        SizedBox(height: 50),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _textController,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 10),
            onChanged: (str) {
              setState(() {
                _textController.text = str;
              });
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
              margin: EdgeInsets.only(top: 50, left: 0),
              child: optionsWidget()),
        ),
        Expanded(
            flex: 1,
            child: Center(
              child: RaisedButton(
                elevation: 10,
                color: Colors.green,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width - 200,
                  child: Text(
                    "Generate",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                onPressed: () {
                  calculatePassword();
                },
              ),
            ))
      ]),
    );
  }

  double _passL = 8;
  //String passwordLengthDrop = "2";
  bool _bSymbol = false;
  bool _bNumber = false;
  bool _blowerCase = true;
  bool _bupperCase = false;

  // DropdownButton _normalDown() => DropdownButton<String>(
  //       items: [
  //         DropdownMenuItem(
  //           value: "1",
  //           child: Container(
  //             width: 100,
  //             child: Text(
  //               "4",
  //             ),
  //           ),
  //         ),
  //         DropdownMenuItem(
  //           value: "2",
  //           child: Text(
  //             "8",
  //           ),
  //         ),
  //         DropdownMenuItem(
  //           value: "3",
  //           child: Text(
  //             "10",
  //           ),
  //         ),
  //         DropdownMenuItem(
  //           value: "4",
  //           child: Text(
  //             "16",
  //           ),
  //         ),
  //       ],
  //       onChanged: (value) {
  //         setState(() {
  //           passwordLengthDrop = value;
  //         });
  //       },
  //       value: passwordLengthDrop,
  //     );
  bool _showError = false;
  Widget optionsWidget() {
    return ListView(
      children: [
        passwordLength(),
        symbols(),
        numbers(),
        lowerCase(),
        upperCase(),
        SizedBox(height: 20),
        (_showError)
            ? Text(
                "---   Select at least one option.   ---",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : Text(""),
      ],
    );
  }

  Widget passwordLength() {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(left: 25),
        child: Text(
          "Password Length : " + _passL.toInt().toString(),
          textAlign: TextAlign.left,
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: Slider(
            value: _passL,
            max: 24,
            min: 4,
            label: _passL.toString(),
            divisions: 10,
            onChanged: (val) {
              setState(() {
                _passL = val;
              });
            }),
      ),
    ]);
  }

  Widget symbols() {
    return Row(children: [
      Checkbox(
        value: _bSymbol,
        onChanged: (value) {
          setState(() {
            _bSymbol = value;
            errorDisplay();
          });
        },
      ),
      Text("Include Symbols, ( e.g. @#\$% )")
    ]);
  }

  Widget numbers() {
    return Row(children: [
      Checkbox(
        value: _bNumber,
        onChanged: (value) {
          setState(() {
            _bNumber = value;
            errorDisplay();
          });
        },
      ),
      Text("Include Numbers, ( e.g. 123456 ) ")
    ]);
  }

  Widget lowerCase() {
    return Row(children: [
      Checkbox(
        value: _blowerCase,
        onChanged: (value) {
          setState(() {
            _blowerCase = value;
            errorDisplay();
          });
        },
      ),
      Text("Include Lowercase Characters, ( e.g. abcdefgh ) ")
    ]);
  }

  Widget upperCase() {
    return Row(children: [
      Checkbox(
        value: _bupperCase,
        onChanged: (value) {
          setState(() {
            _bupperCase = value;
            errorDisplay();
          });
        },
      ),
      Text("Include UpperCase Characters, ( e.g. ABCDEFGH ) ")
    ]);
  }
}
