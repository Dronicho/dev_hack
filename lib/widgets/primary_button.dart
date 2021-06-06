import 'package:dev_hack2/modules/app/bloc/loading_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool loading;
  final Widget child;
  Color? color;
  PrimaryButton(
      {Key? key,
      this.onPressed,
      this.loading = false,
      required this.child,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: color ?? Theme.of(context).primaryColor,
          padding: EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Center(child: BlocBuilder<LoadingCubit, bool>(
          builder: (context, state) {
            if (state) {
              return SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  backgroundColor: Colors.white,
                ),
              );
            }
            return DefaultTextStyle(
              child: child,
              style: TextStyle(color: Colors.white, fontSize: 16),
            );
          },
        )),
      ),
    );
  }
}
