import 'package:ytnkio/core_module.dart';

class ProfileFloatingMenuChild extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileFloatingMenuChild(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.indigo,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.indigo),
          ),
        ],
      ),
    );
  }
}
