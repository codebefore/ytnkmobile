import 'package:ytnkio/core_module.dart';

class ActionCard extends StatelessWidget {
  final IconData icon;
  final String header;
  final String description;
  final Color color;
  final String name;
  final Function action;

  const ActionCard({
    super.key,
    required this.icon,
    required this.header,
    required this.description,
    required this.color,
    required this.name,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      surfaceTintColor: Colors.white,
      child: SizedBox(
        height: 220,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: color,
              ),
              Text(
                header,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 12),
              ),
              const SizedBox(
                height: 6,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          const WidgetStatePropertyAll(Colors.white),
                      backgroundColor: WidgetStatePropertyAll(color)),
                  onPressed: () {
                    action.call();
                  },
                  child: Text(name)),
            ],
          ),
        ),
      ),
    );
  }
}
