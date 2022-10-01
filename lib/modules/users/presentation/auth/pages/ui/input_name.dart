import 'package:flutter/cupertino.dart';
import 'package:omnipay/modules/common/constants/constants.dart';
import 'package:omnipay/modules/common/widgets/textfield/text_field_container.dart';
import 'package:omnipay/modules/users/presentation/auth/bloc/auth_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../common/widget.dart';

TextEditingController firstNameController = TextEditingController();
TextEditingController lastNamController = TextEditingController();

class InputName extends StatelessWidget {
  const InputName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFielContainer(
            showchild: !context.watch<AuthBloc>().isValidFirstName,
            errorMessage: 'errorMessage',
            alignment: Alignment.center,
            typeInfo: TypeInfo.error,
            infoWidget: const ErrorText(
                content: 'Enter your first name here.',
                color: PaletteColor.danger),
            child: CustomTextField(
              placeholder: 'First Name',
              textController: firstNameController,
            )),
        const SizedBox(
          height: LayoutConstants.spaceM,
        ),
        TextFielContainer(
            showchild: !context.watch<AuthBloc>().isValidLastName,
            errorMessage: 'errorMessage',
            alignment: Alignment.center,
            typeInfo: TypeInfo.error,
            infoWidget: const ErrorText(
                content: 'Enter your last name here.',
                color: PaletteColor.danger),
            child: CustomTextField(
              placeholder: 'Last Name',
              textController: lastNamController,
            )),
      ],
    );
  }
}
