import 'package:dev_hack2/modules/login/cubit/login_cubit.dart';
import 'package:dev_hack2/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _submitButtonFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 48,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 16, right: 16),
                  child: _UsernameInput(
                    focusNode: _usernameFocus,
                    nextFoxusNode: _passwordFocus,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, bottom: 4.0, left: 16, right: 16),
                  child: _PasswordInput(
                    focusNode: _passwordFocus,
                    nextFoxusNode: _submitButtonFocus,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 32.0, bottom: 16, right: 16, left: 16),
                  child: _LoginButton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  final FocusNode focusNode;
  final FocusNode nextFoxusNode;

  const _UsernameInput({required this.focusNode, required this.nextFoxusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          focusNode: focusNode,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(nextFoxusNode);
          },
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            hintText: 'Табельный номер',
            border: InputBorder.none,
          ),
          onChanged: (username) =>
              context.read<LoginCubit>().usernameChanged(username),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final FocusNode focusNode;
  final FocusNode nextFoxusNode;

  const _PasswordInput({required this.focusNode, required this.nextFoxusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          focusNode: focusNode,
          onSubmitted: (_) {
            FocusScope.of(context).requestFocus(nextFoxusNode);
          },
          obscureText: true,
          enableInteractiveSelection: true,
          textInputAction: TextInputAction.done,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: 'Пароль'),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return PrimaryButton(
            loading: state.status.isSubmissionInProgress,
            onPressed: state.status.isValidated
                ? () {
                    context.read<LoginCubit>().logInWithCredentials();
                  }
                : null,
            child: Text(
              'Войти',
            ));
      },
    );
  }
}
