import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/step_one_page.dart';
import 'package:split_it/modules/create_split/steps/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/step_two_page.dart';
import '../../../theme/app_theme.dart';
import './widgets/bottom_stepper_bar.dart';
import './widgets/create_split_appbar.dart';

class CreateSplitPage extends StatefulWidget {
  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(controller: controller),
      StepTwoPage(),
      StepThreePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppbarWidget(
        controller: controller,
        size: pages.length,
        onTapBack: controller.backPage,
      ),
      body: Observer(
        builder: (_) {
          final index = controller.currentPage;
          return pages[index];
        },
      ),
      bottomNavigationBar: BottomStepperBarWidget(
        controller: controller,
        onTapCancel: () {},
        onTapNext: controller.nextPage,
      ),
    );
  }
}
