import 'package:flutter/cupertino.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      width: MediaQuery.of(context).size.width > 400 ? 400 : null,
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: const Center(
          child: Text(
            'Delete',
            style: TextStyle(
              color: Color(0xffFF3B30),
              fontSize: 16,
              fontFamily: 'SF',
            ),
          ),
        ),
      ),
    );
  }
}
