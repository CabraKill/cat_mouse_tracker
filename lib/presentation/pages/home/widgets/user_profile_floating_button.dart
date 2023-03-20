import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileFloatingButton extends StatelessWidget {
  const UserProfileFloatingButton({
    super.key,
  });

  static const _linkedinUrl = 'https://www.linkedin.com/in/raph-souza/';

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _onPressed,
      backgroundColor: Colors.black,
      child: const Icon(
        BootstrapIcons.linkedin,
        color: Color(0xFFFAD93E),
      ),
    );
  }

  void _onPressed() {
    launchUrl(Uri.parse(_linkedinUrl));
  }
}
