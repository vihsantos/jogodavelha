import 'package:flutter/material.dart';
import 'package:jogodavelha/features/jogo_da_velha/presentation/ui/pages/create_room_screen.dart';
import 'package:jogodavelha/features/jogo_da_velha/presentation/ui/pages/game_screen.dart';
import 'package:jogodavelha/features/jogo_da_velha/presentation/ui/pages/join_room_screen.dart';

import '../../features/jogo_da_velha/presentation/ui/pages/main_menu_screen.dart';

const String mainMenuRoute = '/main-menu';
const String joinRoomRoute = '/join-room';
const String createRoomRoute = '/create-room';
const String roomRoute = '/game';

class AppRouters {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments; // getting args

    switch (settings.name) {
      case mainMenuRoute:
        return MaterialPageRoute(builder: (_) => const MainMenuScreen());

      case joinRoomRoute:
        return MaterialPageRoute(builder: (_) => const JoinRoomScreen());

      case createRoomRoute:
        return MaterialPageRoute(builder: (_) => const CreateRoomScreen());

      case roomRoute:
        return MaterialPageRoute(builder: (_) => const GameScreen());

      default:
        return MaterialPageRoute(builder: (_) => const MainMenuScreen());
    }
  }
}
