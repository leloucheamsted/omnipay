import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omnipay/modules/home/presentation/bloc/home_bloc.dart';
import 'package:omnipay/modules/home/presentation/pages/ui/balance_controller.dart';
import 'package:omnipay/modules/transactions/domain/entity/transaction.entity.dart';
import 'package:omnipay/modules/transactions/presentation/bloc/fetch_latest_transaction.bloc.dart';
import 'package:provider/provider.dart';

import '../../../common/constants/constants.dart';
import '../../../common/widget.dart';
import '../../../core/presentation/action_state.dart';
import '../../../core/presentation/streambuilder_all.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  late final FetchLatestTransactionBloc bloc = FetchLatestTransactionBloc();

  //late final HomeBloc bloc = HomeBloc();
  String? username = "";

  @override
  void initState() {
    getUsername();
    // bloc.getActualUser();
    // context.read<HomeBloc>().getActualUser();
    super.initState();
  }

  // @override
  // void didUpdateWidget(covariant HomePage oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  // }

  Future<String> getUsername() async {
    // setState(()  {
    username = await _secureStorage.read(key: 'firstNameKey');
    log("Hi $username");
    setState(() {
      username;
    });
    return username!;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: PaletteColor.greyLight,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: LayoutConstants.appBarSize,
          flexibleSpace: AppBarRightButton(
            //color: PaletteColor.white,
            title: 'Welcome,  $username',
            rigthWidget: _rightChild(),
            rightEvent: () {},
          )),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero,
            LayoutConstants.paddingM,
            LayoutConstants.paddingZero),
        child: Column(
          children: [
            const SizedBox(
              height: LayoutConstants.spaceS,
            ),
            BalanceController(
                balance: context.watch<HomeBloc>().user.amount.toString()),
            const SizedBox(
              height: LayoutConstants.spaceL,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BodyText1(
                    content: 'Transactions', color: PaletteColor.dark),
                GestureDetector(
                    child: const BodyText1(
                        content: 'See All', color: PaletteColor.primary)),
              ],
            ),
            Expanded(child: _buildBody(context))
            //  Recenttansaction(),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder_all<ActionState<List<TransactionEntity>>>(
      stream: bloc.outStream,
      onSuccess: (_, data) {
        if (data == null || data.data == null || data.data!.isEmpty) {
          return const Text('No data found...');
        }
        return _listTransaction(data.data!);
      },
    );
  }

  Widget _listTransaction(items) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(items.lenght, (index) {
          return const PaymentMethodItem(
            icon: ImagesConstants.mtnImage,
            transactionType: 'Balance reload',
            dateTime: '12 September 2022 13:54',
            amount: '2,000',
            avatarColor: PaletteColor.danger,
          );
        }),
      ),
    );
  }

  Widget notItem() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            IconsConstants.clockIcon,
            color: PaletteColor.greyDark,
          ),
          const SubTitle2(
              content: 'There are currently no transactions.',
              color: PaletteColor.greyDark),
        ],
      ),
    );
  }

  Widget _rightChild() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: LayoutConstants.paddingS),
      child: Row(
        children: [
          SvgPicture.asset(IconsConstants.helpcircleIcon,
              color: PaletteColor.dark),
          const SizedBox(
            width: LayoutConstants.spaceS,
          ),
          const SubTitle4(content: 'Help', color: PaletteColor.hinner),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // bloc.dispose();
    super.dispose();
  }
}
