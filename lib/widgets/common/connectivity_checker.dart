import 'package:provider/provider.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/services/common/connectivity_service.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/common/default_text_button.dart';

class ConnectivityChecker extends StatelessWidget {
  const ConnectivityChecker({super.key});

  @override
  Widget build(BuildContext context) {
    final connectivityService = Provider.of<ConnectivityService>(context);

    return StreamBuilder<bool>(
      stream: connectivityService.serviceLivenessStreamController.stream,
      builder: (context, livenessSnapshot) {
        if (livenessSnapshot.hasData && !livenessSnapshot.data!) {
          connectivityService.pause();

          return const ServiceDownPage();
        }
        return const SizedBox();
      },
    );
  }
}

class ServiceDownPage extends StatefulWidget {
  static const String id = "pages/service_down_page";

  const ServiceDownPage({super.key});

  @override
  State<ServiceDownPage> createState() => _ServiceDownPageState();
}

class _ServiceDownPageState extends State<ServiceDownPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..forward()
      ..repeat();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final connectivityService = Provider.of<ConnectivityService>(context);

    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.SERVICEDOWN_PAGE_title,
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Text(
            GlobalTexts.current.SERVICEDOWN_PAGE_pleaseTryAgainLater,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.indigo,
              BlendMode.srcATop,
            ),
            child: Icon(GlobalIcons.GENERAL_refreshIcon),
          ),
          DefaultTextButton(
            isProcessing: false,
            icon: Icons.reset_tv_rounded,
            label: GlobalTexts.current.SERVICEDOWN_PAGE_solutionButton,
            onPressed: () {
              connectivityService.resume();
            },
          )
        ]),
      ),
    );
  }
}
