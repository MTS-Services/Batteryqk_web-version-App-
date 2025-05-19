import 'package:flutter/material.dart';

// Dummy dropdown for now
class ConfirmCustomDropdownButton extends StatelessWidget {
  final List<String> itemList;
  final String listType;

  const ConfirmCustomDropdownButton({
    super.key,
    required this.itemList,
    required this.listType,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      items: itemList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: listType,
        border: OutlineInputBorder(),
      ),
    );
  }
}

class ConfirmDialogWidget extends StatelessWidget {
  final String title;
  final VoidCallback onConfirmed;
  final String confirmText;
  final String cancelText;
  final bool isEdit;
  final String? initialValue1;
  final String? initialValue2;
  final void Function(String, String)? onEditConfirmed;

  const ConfirmDialogWidget({
    super.key,
    required this.title,
    required this.onConfirmed,
    this.confirmText = 'Delete',
    this.cancelText = 'Cancel',
    this.isEdit = false,
    this.initialValue1,
    this.initialValue2,
    this.onEditConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    final controller1 = TextEditingController(text: initialValue1);
    final controller2 = TextEditingController(text: initialValue2);

    final List<String> status = ['Confirm', 'Pending', 'Cancelled'];
    final List<String> payment = ['Paid', 'Unpaid'];

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
            const SizedBox(height: 8),

            // Conditional Form Fields
            if (isEdit) ...[
              TextField(
                controller: controller1,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: controller2,
                decoration: const InputDecoration(
                  labelText: 'Email',
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
              const SizedBox(height: 8),
              const Text('All Status', style: TextStyle(fontSize: 14)),
              ConfirmCustomDropdownButton(itemList: status, listType: 'Select a status'),
              const SizedBox(height: 8),
              const Text('Payment Status', style: TextStyle(fontSize: 14)),
              ConfirmCustomDropdownButton(itemList: payment, listType: 'Select'),
            ],

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black87),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    cancelText,
                    style: const TextStyle(color: Colors.black),
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
                  child: Text(confirmText, style: const TextStyle(color: Colors.white)),
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
  void Function(String, String)? onEditConfirmed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return ConfirmDialogWidget(
        title: title,
        onConfirmed: onConfirmed,
        confirmText: confirmText,
        cancelText: cancelText,
        isEdit: isEdit,
        initialValue1: initialValue1,
        initialValue2: initialValue2,
        onEditConfirmed: onEditConfirmed,
      );
    },
  );
}
