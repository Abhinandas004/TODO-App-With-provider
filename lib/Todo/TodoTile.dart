import 'package:flutter/material.dart';

class Todotile extends StatelessWidget {
  bool checkValue;
  Function(bool?)? checkChanged;
  String title;
  Function()? onDelete;
  Function()? onEdit;
  TextEditingController updateCtr;
  Todotile({
    super.key,
    required this.checkValue,
    required this.checkChanged,
    required this.title,
    required this.onDelete,
    required this.onEdit,
    required this.updateCtr,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Checkbox(value: checkValue, onChanged: checkChanged),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue, size: 20),
            onPressed: () {
              _showUpdateDialog(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red, size: 20),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }

  void _showUpdateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Todo"),
          content: TextField(
            controller: updateCtr,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Update",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                onEdit!();
                Navigator.pop(context);
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }
}
