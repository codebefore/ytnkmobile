import 'package:flutter_test/flutter_test.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';

import 'package:ytnkio/main.dart';

void main() {
  testWidgets('YtnkioApp can be created', (WidgetTester tester) async {
    final globalBloc = GlobalBloc();

    await tester.pumpWidget(YtnkioApp(globalBloc: globalBloc));
    expect(find.byType(YtnkioApp), findsOneWidget);

    await globalBloc.close();
  });
}
