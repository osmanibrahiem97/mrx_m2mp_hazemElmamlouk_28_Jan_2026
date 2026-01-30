
/*
 *
 *  Webkul Software.
 * @package Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html
 *  @link https://store.webkul.com/license.html
 *
 * /
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_admin_chat_mp/widgets/sender_chat_text_item_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../../../mobikul/app_widgets/app_bar.dart';
import '../../../../mobikul/app_widgets/image_view.dart';
import '../../../../mobikul/constants/app_constants.dart';
import '../../../../mobikul/constants/app_string_constant.dart';
import '../../../../mobikul/helper/app_localizations.dart';
import '../../../../mobikul/helper/utils.dart';
import '../../../mp_constants/mp_arguments_map.dart';
import '../../../mp_constants/mp_string_constants.dart';
import '../../../mp_models/seller_admin_chat_model/seller_admin_chat_model.dart';
import '../bloc/seller_list_mp_screen_bloc.dart';
import '../bloc/seller_list_mp_screen_event.dart';

class SellerAdminChatScreen extends StatefulWidget {
 final  Map<String,dynamic> sellerData;
   SellerAdminChatScreen(this.sellerData,{Key? key,}) : super(key: key);

  @override
  State<SellerAdminChatScreen> createState() => _SellerAdminChatScreenState();
}

class _SellerAdminChatScreenState extends State<SellerAdminChatScreen> {


  TextEditingController messageController = TextEditingController();
  AppLocalizations? _localizations;
  FirebaseDatabase? firebaseDatabase;
  DatabaseReference? databaseReference;

  String userId = "";
  String userName = "";
  String userToken = "";

  String name = "";
  String? time;
  SellerListMpBloc? sellerListMpBloc;



  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    userId = widget.sellerData[sellerIdKey];
    userName = widget.sellerData[sellerNameKey];
    userToken = widget.sellerData[tokenKey];

    print("USER-ID===> ${userId}");
    print("USER-Name===> ${userName}");
    print("USER-Token===> ${userToken}");
    Firebase.initializeApp();
    final FirebaseApp app = Firebase.app();
    firebaseDatabase = FirebaseDatabase.instance;
    firebaseDatabase?.app = app;
    firebaseDatabase?.databaseURL = ApiConstant.firebaseUrl;
    databaseReference = firebaseDatabase
        ?.refFromURL(ApiConstant.firebaseUrl)
        .child("MarketplaceApp")
        .child("messages")
        .child(userId);
        // .child(childIdKey ?? "");
    sellerListMpBloc = context.read<SellerListMpBloc>();



    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: commonAppBar(
          Utils.getStringValue(context, appStoragePref.isAdmin() ? "Admin" : userName), context,

      ),
      body: buildUi(),
    );
  }

  Widget buildUi() {
    return Column(
      children: [
        Expanded(child: buildChatUi()),
       // buildBottomView()
      ],
    );
  }

  Widget buildChatUi() {
    return StreamBuilder(
        stream: databaseReference?.orderByChild('timestamp').onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print("snapshotData--->${snapshot.data}");
            List<ChatMessageModel> messageList = [];
            if (snapshot.data.snapshot.value != null) {
              Map<dynamic, dynamic> msgs = snapshot.data.snapshot.value;
              print("Messages${msgs}");
              List getMessages = msgs.values.toList();
              getMessages.sort((a, b) {
                return b["timestamp"]
                    .toString()
                    .compareTo(a["timestamp"].toString());
              });
              for (var value in getMessages) {
                messageList.add(ChatMessageModel(
                    id: value["id"],
                    name: value["name"],
                    msg: value["msg"],
                    timestamp: value["timestamp"].toString()));
              }

              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          reverse: true,
                          itemCount: messageList?.length,
                          itemBuilder: (BuildContext context,int index){
                            time = formatTimestamp(int.tryParse(messageList?[index].timestamp ?? "") ?? 0);
                          return commonChatWidget(context, userName, messageList?[index]?.msg, time,
                              isSender: (appStoragePref.isAdmin()) ?
                              (messageList?[index]?.name != "Admin") :
                              (messageList?[index]?.name == "Admin")
                          );

                      })
                  ),
                  buildBottomView()
                ],
              );
            } else {
              return Column(
                children: [
                  Expanded(
                    child: Center(
                        child: Text(
                            _localizations?.translate(
                                MpStringConstants.startConversation) ??
                                "",
                            style: Theme.of(context).textTheme.bodyLarge)),
                  ),
                  buildBottomView()
                ],
              );
            }
          } else {
            return Center(
                child: Text(
                    _localizations?.translate("${AppStringConstant.pleaseWait}....") ??
                        "",
                    style: Theme.of(context).textTheme.bodyLarge));
          }
        });
  }

  Widget buildBottomView(){
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(width: AppSizes.spacingGeneric,),
        SizedBox(
            width: AppSizes.deviceWidth/1.2,
            child: TextField(
              controller: messageController,
              maxLines: 20,
              minLines: 1,
              obscureText: false,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                hintText: 'Type Your Message Here',
                isDense: true,
                contentPadding: const EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.spacingLarge),
                    borderSide:
                    const BorderSide(color: AppColors.darkGray, width: 0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.spacingLarge),
                    borderSide:
                    const BorderSide(color: AppColors.darkGray, width: 0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.spacingLarge),
                    borderSide:
                    const BorderSide(color: AppColors.darkGray, width: 0)),
                filled: true,
              ),
            )),
        IconButton(
            onPressed: sendChat,
            icon:  Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.outline,
              size: 31,
            ))
      ],
    );
  }

  String formatTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var formattedDate = DateFormat('yyyy-MM-dd hh:mm').format(date);
    print(DateFormat('yyyy-MM-dd hh:mm').format(date));
    print(date);
    return formattedDate;
  }

  Future<void> sendChat() async {
    Map<String, Object> body = {};
    String? message;
    if (messageController.text.trim() != "") {
      // body["id"] = appStoragePref.isAdmin() ? ("admin") : userId ?? "0";
      body["name"] = appStoragePref.isAdmin() ? ("Admin") : appStoragePref.getUserData()?.name ?? "";
      body["msg"] = messageController.text.trim();
      message = messageController.text.trim();

      body["timestamp"] = ServerValue.timestamp;
      print("body---->$body");
      databaseReference?.push().set(body);
      setState(() {
        messageController.clear();
      });

      if(appStoragePref.isAdmin() == false) {
        print("here");
        sellerListMpBloc?.add(SellerAdminChatAdminNotifyEvent(message,userName, true, 0));
      }else {
        sellerListMpBloc?.add(SellerAdminChatAdminNotifyEvent(message, "Admin", false, int.parse(widget.sellerData[customerId] ?? "0")));
      }

    }
    print("--->Send Button Clicked");
  }
}
