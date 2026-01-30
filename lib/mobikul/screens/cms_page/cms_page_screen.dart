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
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:html_unescape/html_unescape.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../../app_widgets/app_alert_message.dart';
// import '../../app_widgets/loader.dart';
// import '../../constants/app_constants.dart';
// import '../../constants/arguments_map.dart';
// import '../../models/cms_page/cms_page_model.dart';
// import 'bloc/cms_page_bloc.dart';
// import 'bloc/cms_page_event.dart';
// import 'bloc/cms_page_state.dart';
// import 'package:flutter_html/flutter_html.dart';
//
//
// class CmsPage extends StatefulWidget {
//   final Map<String, dynamic> arguments;
//
//   CmsPage(this.arguments,{Key? key}) : super(key: key);
//
//   @override
//   State<CmsPage> createState() => _CmsPageState();
// }
//
// class _CmsPageState extends State<CmsPage> {
//   CmsPageBloc? _cmsPageBloc;
//   bool isLoading = true;
//   CmsPageModel? _model;
//   String htmlContent = """
//   <style>#html-body [data-pb-style=W6TM20L]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}#html-body [data-pb-style=PKQTB1Q]{border-style:none}#html-body [data-pb-style=GESJL4I],#html-body [data-pb-style=T42YL9I]{max-width:100%;height:auto}@media only screen and (max-width: 768px) { #html-body [data-pb-style=PKQTB1Q]{border-style:none} }</style><div data-content-type="row" data-appearance="contained" data-element="main"><div data-enable-parallax="0" data-parallax-speed="0.5" data-background-images="{}" data-background-type="image" data-video-loop="true" data-video-play-only-visible="true" data-video-lazy-load="true" data-video-fallback-src="" data-element="inner" data-pb-style="W6TM20L"><div data-content-type="text" data-appearance="default" data-element="main"><p>ddddd</p></div><figure data-content-type="image" data-appearance="full-width" data-element="main" data-pb-style="PKQTB1Q"><img class="pagebuilder-mobile-hidden" src="http://devmage.com:12646/media/wysiwyg/6.jpg" alt="" title="" data-element="desktop_image" data-pb-style="T42YL9I"><img class="pagebuilder-mobile-only" src="http://devmage.com:12646/media/wysiwyg/6.jpg" alt="" title="" data-element="mobile_image" data-pb-style="GESJL4I"></figure></div></div>
//   """;
//
//   @override
//   void initState() {
//     _cmsPageBloc = context.read<CmsPageBloc>();
//     _cmsPageBloc?.add(CmsPageDetailsEvent(widget.arguments[cmsPageId]));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       appBar: AppBar(
//         title: Html(
//           data:  widget.arguments[cmsPageTitle]??'',style: {
//           "body": Style(
//             fontSize:  FontSize(AppSizes.textSizeLarge),
//             color: Theme.of(context).textTheme.bodySmall?.color
//           ),
//         },),
//       ),
//       body: mainView(),
//     );
//   }
//
//   Widget mainView() {
//     return BlocBuilder<CmsPageBloc, CmsPageState>(
//         builder: (BuildContext context, CmsPageState currentState) {
//           if (currentState is CmsPageLoadingState) {
//             isLoading = true;
//           } else if (currentState is CmsPageSuccessState) {
//             isLoading = false;
//             _model = currentState.data;
//           } else if (currentState is CmsPageErrorState) {
//             isLoading = false;
//             WidgetsBinding.instance?.addPostFrameCallback((_) {
//               AlertMessage.showError(
//                   currentState.message ?? '', context);
//             });
//           }
//           return _buildUI();
//         });  }
//
//   Widget _buildUI() {
//     return Stack(
//       children: [
//         Visibility(
//           visible: !isLoading,
//           child: WebView(
//             initialUrl: "",
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated: (c) {
//               _loadHtmlFromAssets(c);
//             },
//           ),
//         ),
//         Visibility(visible: isLoading, child: const Loader())
//       ],
//     );
//   }
//   _loadHtmlFromAssets(_controller) async {
//     String fileText = _model?.content??"" ;
//     HtmlUnescape unescape = HtmlUnescape();
//     String jsonString = unescape.convert(fileText);
//
//
//     _controller?.loadUrl(Uri.dataFromString(
//         """<!DOCTYPE html>
// <html>
// <head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
// <body style='"margin: 0; padding: 0;'>
// <div>
// $jsonString
// </div>
// </body>
// </html>""", mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
//         .toString());
//   }
//
//
// }
//
//



import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../app_widgets/app_alert_message.dart';
import '../../app_widgets/loader.dart';
import '../../constants/app_constants.dart';
import '../../constants/arguments_map.dart';
import '../../models/cms_page/cms_page_model.dart';
import 'bloc/cms_page_bloc.dart';
import 'bloc/cms_page_event.dart';
import 'bloc/cms_page_state.dart';
import 'package:flutter_html/flutter_html.dart';


class CmsPage extends StatefulWidget {
  final Map<String, dynamic> arguments;

  CmsPage(this.arguments,{Key? key}) : super(key: key);

  @override
  State<CmsPage> createState() => _CmsPageState();
}

class _CmsPageState extends State<CmsPage> {
  // CmsPageBloc? _cmsPageBloc;
  // bool isLoading = true;
  // CmsPageModel? _model;
  // late final WebViewController _controller;

  // String htmlContent = """
  // <style>#html-body [data-pb-style=W6TM20L]{justify-content:flex-start;display:flex;flex-direction:column;background-position:left top;background-size:cover;background-repeat:no-repeat;background-attachment:scroll}#html-body [data-pb-style=PKQTB1Q]{border-style:none}#html-body [data-pb-style=GESJL4I],#html-body [data-pb-style=T42YL9I]{max-width:100%;height:auto}@media only screen and (max-width: 768px) { #html-body [data-pb-style=PKQTB1Q]{border-style:none} }</style><div data-content-type="row" data-appearance="contained" data-element="main"><div data-enable-parallax="0" data-parallax-speed="0.5" data-background-images="{}" data-background-type="image" data-video-loop="true" data-video-play-only-visible="true" data-video-lazy-load="true" data-video-fallback-src="" data-element="inner" data-pb-style="W6TM20L"><div data-content-type="text" data-appearance="default" data-element="main"><p>ddddd</p></div><figure data-content-type="image" data-appearance="full-width" data-element="main" data-pb-style="PKQTB1Q"><img class="pagebuilder-mobile-hidden" src="http://devmage.com:12646/media/wysiwyg/6.jpg" alt="" title="" data-element="desktop_image" data-pb-style="T42YL9I"><img class="pagebuilder-mobile-only" src="http://devmage.com:12646/media/wysiwyg/6.jpg" alt="" title="" data-element="mobile_image" data-pb-style="GESJL4I"></figure></div></div>
  // """;

  late final CmsPageBloc _cmsPageBloc;
  late final WebViewController _controller;
  var apiHitTrue = false;
  CmsPageModel? _model;
  bool isPageLoaded = false; // Prevents duplicate load

  @override
  void initState() {
    _cmsPageBloc = context.read<CmsPageBloc>();
    _cmsPageBloc?.add(CmsPageDetailsEvent(widget.arguments[cmsPageId]));
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //    // backgroundColor: Theme.of(context).colorScheme.background,
  //     appBar: AppBar(
  //       title: Html(
  //         data:  widget.arguments[cmsPageTitle]??'',style: {
  //         "body": Style(
  //           fontSize:  FontSize(AppSizes.textSizeLarge),
  //           color: Theme.of(context).textTheme.bodySmall?.color
  //         ),
  //       },),
  //     ),
  //     body: mainView(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CmsPageBloc, CmsPageState>(
      listener: (context, currentState) {
        if (currentState is CmsPageSuccessState && !apiHitTrue) {
          _model = currentState.data;
          final url = _model?.url?.trim();
          if (url != null && url.isNotEmpty) {
            print("regregerhgreg==> $apiHitTrue");
            apiHitTrue = true; // Set flag to true to indicate controller init attempt
            _controller = WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(NavigationDelegate(
                onPageStarted: (url) {
                  setState(() => isPageLoaded = false);
                },
                onPageFinished: (url) async {

                  setState(() => isPageLoaded = true);

                },
                onNavigationRequest: (request) => NavigationDecision.navigate,
              ));
            _controller.loadRequest(Uri.parse(url));
          }
        }
        else if(currentState is CmsPageErrorState){
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            AlertMessage.showError(
                currentState.message ?? '', context);
          });
          setState(() => isPageLoaded = false);
          apiHitTrue = false;
        }
      },
      builder: (context, currentState) {
        if (currentState is CmsPageLoadingState) {
          isPageLoaded = false;
        }
        // else if (currentState is CmsPageSuccessState) {
        //   isPageLoaded = false;
        //   _model = currentState.data;
        //   final url = _model?.url?.trim();
        //   if (url != null && url.isNotEmpty) {
        //     _controller = WebViewController()
        //       ..setJavaScriptMode(JavaScriptMode.unrestricted)
        //       ..setNavigationDelegate(NavigationDelegate(
        //         onPageStarted: (url) {
        //           setState(() => isPageLoaded = true);
        //         },
        //         onPageFinished: (url) {
        //           setState(() => isPageLoaded = false);
        //         },
        //         onNavigationRequest: (request) => NavigationDecision.navigate,
        //       ));
        //     _controller.loadRequest(Uri.parse(url));
        //   }
        // }

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            centerTitle: true,
            title: Html(
              shrinkWrap: true,
              data: widget.arguments[cmsPageTitle] ?? '',
              style: {
                "body": Style(
                  fontSize: FontSize(AppSizes.textSizeLarge),
                  color: Theme.of(context).textTheme.bodySmall?.color,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  padding: HtmlPaddings.zero,
                ),
              },
            ),
          ),
          body: _buildUI(), // Use a method to build the body
        );
      },
    );
  }

  // Widget mainView() {
  //   return BlocBuilder<CmsPageBloc, CmsPageState>(
  //       builder: (BuildContext context, CmsPageState currentState) {
  //         if (currentState is CmsPageLoadingState) {
  //           isLoading = true;
  //         } else if (currentState is CmsPageSuccessState) {
  //           isLoading = false;
  //           _model = currentState.data;
  //         } else if (currentState is CmsPageErrorState) {
  //           isLoading = false;
  //           WidgetsBinding.instance?.addPostFrameCallback((_) {
  //             AlertMessage.showError(
  //                 currentState.message ?? '', context);
  //           });
  //         }
  //         return _buildUI();
  //       });  }

  Widget _buildUI() {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom:8.0),
      child: Stack(
        children: [
          // Visibility(
          //   visible: !isPageLoaded,
          //   child:
          //   // WebView(
          //   //   initialUrl: "",
          //   //   javascriptMode: JavascriptMode.unrestricted,
          //   //   onWebViewCreated: (c) {
          //   //     _loadHtmlFromAssets(c);
          //   //   },
          //   // ),
          //   WebViewWidget(controller: _controller)
          // ),
          // Visibility(visible: isPageLoaded, child: const Loader())
          // Only show WebViewWidget if controller has been initialized AND page is loaded
          if (apiHitTrue && isPageLoaded) WebViewWidget(controller: _controller),
          // Show Loader if controller is not yet initialized OR if page is not yet loaded
          if (!isPageLoaded || !apiHitTrue) const Loader(),
        ],
      ),
    );
  }

  _loadHtmlFromAssets(_controller) async {
    String fileText = _model?.content??"" ;
    HtmlUnescape unescape = HtmlUnescape();
    String jsonString = unescape.convert(fileText);


    _controller?.loadUrl(Uri.dataFromString(
        """<!DOCTYPE html>
<html>
<head><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body style='"margin: 0; padding: 0;'>
<div>
$jsonString
</div>
</body>
</html>""", mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }


}

