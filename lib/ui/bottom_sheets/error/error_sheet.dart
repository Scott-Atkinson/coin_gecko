import 'package:flutter/material.dart';
import 'package:coin_gecko/ui/common/app_colors.dart';
import 'package:coin_gecko/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'error_sheet_model.dart';

class ErrorSheet extends StackedView<ErrorSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ErrorSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ErrorSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      width: double.infinity, // Take full width
      height: double.infinity, // Take full height
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title!,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
            if (request.description != null) ...[
              verticalSpaceTiny,
              Text(
                request.description!,
                style: const TextStyle(fontSize: 14, color: kcMediumGrey),
                maxLines: 3,
                softWrap: true,
              ),
            ],
            verticalSpaceLarge,
          ],
        ),
      ),
    );
  }

  @override
  ErrorSheetModel viewModelBuilder(BuildContext context) => ErrorSheetModel();
}
