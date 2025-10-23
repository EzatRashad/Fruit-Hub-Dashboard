import 'package:flutter/material.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();
  final descController = TextEditingController();

  String? selectedCategory;
  final List<String> categories = [
    'Fruits',
    'Vegetables',
    'Snacks',
    'Drinks',
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width >= 700 && width < 1100;
    final isDesktop = width >= 1100;

    final double padding = isDesktop ? 40 : 20;
    final double fieldWidth = isDesktop ? 350 : double.infinity;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(padding),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: EdgeInsets.all(isDesktop ? 40 : 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Title
                        const Text(
                          "Add New Product",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 25),

                        // 🔹 Inputs Grid
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            SizedBox(
                              width: fieldWidth,
                              child: _buildTextField(
                                controller: nameController,
                                label: "Product Name",
                                icon: Icons.shopping_bag_outlined,
                              ),
                            ),
                            SizedBox(
                              width: fieldWidth,
                              child: DropdownButtonFormField<String>(
                                value: selectedCategory,
                                decoration: InputDecoration(
                                  labelText: "Category",
                                  prefixIcon:
                                      const Icon(Icons.category_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                items: categories
                                    .map((cat) => DropdownMenuItem(
                                          value: cat,
                                          child: Text(cat),
                                        ))
                                    .toList(),
                                onChanged: (value) =>
                                    setState(() => selectedCategory = value),
                                validator: (value) =>
                                    value == null ? "Select a category" : null,
                              ),
                            ),
                            SizedBox(
                              width: fieldWidth,
                              child: _buildTextField(
                                controller: priceController,
                                label: "Price (\$)",
                                icon: Icons.attach_money_outlined,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(
                              width: fieldWidth,
                              child: _buildTextField(
                                controller: stockController,
                                label: "Stock Quantity",
                                icon: Icons.inventory_2_outlined,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // 🔹 Description Field
                        _buildTextField(
                          controller: descController,
                          label: "Description",
                          icon: Icons.description_outlined,
                          maxLines: 4,
                        ),

                        const SizedBox(height: 25),

                        // 🔹 Image Upload
                        GestureDetector(
                          onTap: () {
                            // TODO: pick image logic
                          },
                          child: Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xFFF3F3F3),
                              border: Border.all(
                                color: Colors.grey.shade400,
                                width: 1,
                              ),
                            ),
                            child: const Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.add_photo_alternate_outlined,
                                      size: 40, color: Colors.grey),
                                  SizedBox(height: 8),
                                  Text(
                                    "Upload Product Image",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 35),

                        // 🔹 Submit Button
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: isDesktop ? 220 : double.infinity,
                            height: 55,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.check_circle_outline),
                              label: const Text(
                                "Add Product",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("✅ Product added successfully!"),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) => value!.isEmpty ? "Enter $label" : null,
    );
  }
}
