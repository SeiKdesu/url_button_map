import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherExample extends StatelessWidget {
  // const HomePage({super.key});
  UrlLauncherExample({Key? key}) : super(key: key);
  final _urlLaunchWithUriButton = UrlLaunchWithStringButton();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // DropdownButtonMenu(),
        // _DropdownButtonDemo(),
        Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(),
                      icon: Icon(Icons.local_hospital),
                      label: const Text(
                        'ポータルサイトへ',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _urlLaunchWithUriButton.launchUrlWithUri(context);
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 150,
                  height: 100,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(),
                      icon: Icon(Icons.phone_paused),
                      label: const Text(
                        'webclass',
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      ),
                      onPressed: () {
                        _urlLaunchWithUriButton.launchUrlWithUri1(context);
                      }),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(),
                      icon: Icon(Icons.safety_check),
                      label: const Text(
                        '教育支援センター',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onPressed: () {
                        _urlLaunchWithUriButton.launchUrlWithUri2(context);
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 150,
                  height: 100,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(),
                      icon: Icon(Icons.phone_android),
                      label: const Text(
                        'outlook',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      onPressed: () {
                        _urlLaunchWithUriButton.launchUrlWithUri3(context);
                      }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UrlLaunchWithStringButton {
  final Uri _flutterUrl =
      Uri.parse('https://portal.off.tcu.ac.jp/OldIndex.aspx');
  final Uri _flutterUrl1 =
      Uri.parse('https://webclass.tcu.ac.jp/webclass/?acs_=ed19018a');
  final Uri _flutterUrl2 = Uri.parse('https://www.asc.tcu.ac.jp/');
  final Uri _flutterUrl3 = Uri.parse('https://outlook.office.com/mail/');
  final alertSnackBar = SnackBar(
    content: const Text('このURLは開けませんでした'),
    action: SnackBarAction(
      label: '戻る',
      onPressed: () {},
    ),
  );
  Future<void> launchUrlWithUri(BuildContext context) async {
    if (!await launchUrl(
      _flutterUrl,
    )) {
      alertSnackBar;
      ScaffoldMessenger.of(context).showSnackBar(alertSnackBar);
    }
  }

  Future<void> launchUrlWithUri1(BuildContext context1) async {
    if (!await launchUrl(
      _flutterUrl1,
    )) {
      alertSnackBar;
      ScaffoldMessenger.of(context1).showSnackBar(alertSnackBar);
    }
  }

  Future<void> launchUrlWithUri2(BuildContext context2) async {
    if (!await launchUrl(
      _flutterUrl2,
    )) {
      alertSnackBar;
      ScaffoldMessenger.of(context2).showSnackBar(alertSnackBar);
    }
  }

  Future<void> launchUrlWithUri3(BuildContext context3) async {
    if (!await launchUrl(
      _flutterUrl3,
    )) {
      alertSnackBar;
      ScaffoldMessenger.of(context3).showSnackBar(alertSnackBar);
    }
  }
}

// class DropdownButtonMenu extends StatefulWidget {
//   const DropdownButtonMenu({Key? key}) : super(key: key);

//   @override
//   State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
// }

// class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
//   String isSelectedValue = 'country';

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//       items: const [
//         DropdownMenuItem(
//           value: 'country',
//           child: Text('国名を選択'),
//         ),
//         DropdownMenuItem(
//           value: 'い',
//           child: Text('アメリカ'),
//         ),
//         DropdownMenuItem(
//           value: 'う',
//           child: Text('ハワイ'),
//         ),
//         DropdownMenuItem(
//           value: 'え',
//           child: Text('グアム'),
//         ),
//         DropdownMenuItem(
//           value: 'お',
//           child: Text('サイパン'),
//         ),
//       ],
//       value: isSelectedValue,
//       onChanged: (String? value) {
//         setState(() {
//           isSelectedValue = value!;
//         });
//       },
//     );
//   }
// }
class _DropdownButtonDemo extends StatefulWidget {
  const _DropdownButtonDemo({Key? key}) : super(key: key);

  @override
  _DropdownButtonDemoState createState() => _DropdownButtonDemoState();
}

class _DropdownButtonDemoState extends State<_DropdownButtonDemo> {
  final Map<String, List<String>> _dropDownMenu = {
    'Study': ['Math', 'English', 'Japanese'],
    'Workout': ['Shoulder', 'Chest', 'Back'],
    'Coding': ['Flutter', 'Python', 'C#']
  };

  String? _selectedKey;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedKey,
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
          _selectedKey = newValue;
        });
      },
      items: _dropDownMenu.keys.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
