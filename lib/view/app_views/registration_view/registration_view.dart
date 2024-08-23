import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos/componants/custom_circular_button.dart';
import 'package:pos/componants/custtom_text_feild.dart';
import 'package:pos/const/exe.dart';
import 'package:pos/const/text_style.dart';
import 'package:pos/controller/auth_controller/auth_controller.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final usernameController = TextEditingController();
  final userEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final businessNameController = TextEditingController();
  final regNameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final businessTypeController = TextEditingController();
  final chargesTypeController = TextEditingController();

  AuthController controller = Get.put(AuthController());

  @override
  void dispose() {
    userEmailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    businessNameController.dispose();
    regNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    businessTypeController.dispose();
    chargesTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              _infoIput(businessNameController, Icons.business, 'Name',
                  'Business Name',TextInputType.name),
              _infoIput(
                  usernameController, Icons.business, 'Reg Name', 'Reg Name',TextInputType.name),
              _infoIput(
                  userEmailController, Icons.email_outlined, 'Email', 'Email',TextInputType.emailAddress),
              _infoIput(passwordController, Icons.lock, 'Password', 'Password',TextInputType.visiblePassword),
              _infoIput(phoneController, Icons.phone_android, 'Phone', 'Phone',TextInputType.phone),
              _infoIput(addressController, Icons.maps_home_work_outlined,
                  'Address', 'Address',TextInputType.streetAddress),
              _infoIput(businessTypeController, Icons.business, 'Type',
                  'Business Type',TextInputType.text),
              _infoIput(chargesTypeController, Icons.money, '\$0', 'Charges',TextInputType.number),
              const Align(
                  alignment: Alignment.centerLeft, child: Text('Upload image')),
              InkWell(
                  onTap: () {
                    controller.pickImageFrom(ImageSource.gallery);
                  },
                  child: const Icon(
                    Icons.upload_file_sharp,
                    size: 50,
                  )),
              10.height,
              CustomCircularButton(
                  icon: Icons.arrow_upward,
                  onTap: () {
                    controller.register(
                        usernameController.text.trim(),
                        userEmailController.text.trim(),
                        passwordController.text.trim(),
                        businessNameController.text.trim(),
                        phoneController.text.trim(),
                        addressController.text.trim(),
                        businessTypeController.text.trim(),
                        context);

                    // Get.offAll(const HomeView());
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
    String title, TextInputType keyBordType) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h),
    child: Column(
      children: [
        Align(alignment: Alignment.centerLeft, child: Text(title)),
        CustomTextFeild(hint: hint, controller: controller, icon: icon,keyBordType: keyBordType,)
      ],
    ),
  );
}
