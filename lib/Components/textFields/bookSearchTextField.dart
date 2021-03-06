import 'package:flutter/cupertino.dart';
import 'package:sastra_ebooks/Components/textFields/searchTextField.dart';

class BookSearchTextField extends StatelessWidget {
  static TextEditingController textEditingController = TextEditingController();
  final ValueChanged<String> onChanged;
  final bool autofocus;

  BookSearchTextField({this.onChanged, this.autofocus});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'searchBooks',
      child: SearchTextField(
        onChanged: onChanged,
        textEditingController: BookSearchTextField.textEditingController,
        autofocus: autofocus,
      ),
    );
  }
}
