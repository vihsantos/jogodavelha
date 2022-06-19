import 'package:flutter/material.dart';
import 'package:jogodavelha/features/jogo_da_velha/presentation/ui/pages/widgets/responsive.dart';

import '../../controllers/socket_methods.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';
import 'widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
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
                  text: 'Criar Sala',
                  fontSize: 70,
                ),
                SizedBox(height: size.height * 0.08),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Digite seu nickname',
                ),
                SizedBox(height: size.height * 0.045),
                CustomButton(
                    onTap: () => _socketMethods.createRoom(
                          _nameController.text,
                        ),
                    text: 'Criar'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
