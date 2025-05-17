import 'package:flutter/material.dart';

class EditDialogBox1 extends StatelessWidget {
  final String title;
  final VoidCallback onConfirmed;
  final String confirmText;
  final String cancelText;
  final bool isEdit;
  final String? initialValue1;
  final String? initialValue2;
  final String? initialValue3;
  final String? initialValue4;
  final String? initialValue5;
  final String? initialValue6;
  final String? initialValue7;
  final void Function(String, String)? onEditConfirmed;

  const EditDialogBox1({
    super.key,
    required this.title,
    required this.onConfirmed,
    this.confirmText = 'Delete',
    this.cancelText = 'Cancel',
    this.isEdit = false,
    this.initialValue1,
    this.initialValue2,
    this.onEditConfirmed,
    this.initialValue3,
    this.initialValue4,
    this.initialValue5,
    this.initialValue6,
    this.initialValue7,
    required BuildContext context,
  });

  @override
  Widget build(BuildContext context) {
    final controller1 = TextEditingController(text: initialValue1);
    final controller2 = TextEditingController(text: initialValue2);
    final controller3 = TextEditingController(text: initialValue3);
    final controller4 = TextEditingController(text: initialValue4);
    final controller5 = TextEditingController(text: initialValue5);
    final controller6 = TextEditingController(text: initialValue6);
    final controller7 = TextEditingController(text: initialValue7);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 40),
            if (isEdit) ...[
              TextField(
                controller: controller1,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: controller2,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: controller3,
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: controller4,
                decoration: const InputDecoration(
                  labelText: 'Age Group',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: controller5,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: controller6,
                decoration: const InputDecoration(
                  labelText: 'Image url',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                maxLines: 4,
                controller: controller7,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ] else ...[
              const Text(
                'Are you sure you want to delete this item?',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              const Text(
                'This action cannot be undone.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(cancelText),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black87),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (isEdit && onEditConfirmed != null) {
                      onEditConfirmed!(controller1.text, controller2.text);
                    } else {
                      onConfirmed();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEdit ? Colors.blue : Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(confirmText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showConfirmDialog({
  required BuildContext context,
  required String title,
  required VoidCallback onConfirmed,
  String confirmText = 'Delete',
  String cancelText = 'Cancel',
  bool isEdit = false,
  String? initialValue1,
  String? initialValue2,
  String? initialValue3,
  String? initialValue4,
  String? initialValue5,
  String? initialValue6,
  String? initialValue7,
  void Function(String, String)? onEditConfirmed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return EditDialogBox1(
        title: title,
        onConfirmed: onConfirmed,
        confirmText: confirmText,
        cancelText: cancelText,
        isEdit: isEdit,
        initialValue1: initialValue1,
        initialValue2: initialValue2,
        onEditConfirmed: onEditConfirmed,
        initialValue3: initialValue3,
        initialValue4: initialValue4,
        initialValue5: initialValue5,
        initialValue6: initialValue6,
        initialValue7: initialValue7,
        context: context,
      );
    },
  );
}
