import 'package:flutter/material.dart';

import 'leaderboard_model.dart';

class LeaderboardPage extends StatelessWidget {
  final List<Participant> participants;

  LeaderboardPage({required this.participants});

  @override
  Widget build(BuildContext context) {
    participants.sort((a, b) => b.score.compareTo(a.score));

    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: participants.length,
        itemBuilder: (context, index) {
          final participant = participants[index];
          return ListTile(
            leading: Text('#${index + 1}', style: TextStyle(fontSize: 20)),
            title: Text(participant.name),
            trailing: Text('${participant.score} points'),
          );
        },
      ),
    );
  }
}
