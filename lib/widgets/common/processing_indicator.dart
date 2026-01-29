import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/core_module.dart';

class ProcessingIndicator extends StatelessWidget {
  const ProcessingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
        buildWhen: (previous, current) =>
            previous.isProcessing != current.isProcessing,
        builder: (context, state) {
          if (state.isProcessing) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        });
  }
}
