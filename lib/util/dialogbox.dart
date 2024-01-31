import 'package:flutter/material.dart';
import 'package:todo_app/util/mybotton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return AlertDialog(
        backgroundColor: Colors.blueGrey.shade700,
        content: Container(
          height: 200,
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: TextFormField(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                    focusColor: Colors.transparent,
                    hintText: 'Add task',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Empty task cannot be added';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                      text: 'Save',
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          onSave();
                        }
                      }),
                  MyButton(text: 'Cancel', onPressed: onCancel),
                ],
              )
            ],
          ),
        ));
  }
}
