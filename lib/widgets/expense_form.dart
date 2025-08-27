import 'package:farm_yield/data/data.dart';
import 'package:flutter/material.dart';

class AddExpenseForm extends StatefulWidget {
  final Function(String category, int amount, String paidTo) onSubmit;

  const AddExpenseForm({super.key, required this.onSubmit});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _paidToController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add Expense",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: "Category"),
              validator: (value) =>
                  value == null || value.isEmpty ? "Enter category" : null,
            ),

            const SizedBox(height: 16),
            TextFormField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return "Enter amount";
                if (int.tryParse(value) == null) return "Enter a valid number";
                return null;
              },
            ),

            const SizedBox(height: 16),
            TextFormField(
              controller: _paidToController,
              decoration: const InputDecoration(labelText: "Paid To"),
              validator: (value) =>
                  value == null || value.isEmpty ? "Enter payee name" : null,
            ),

            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text("Save"),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await addExpenseAPI(
                    context,
                    _categoryController.text,
                    int.parse(_amountController.text),
                    _paidToController.text,
                  );

                  // Refresh list in parent
                  Navigator.pop(context, true); // return success to parent
                }
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
