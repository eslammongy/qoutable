import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/injection_container.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/core/utils/image_capture.dart';
import 'package:quotable/core/widgets/single_view_appbar.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_state.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_event.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_action_btn.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_font_toggles.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_decorated_box.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_theme_toggles.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_state.dart';

class SingleQuoteScreen extends StatelessWidget {
  const SingleQuoteScreen({super.key, required this.quote});
  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    final localQuoteBloc = getIt<LocalQuoteBloc>();
    return BlocProvider<DecorateQuoteBloc>(
      create: (context) => DecorateQuoteBloc(),
      child: Scaffold(
        appBar: singleViewAppBar(
          context,
          actionOnTap: () {
            localQuoteBloc.add(SaveLocalQuotesEvent(quote: quote));
          },
        ),
        body: BlocListener<LocalQuoteBloc, LocalQuoteStates>(
          listener: (context, state) {
            if (state is LocalQuotesSaveSuccess) {
              displaySnackBar(context, "The Quote has been saved successfully");
            }
            if (state is LocalQuoteFailed) {
              displaySnackBar(context, "Failed to save the Quote");
            }
          },
          child: BlocBuilder<DecorateQuoteBloc, DecorateQuoteState>(
            builder: (context, state) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: kToolbarHeight - 20,
                    ),
                    QuoteDecoratedBox(
                      quote: quote,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const QuoteThemeToggles(),
                    const SizedBox(
                      height: 20,
                    ),
                    const QuoteFontToggles(),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomQuoteBtn(
                          text: shareAsPng,
                          onTap: () async {
                            final pngBytes = await ImageCapture.captureAsPng(
                              context,
                              quoteAnimatedBoxKey,
                            );
                            if (pngBytes != null && context.mounted) {
                              await ImageCapture.saveImageLocally(
                                context,
                                pngBytes,
                                shareASImgCallback: (imgFile) async {
                                  await Share.shareXFiles(
                                      [XFile(imgFile.path)]);
                                },
                              );
                            }
                          },
                        ),
                        CustomQuoteBtn(
                          text: shareAsText,
                          onTap: () async {
                            await Share.share(
                              quote.content ?? '',
                              subject: kAppName,
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomQuoteBtn(
                      text: saveAsPng,
                      hasBorder: false,
                      onTap: () async {
                        final pngBytes = await ImageCapture.captureAsPng(
                          context,
                          quoteAnimatedBoxKey,
                        );
                        if (pngBytes != null && context.mounted) {
                          await ImageCapture.saveImageLocally(
                              context, pngBytes);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
