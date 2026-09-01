import 'package:flutter/material.dart';
import 'package:habithub/shared/dialogs/confirmation_dialog.dart';
import 'package:habithub/shared/dialogs/error_dialog.dart';
import 'package:habithub/shared/dialogs/loading_dialog.dart';
import 'package:habithub/shared/dialogs/success_dialog.dart';

class DialogHelper {
  DialogHelper._();

  // ----------------------------
  // Loading Dialog
  // ----------------------------
  static void showLoading(
    BuildContext context, {
    String title = "Please wait",
    String message = "We're processing your request...",
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => LoadingDialog(title: title, message: message),
    );
  }

  static void hideLoading(BuildContext context) {
    final navigator = Navigator.of(context, rootNavigator: true);

    if (navigator.canPop()) {
      navigator.pop();
    }
  }

  // ----------------------------
  // Success Dialog
  // ----------------------------
  static Future<void> showSuccess(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = "Continue",
    VoidCallback? onPressed,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => SuccessDialog(
        title: title,
        description: message,
        buttonText: buttonText,
        onPressed: onPressed,
      ),
    );
  }

  // ----------------------------
  // Error Dialog
  // ----------------------------
  static Future<void> showError(
    BuildContext context, {
    required String title,
    required String message,
    String buttonText = "OK",
  }) {
    return showDialog(
      context: context,
      builder: (_) => ErrorDialog(
        title: title,
        description: message,
        buttonText: buttonText,
      ),
    );
  }

  // ----------------------------
  // Confirmation Dialog
  // ----------------------------
  static Future<void> showConfirmation(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = "Confirm",
    String cancelText = "Cancel",
    required VoidCallback onConfirm,
  }) {
    return showDialog(
      context: context,
      builder: (_) => ConfirmationDialog(
        title: title,
        description: message,
        confirmText: confirmText,
        cancelText: cancelText,
        onConfirm: onConfirm,
      ),
    );
  }
}
