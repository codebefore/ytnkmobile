import 'package:ytnkio/core_module.dart';

class RecommendedJobs extends StatelessWidget {
  final IconData icon;
  final String description;
  final Color color;
  final String name;
  final Function action;

  const RecommendedJobs({
    super.key,
    required this.icon,
    required this.description,
    required this.color,
    required this.name,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      surfaceTintColor: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: color,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 12),
              ),
              const SizedBox(
                height: 12,
              ),
              OutlinedButton(
                  style: ButtonStyle(
                      shape: const WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
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
