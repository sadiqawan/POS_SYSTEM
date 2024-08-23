import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pos/componants/custom_circular_button.dart';
import 'package:pos/componants/custtom_text_feild.dart';
import 'package:pos/const/exe.dart';
import 'package:pos/const/text_style.dart';
import 'package:pos/view/app_views/home_views/home_view.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register your Business'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Register your Business'),
              20.height,
              _infoIput(controller, Icons.business, 'Name', 'Business Name'),
              _infoIput(controller, Icons.business, 'Name', 'Reg Name'),
              _infoIput(controller, Icons.email_outlined, 'Email', 'Email'),
              _infoIput(controller, Icons.phone_android, 'Phone', 'Phone'),
              _infoIput(controller, Icons.maps_home_work_outlined, 'Address',
                  'Address'),
              _infoIput(controller, Icons.business, 'Type', 'Business Type'),
              _infoIput(controller, Icons.money, '\$0', 'Charges'),
              const Align(
                  alignment: Alignment.centerLeft, child: Text('Upload image')),
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.upload_file_sharp,
                    size: 50,
                  )),
              10.height,
              CustomCircularButton(icon: Icons.arrow_upward, onTap: () {

                Get.offAll(const HomeView());
              }),
              Text(
                'Submit data',
                style: kHeading2,
              ),
              10.height,
            ],
          ),
        ),
      ),
    );
  }
}

Widget _infoIput(TextEditingController controller, IconData icon, String hint,
    String title) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h),
    child: Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: Text(title)),
        CustomTextFeild(hint: hint, controller: controller, icon: icon)
      ],
    ),
  );
}
