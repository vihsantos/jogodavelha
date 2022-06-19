import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_routers.dart';
import 'features/jogo_da_velha/presentation/controllers/room_data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jogo da Velha',
        onGenerateRoute: AppRouters.generateRoute,
        initialRoute: mainMenuRoute,
      ),
    );
  }
}
