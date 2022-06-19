import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/room_data_provider.dart';
import '../../controllers/socket_methods.dart';
import 'widgets/scoreboard.dart';
import 'widgets/tictactoe_board.dart';
import 'widgets/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: roomDataProvider.roomData['isJoin']
            ? const WaitingLobby()
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Scoreboard(),
                    const TicTacToeBoard(),
                    Text(
                        '${roomDataProvider.roomData['turn']['nickname']}\'s vez'),
                  ],
                ),
              ),
      ),
    );
  }
}
