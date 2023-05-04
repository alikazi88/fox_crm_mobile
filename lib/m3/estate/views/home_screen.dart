import 'package:flutkit/loading_effect.dart';
import 'package:flutkit/theme/app_theme.dart';
import 'package:flutkit/theme/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/home_controller.dart';
import '../models/chat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ThemeData theme;
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = FxControllerStore.putOrFind(HomeController());
    theme = AppTheme.estateTheme;
  }

   List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (Chat chat in controller.chats!) {
      list.add(_buildSingleChat(chat));
    }
    return list;
  }

  Widget _buildSingleChat(Chat chat) {
    return FxContainer(
      // onTap: () {
      //   controller.goToSingleChatScreen(chat);
      // },
      margin: FxSpacing.bottom(16),
      paddingAll: 16,
      borderRadiusAll: Constant.containerRadius.medium,
      child: Row(
        children: [
          Stack(
            children: [
              FxContainer.rounded(
                paddingAll: 0,
                child: Image(
                  height: 54,
                  width: 54,
                  image: AssetImage(chat.image),
                ),
              ),
            
            ],
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.bodyMedium(
                  chat.name,
                  fontWeight: 900,
                ),
                FxSpacing.height(4),
                FxText.bodySmall(
                  chat.chat,
                  fontWeight: 600,
                ),
                 FxSpacing.height(4),
                FxText.bodySmall(
                  chat.messages,
                  fontWeight: 600,
                ),
              ],
            ),
          ),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            
              // chat.replied
              //     ? FxSpacing.height(16)
              //     : FxContainer.rounded(
              //         paddingAll: 6,
              //         color: theme.colorScheme.primary,
              //         child: FxText.bodySmall(
              //           chat.messages,
              //           fontSize: 10,
              //           color: theme.colorScheme.onPrimary,
              //         ),
              //       ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<HomeController>(
        controller: controller,
        builder: (estateHomeController) {
          return Theme(
            data: theme.copyWith(
                colorScheme: theme.colorScheme
                    .copyWith(secondary: theme.colorScheme.primaryContainer)),
            child: Scaffold(
              body: Container(
                padding: FxSpacing.top(FxSpacing.safeAreaTop(context)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 2,
                      child: estateHomeController.showLoading
                          ? LinearProgressIndicator(
                              color: theme.colorScheme.primary,
                              minHeight: 2,
                            )
                          : Container(
                              height: 2,
                            ),
                    ),
                    Expanded(
                      child: _buildBody(),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
 Widget _buildBody() {
    if (controller.uiLoading) {
      return Container(
          child: LoadingEffect.getSearchLoadingScreen(
        context,
      ));
    } else {
      return ListView(
        padding: FxSpacing.xy(20,20),
        children: [
          Padding(
            padding: FxSpacing.horizontal(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Image(
                      height: 44,
                      width: 44,
                      image: AssetImage('assets/illustration/shopping/small-logo.png'),
                    ),
                    FxSpacing.height(2),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       Icons.location_on,
                    //       color: theme.colorScheme.primary,
                    //       size: 14,
                    //     ),
                    //     FxSpacing.width(4),
                    //     FxText.bodyMedium(
                    //       'San Jose, CA',
                    //       fontWeight: 600,
                    //     ),
                    //     Icon(
                    //       Icons.keyboard_arrow_down_sharp,
                    //       color: theme.colorScheme.primary,
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                
                FxContainer(
                  // onTap: () {
                  //   _selectSizeSheet(context);
                  // },
                  color: theme.colorScheme.primaryContainer,
                  paddingAll: 6,
                  child: Icon(
                    Icons.add,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          FxSpacing.height(16),
          FxTextField(
            textFieldStyle: FxTextFieldStyle.outlined,
            labelText: 'Search....',
            focusedBorderColor: theme.colorScheme.primary,
            enabledBorderRadius: Constant.containerRadius.medium,
            focusedBorderRadius: Constant.containerRadius.medium,
            cursorColor: theme.colorScheme.primary,
            labelStyle: FxTextStyle.bodySmall(
                color: theme.colorScheme.onPrimaryContainer, xMuted: true),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: theme.colorScheme.primaryContainer,
            suffixIcon: Icon(
              FeatherIcons.search,
              color: theme.colorScheme.primary,
              size: 20,
            ),
          ),
          FxSpacing.height(20),
          Column(
            children: _buildChatList(),
          ),
          FxSpacing.height(24),
          
          FxSpacing.height(16),
          // Column(
          //   children: _buildHouseList(),
          // ),
        ],
      );
    }
  }
}
