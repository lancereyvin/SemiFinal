import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddToDo extends StatefulWidget {
  final list? items;
  final Map? todo;
  const AddToDo({super.key, this.todo, this.items});

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {

  TextEditingController titleController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  bool edit = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if(todo != null) {
      edit = true;
      final title = todo['Title'];
      final details = tode['body'];
      titleController.text = title;
      detailsController.text = details;
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(edit? "Edit" : "Add"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: "DESCRIPTION",
              ),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
            )
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: edit? updateData : addData,
              child: Text(edit ? "Save" : "Save"),
            )
          ],
        ),
      ),
    );
  }
}
