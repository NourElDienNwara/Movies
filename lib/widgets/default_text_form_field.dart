import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/theme/app_theme.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hintText;
  final String? prefixIcon;
  final String? suffixIcon;

  final int maxLines;

  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final bool isPassword;

  const DefaultTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.onChanged,
    this.controller,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool obscureText = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  'assets/icons/${widget.prefixIcon}.svg',
                ),
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppTheme.darkColor.white,
                ),
              )
            : widget.suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  'assets/icons/${widget.suffixIcon}.svg',
                ),
              )
            : null,
      ),

      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: obscureText,
      autovalidateMode: .onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      maxLines: widget.maxLines,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
