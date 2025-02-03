import 'package:flutter_test/flutter_test.dart';
import 'package:yum_application/src/app/viewModel/app_view_model.dart';

void main() {
  late AppViewModel viewModel;
  group("App View Model Unit Test", () {
    setUp(() {
      viewModel = AppViewModel();
    });
    test("초기 index 는 1이다.", () {
      expect(viewModel.pageIndex, 1);
    });

    test("changeIndex 메소드를 통해서 pageIndex를 바꿀 수 있다.", () {
      viewModel.changeIndex(3);
      expect(viewModel.pageIndex, 3);
    });
  });
}
