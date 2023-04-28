import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SaveUI extends HookConsumerWidget {
  const SaveUI({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController(text: "");
    final focusNode = useFocusNode();

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              maxLines: 1,
              maxLength: 64,
              focusNode: focusNode,
              controller: textEditingController,     
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Title",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    textEditingController.clear();
                  },
                )
              ),
              onChanged: (text){
                //ref.read(searchFieldNotifierProvider.notifier).updateState(copyInputField);
              },
            ),
            ElevatedButton(
                onPressed: (){
                },
                child: const Text("Save"),
              ),

          ],
        ),
      ),
      
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}