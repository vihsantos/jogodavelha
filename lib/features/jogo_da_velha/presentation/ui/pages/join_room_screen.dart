import 'package:flutter/material.dart';

import '../../controllers/socket_methods.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';
import 'widgets/custom_textfield.dart';
import 'widgets/responsive.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Responsive(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomText(
                  shadows: [],
                  text: 'Entre na sala',
                  fontSize: 60,
                ),
                SizedBox(height: size.height * 0.08),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Adicione seu nickname',
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _gameIdController,
                  hintText: 'Entre com o seu Game ID',
                ),
                SizedBox(height: size.height * 0.045),
                CustomButton(
                  onTap: () => _socketMethods.joinRoom(
                    _nameController.text,
                    _gameIdController.text,
                  ),
                  text: 'Se juntar',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
