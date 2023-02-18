import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CricketPlayer {
  final String name;
  final int matchesPlayed;
  final int runsMade;

  CricketPlayer({required this.name, required this.matchesPlayed, required this.runsMade});
}

class CricketPlayerProvider with ChangeNotifier {
  String _name = '';
  int _matchesPlayed = 0;
  int _runsMade = 0;

  String get name => _name;
  int get matchesPlayed => _matchesPlayed;
  int get runsMade => _runsMade;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setMatchesPlayed(String matchesPlayed) {
    _matchesPlayed = int.parse(matchesPlayed);
    notifyListeners();
  }

  void setRunsMade(String runsMade) {
    _runsMade = int.parse(runsMade);
    notifyListeners();
  }

  void reset() {
    _name = '';
    _matchesPlayed = 0;
    _runsMade = 0;
    notifyListeners();
  }
}

class CricketPlayerForm extends StatefulWidget {
  @override
  _CricketPlayerFormState createState() => _CricketPlayerFormState();
}

class _CricketPlayerFormState extends State<CricketPlayerForm> {
  final _nameController = TextEditingController();
  final _matchesPlayedController = TextEditingController();
  final _runsMadeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _matchesPlayedController.dispose();
    _runsMadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CricketPlayerProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Cricket Player'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  Provider.of<CricketPlayerProvider>(context, listen: false).setName(value);
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _matchesPlayedController,
                decoration: InputDecoration(
                  labelText: 'Matches Played',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  Provider.of<CricketPlayerProvider>(context, listen: false).setMatchesPlayed(value);
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _runsMadeController,
                decoration: InputDecoration(
                  labelText: 'Runs Made',
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  Provider.of<CricketPlayerProvider>(context, listen: false).setRunsMade(value);
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final provider = Provider.of<CricketPlayerProvider>(context, listen: false);
            final player = CricketPlayer(
              name: provider.name,
              matchesPlayed: provider.matchesPlayed,
              runsMade: provider.runsMade,
            );
            // Do something with the player data, e.g. save it to a database
            print('${provider.name}\n${provider.matchesPlayed}\n${provider.runsMade}');
            provider.reset();
          },
          child: Icon(Icons.save),
        ),
      ),
    );
  }
}
