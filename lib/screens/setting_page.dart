import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cache_music_player/models/data_provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _dataSaverMode = "Automatic";

  bool? _isNotificationAllowed = true;
  bool _isOfflineModeOn = false;
  bool _isNormalizeVolumeOn = false;
  bool _isMonoAudioOn = false;

  String _username = "";
  String _email = "";
  DateTime _birthDate = DateTime(1990, 1, 1);

  void _toggleDataSaver(value) {
    setState(() {
      _dataSaverMode = value;
    });
  }

  void _toggleNotification(bool? value) {
    setState(() {
      _isNotificationAllowed = value;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);
    final loggedInUser = provider.getLoggedInUser();

    _username = loggedInUser?.username ?? "";
    _email = loggedInUser?.email ?? "";

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Account',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Username'),
            subtitle: Text(_username),
            onTap: () {},
          ),
          ListTile(
            title: Text('Email'),
            subtitle: Text(_email),
            onTap: () {},
          ),
          ListTile(
            title: Text('Birth Date'),
            subtitle: Text(
                '${_birthDate.day}/${_birthDate.month}/${_birthDate.year}'),
            onTap: () {
              _selectDate(context);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Data Saver',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          RadioListTile(
            title: Text("On"),
            value: "On",
            groupValue: _dataSaverMode,
            onChanged: _toggleDataSaver,
          ),
          RadioListTile(
            title: Text("Automatic"),
            value: "Automatic",
            groupValue: _dataSaverMode,
            onChanged: _toggleDataSaver,
          ),
          RadioListTile(
            title: Text("Off"),
            value: "Off",
            groupValue: _dataSaverMode,
            onChanged: _toggleDataSaver,
          ),
          SizedBox(height: 20),
          Text(
            'Notification Setting',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Allow Notifications'),
            trailing: Checkbox(
              value: _isNotificationAllowed,
              onChanged: _toggleNotification,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Playback Settings',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('Offline Mode'),
            subtitle: Text(
                "When you go offline, you'll only be able to play the music you've downloaded"),
            trailing: Switch(
              value: _isOfflineModeOn,
              onChanged: (value) {
                setState(() {
                  _isOfflineModeOn = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Normalize Volume'),
            subtitle: Text('Set the same volume level for all tracks'),
            trailing: Switch(
              value: _isNormalizeVolumeOn,
              onChanged: (value) {
                setState(() {
                  _isNormalizeVolumeOn = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text('Mono Audio'),
            subtitle:
                Text('Makes the left and right speakers play the same audio'),
            trailing: Switch(
              value: _isMonoAudioOn,
              onChanged: (value) {
                setState(() {
                  _isMonoAudioOn = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
