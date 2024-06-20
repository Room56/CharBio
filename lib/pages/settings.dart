import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _language = 'English';

  void _changeLanguage() async {
    String? selectedLanguage = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return LanguageSelection(
          selectedLanguage: _language,
        );
      },
    );

    if (selectedLanguage != null && selectedLanguage != _language) {
      setState(() {
        _language = selectedLanguage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/characters');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.language, color: Colors.grey[700]),
              title: Text('Language'),
              trailing: Text(
                _language,
                style: TextStyle(color: Colors.grey[700]),
              ),
              onTap: _changeLanguage,
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelection extends StatelessWidget {
  final String selectedLanguage;

  LanguageSelection({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose language',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Русский'),
            selected: selectedLanguage == 'Русский',
            onTap: () {
              Navigator.pop(context, 'Русский');
            },
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('English'),
            selected: selectedLanguage == 'English',
            onTap: () {
              Navigator.pop(context, 'English');
            },
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.0),
            ),
            child: Text('Choose'),
          ),
        ],
      ),
    );
  }
}
