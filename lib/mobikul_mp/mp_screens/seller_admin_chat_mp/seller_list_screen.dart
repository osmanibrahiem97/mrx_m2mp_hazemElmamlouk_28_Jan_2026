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
import 'package:test_new/mobikul/constants/app_constants.dart';
import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/app_text_field.dart';
import '../../../mobikul/app_widgets/app_tool_bar.dart';
import '../../../mobikul/app_widgets/image_view.dart';
import '../../../mobikul/constants/app_routes.dart';
import '../../../mobikul/constants/app_string_constant.dart';
import '../../../mobikul/constants/arguments_map.dart';
import '../../../mobikul/helper/app_localizations.dart';
import '../../../mobikul/helper/utils.dart';
import '../../mp_constants/mp_arguments_map.dart';
import '../../mp_constants/mp_string_constants.dart';
import '../../mp_models/seller_list_mp/seller_list_mp_model.dart';
import 'bloc/seller_list_mp_screen_bloc.dart';
import 'bloc/seller_list_mp_screen_event.dart';
import 'bloc/seller_list_mp_screen_state.dart';

class SellerListScreen extends StatefulWidget {
  const SellerListScreen({Key? key}) : super(key: key);

  @override
  State<SellerListScreen> createState() => _SellerListScreenState();
}

class _SellerListScreenState extends State<SellerListScreen> {

  bool isLoading = false;
  SellerListMpBloc? sellerListMpBloc;
  SellerListMpModel? sellerListModel;
  List<SellerListData>? mSellerList;
  final TextEditingController _sellerSearchController = TextEditingController();
  AppLocalizations? _localizations;
  String searchQuery = "";



  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context);
    super.didChangeDependencies();
  }


  @override
  void initState() {
    sellerListMpBloc = context.read<SellerListMpBloc>();
    sellerListMpBloc?.add(SellerListMpFetchEvent(searchQuery));
    sellerListModel = SellerListMpModel();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerListMpBloc, SellerListMpState>(
        builder: (context, currentState) {
          if (currentState is SellerListMpInitial) {
            isLoading = true;
          } else if (currentState is SellerListMpSuccess) {
            isLoading = false;
            sellerListModel = currentState.data;
            mSellerList = sellerListModel?.sellerList??[];
          } else if (currentState is SellerListMpSearch) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {
                mSellerList = [];
                (sellerListModel?.sellerList??[]).forEach((element) {
                  if((element.name??"").toString().trim().toLowerCase().contains(searchQuery.toString().toLowerCase())) {
                    mSellerList?.add(element);
                  }
                });
              });

            });
            sellerListMpBloc?.emit(SellerListMpEmpty());
          } else if (currentState is SellerListMpError) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(currentState.message, context);
            });
          }
     return Scaffold(
       backgroundColor: Theme.of(context).cardColor,
       appBar: appToolBar(
          Utils.getStringValue(context, MpStringConstants.chatWithSeller), context,
          isHomeEnable: false,
      ),
       body: isLoading == true ? const Center(
         child: CircularProgressIndicator(),
       ) : NestedScrollView(
           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
             return <Widget>[
               SliverAppBar(
                 expandedHeight: 0.0,
                 automaticallyImplyLeading: false,
                 floating: false,
                 pinned: true,
                 elevation: 0,
                 backgroundColor: Theme.of(context).canvasColor,
                 bottom: PreferredSize(
                   preferredSize: const Size.fromHeight(AppSizes.spacingLarge),
                   child: topContainer(context),
                 ),
               ),
             ];
           },
           body:
           (mSellerList == null || mSellerList!.isEmpty) ? Center(
             child: Text(
               Utils.getStringValue(context, MpStringConstants.noSellerFound),
               style: TextStyle(
                 fontSize: AppSizes.size16,
                 color: Theme.of(context).textTheme.bodyLarge?.color,
               ),
             ),
           ):
           SingleChildScrollView(
             child: Column(
               children: [
                 ListView.builder(
                     itemCount: mSellerList?.length,
                     shrinkWrap: true,
                     physics: const BouncingScrollPhysics(),
                     itemBuilder: (context, index) {
                       return Padding(
                           padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacingGeneric),
                           child: Card(
                             color: Theme.of(context).canvasColor,
                             child: InkWell(
                               onTap: (){
                                 Navigator.pushNamed(context, AppRoutes.sellerAdminChatScreen,arguments: getSellerData(mSellerList?[index]?.customerToken ??'', mSellerList?[index]?.name ?? '', mSellerList?[index]?.token ?? '', (mSellerList?[index].customerId ?? 0).toString()));
                               },
                               child: Container(
                                 width: AppSizes.deviceWidth,
                                 height: AppSizes.deviceWidth/6,
                                 padding: const EdgeInsets.symmetric(vertical: AppSizes.spacingSmall,horizontal: AppSizes.spacingSmall ),
                                 child: Row(
                                   children: <Widget>[
                                     SizedBox(
                                       height: AppSizes.profileIconSize,
                                       width: AppSizes.profileIconSize,
                                       child: ImageView(
                                         url: mSellerList?[index]?.profileImage ?? '',
                                         fit: BoxFit.fill,
                                         borderRadius: BorderRadius.circular(5),
                                       ),
                                     ),
                                     Expanded(
                                       child: Container(
                                         padding: const EdgeInsets.only(left:AppSizes.spacingLarge ),
                                         color: Colors.transparent,
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: <Widget>[
                                             Text(mSellerList?[index]?.name ?? "", style: TextStyle(fontSize: AppSizes.size16),),
                                             const SizedBox(height: 6,),
                                             Text(mSellerList?[index]?.email ?? "",style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: FontWeight.normal),),
                                           ],
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ));
                     }),
               ],
             ),
           ),
       )
    );
  });
  }
  Widget topContainer(BuildContext context) {
    return Container(
      height: AppSizes.deviceWidth/5.7,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.spacingSmall, vertical: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SizedBox(
              height: AppSizes.itemHeight,
              child: AppTextField(
                // prefix: const Icon(Icons.search),
                controller: _sellerSearchController,
                isPassword: false,
                hintText: Utils.getStringValue(context, AppStringConstant.search),
                inputType: TextInputType.name,
              ),
            ),
          ),
          const SizedBox(
            width: AppSizes.spacingSmall,
          ),
          SizedBox(
            width: AppSizes.deviceWidth/4,
            height: AppSizes.itemHeight,
            child: TextButton(
              onPressed: (){
                // sellerListMpBloc?.emit(SellerListMpInitial());
                searchQuery = _sellerSearchController.text;
                sellerListMpBloc?.emit(SellerListMpSearch(searchQuery));

              },
              child: Text(
                  _localizations?.translate(
                      MpStringConstants.submit) ??
                      "",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).textTheme?.labelLarge?.color)
              ),
            ),
          ),


        ],
      ),
    );
  }
}
