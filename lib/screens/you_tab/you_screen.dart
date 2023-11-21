import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funz_quiz/router/quiz_router.dart';
import 'package:funz_quiz/screens/you_tab/you_bloc.dart';
import 'package:funz_quiz/shared/extensions/color_extension.dart';
import 'package:funz_quiz/shared/ui/quiz_primary_button.dart';
import 'package:funz_quiz/shared/ui/quiz_scaffold.dart';
import 'package:funz_quiz/shared/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class YouScreen extends StatelessWidget {
  const YouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YouBloc(),
      child: BlocConsumer<YouBloc, YouState>(
        listener: (context, state) {
          if (!state.isLoadingSignOut && state.isSignOutSuccess) {
            context.go(QuizRouter.login);
          }
        },
        builder: (context, state) {
          final youBloc = context.read<YouBloc>();
          return QuizScaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state.user != null)
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: context.colorTheme.whiteColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              color: context.colorTheme.whiteColor,
                              child: Image.network(state.user?.photoURL ?? ''),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.user?.displayName ?? '',
                            style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.user?.email ?? '',
                            style: GoogleFonts.poppins().copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                  QuizPrimaryButton(
                    onPressed: () async => await youBloc.signOut(),
                    width: double.infinity,
                    text: 'Sign out',
                    left: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    right: state.isLoadingSignOut
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: context.colorTheme.primaryColor,
                              strokeWidth: 2,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(height: 16),
                  QuizPrimaryButton(
                    onPressed: () async => await _showPopupDeleteAccount(context),
                    width: double.infinity,
                    text: 'Delete account',
                    left: Icon(
                      CupertinoIcons.delete,
                      color: context.colorTheme.redColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _deleteAccountWidget(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.colorTheme.whiteColor,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delete account ?',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Are you sure you want to delete account ?',
                style: GoogleFonts.poppins().copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: QuizPrimaryButton(
                      onPressed: () {},
                      text: 'Delete',
                      backgroundColor: context.colorTheme.primaryColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: QuizPrimaryButton(
                      onPressed: () {},
                      text: 'Close',
                      backgroundColor: context.colorTheme.grayColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showPopupDeleteAccount(BuildContext context) async {
    await Utils.showPopup(
      context,
      _deleteAccountWidget(context),
    );
  }
}
