import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../shared/repositories/firebase_repository.dart';
import 'create_split_controller.dart';
import 'steps/four/step_four_page.dart';
import 'steps/step_one_page.dart';
import 'steps/three/step_three_page.dart';
import 'steps/two/step_two_page.dart';
import 'widgets/bottom_stepper_bar.dart';
import 'widgets/create_split_appbar.dart';

class CreateSplitPage extends StatefulWidget {
  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController(repository: FirebaseRepository());

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(controller: controller),
      StepTwoPage(controller: controller),
      StepThreePage(createController: controller,),
      StepFourPage(controller: controller),
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
      ),
    );
  }
}
