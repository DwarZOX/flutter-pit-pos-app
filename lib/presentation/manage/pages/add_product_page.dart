import 'package:pit_pos_app/core/extensions/int_ext.dart';
import 'package:pit_pos_app/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_dropdown.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/image_picker_widget.dart';
import '../../../core/components/spaces.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final stockController = TextEditingController();
    final categoryController = TextEditingController();

    final List<String> categories = [
      'Minuman',
      'Makanan',
      'Snack',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          CustomTextField(
            controller: nameController,
            label: 'Nama Produk',
          ),
          const SpaceHeight(20.0),
          CustomTextField(
            controller: priceController,
            label: 'Harga Produk',
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final int priceValue = value.toIntegerFromText;
              priceController.text = priceValue.currencyFormatRp;
              priceController.selection = TextSelection.fromPosition(
                  TextPosition(offset: priceController.text.length));
            },
          ),
          const SpaceHeight(20.0),
          ImagePickerWidget(
            label: 'Foto Produk',
            onChanged: (file) {},
          ),
          const SpaceHeight(20.0),
          CustomTextField(
            controller: stockController,
            label: 'Stok Produk',
            keyboardType: TextInputType.number,
          ),
          const SpaceHeight(20.0),
          CustomDropdown(
            value: categories.first,
            items: categories,
            label: 'Kategori',
            onChanged: (value) {
              categoryController.text = value ?? '';
            },
          ),
          const SpaceHeight(24.0),
          Button.filled(
            onPressed: () {},
            label: 'Simpan',
          ),
          const SpaceHeight(30.0),
        ],
      ),
    );
  }
}
