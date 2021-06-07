import 'package:flutter/material.dart';
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
      StepOnePage(
        onChange: (value) {
          controller.setEventName(value);
          setState(() {});
        },
      ),
      StepTwoPage(),
      StepThreePage(),
    ];
    super.initState();
  }

  var index = 0;

  void nextPage() {
    if (index < 2) {
      index++;
      setState(() {});
    }
  }

  void backPage() {
    if (index > 0) {
      index--;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppbarWidget(
        actualPage: index + 1,
        size: pages.length,
        onTapBack: backPage,
      ),
      body: pages[index],
      bottomNavigationBar: BottomStepperBarWidget(
        enabledButtons: controller.enableNavigateButton(),
        onTapCancel: () {},
        onTapNext: nextPage,
      ),
    );
  }
}
