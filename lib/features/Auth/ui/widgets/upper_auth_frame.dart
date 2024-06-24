import 'package:flutter/cupertino.dart';

class UpperAuthFrame extends StatelessWidget {
  const UpperAuthFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
              child: Image.asset('images/auth_frame_top.png')),
          Image.asset('images/logo_inter2grow.png'),
        ],
      ),
    );
  }
}
