import 'package:flutter/material.dart';
import 'package:tokyo_intac/home.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TCU DEMO',
      home: _DropdownButtonDemo(),
    );
  }
}

class _DropdownButtonDemo extends StatefulWidget {
  const _DropdownButtonDemo({Key? key}) : super(key: key);

  @override
  _DropdownButtonDemoState createState() => _DropdownButtonDemoState();
}

class _DropdownButtonDemoState extends State<_DropdownButtonDemo> {
  final Map<String, List<String>> _dropDownMenu = {
    '理工学部': [
      '機械工学科',
      '機械システム工学科',
      '電気電子工学科',
      '医用工学科',
      '応用化学科',
      '原子力安全工学科',
      '自然科学科'
    ],
    '建築学部': ['建築学科', '都市工学科'],
    '情報工学部': [
      '情報科学科',
      '知能情報工学科',
    ],
    '環境学部': [
      '環境創生学科',
      '環境経営システム学科',
    ],
    'メディア情報学部': ['社会メディア学科', '情報システム学科']
  };
  Map<String, String> contry = {
    '機械工学科': '03-5707-0104',
    '機械システム工学科': '03-5707-0104',
    '電気電子工学科': '03-5707-0104',
    '医用工学科': '03-5707-0104',
    '応用化学科': '03-5707-0104',
    '原子力安全工学科': '03-5707-0104',
    '自然科学科': '03-5707-0104',
    '建築学科': '03-5707-0104',
    '都市工学科': '03-5707-0104',
    '情報科学科': '03-5707-0104',
    '知能情報工学科': '03-5707-0104',
    '環境創生学科': '045-910-0104',
    '環境経営システム学科': '045-910-0104',
  };

  String? _selectedKey;
  String? _selectedItem;
  String? _phonenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Image.asset(
              'images/logo.jpg',
              width: 300,
              height: 100,
            ),
            onPressed: () {},
          ),
          title: const Text('TCU DEMO APP'),
          backgroundColor: Colors.white,
          centerTitle: true,
          shape: Border(bottom: BorderSide(color: Colors.black, width: 1))),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                '学部',
                style: TextStyle(fontSize: 24),
              ),
              DropdownButton<String>(
                value: _selectedKey,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 30,
                elevation: 16,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (newValue) {
                  setState(() {
                    _selectedKey = newValue;
                    _selectedItem = null;
                  });
                },
                items: _dropDownMenu.keys
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          _selectedKey != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Text(
                      '学科',
                      style: TextStyle(fontSize: 24),
                    ),
                    DropdownButton<String>(
                      value: _selectedItem,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 30,
                      elevation: 16,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedItem = newValue;
                          _phonenumber = contry['$_selectedItem'];
                        });
                      },
                      items: _dropDownMenu[_selectedKey]!
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 300,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  final url = Uri.parse('tel: $_phonenumber');
                  launchUrl(url);
                },
                child: Text(
                  _phonenumber ?? '学科を選択してください',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          UrlLauncherExample(),
        ],
      ),
    );
  }
}
