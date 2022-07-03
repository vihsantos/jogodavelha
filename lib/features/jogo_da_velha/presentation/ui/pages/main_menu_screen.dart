import 'package:flutter/material.dart';
import 'package:jogodavelha/core/utils/app_routers.dart';

import 'widgets/custom_button.dart';
import 'widgets/responsive.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, createRoomRoute);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, joinRoomRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Responsive(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButton(
                  onTap: () => createRoom(context),
                  text: 'Criar Sala',
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomButton(
                  onTap: () => joinRoom(context),
                  text: 'Entrar na sala',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
