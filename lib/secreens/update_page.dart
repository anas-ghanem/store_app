import 'package:flutter/material.dart';
import 'package:store_app/core/app_theme.dart';
import 'package:store_app/models/prodect_model.dart';
import 'package:store_app/servaces/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_textfild.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});
  static String id = "updatepage";

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _imageController;
  late TextEditingController _categoryController;

  bool _isLoading = false;
  bool _isInitialized = false;
  late ProdectModel _product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args is ProdectModel) {
        _product = args;
        _titleController = TextEditingController(text: _product.title);
        _descriptionController =
            TextEditingController(text: _product.description);
        _priceController =
            TextEditingController(text: _product.price.toString());
        _imageController = TextEditingController(text: _product.image);
        _categoryController = TextEditingController(text: _product.category);
      }
      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  Future<void> _handleUpdate() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final price = double.tryParse(_priceController.text.trim());
    if (price == null || price <= 0) {
      _showToast('Please enter a valid positive price', isError: true);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final updatedProduct = await UpdateProduct().updateProduct(
        id: _product.id,
        title: _titleController.text.trim(),
        price: price,
        description: _descriptionController.text.trim(),
        image: _imageController.text.trim(),
        category: _categoryController.text.trim(),
      );

      if (mounted) {
        _showSuccessDialog(updatedProduct);
      }
    } catch (e) {
      if (mounted) {
        _showToast('Update failed: ${e.toString()}', isError: true);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showToast(String message, {bool isError = false}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError
                  ? Icons.error_outline_rounded
                  : Icons.check_circle_rounded,
              color: isError ? AppColors.error : AppColors.accent,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor:
            isDark ? AppColors.cardDarkElevated : AppColors.primaryDark,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void _showSuccessDialog(ProdectModel updated) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? AppColors.cardDark : AppColors.cardLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: AppColors.success,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Success!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Product details were successfully updated.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.cardDarkElevated
                    : AppColors.cardLightElevated,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    updated.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${updated.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context, updated); // Back to Home
            },
            child: const Text('Back to Store'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          leading: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.cardDarkElevated
                    : AppColors.cardLightElevated,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 16,
                color: isDark ? AppColors.textDark : AppColors.textLight,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: AppColors.accent.withValues(alpha: 0.4),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.tag_rounded,
                      color: AppColors.accent,
                      size: 14,
                    ),
                    Text(
                      'ID: ${_product.id}',
                      style: const TextStyle(
                        color: AppColors.accent,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image Preview Card
                Center(
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.cardDark
                          : AppColors.cardLightElevated,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                      ),
                    ),
                    child: Hero(
                      tag: 'product-${_product.id}',
                      child: Image.network(
                        _imageController.text,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 48,
                            color: AppColors.textSecondaryLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Form Fields Section Header
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 18,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'PRODUCT DETAILS',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Title
                CustomTextField(
                  label: 'Product Title',
                  hintText: 'Enter title...',
                  controller: _titleController,
                  prefixIcon: Icons.title_rounded,
                  onChanged: (val) => setState(() {}),
                ),
                const SizedBox(height: 16),

                // Price and Category Row
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        label: 'Price (\$USD)',
                        hintText: '0.00',
                        controller: _priceController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        prefixIcon: Icons.attach_money_rounded,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      flex: 1,
                      child: CustomTextField(
                        label: 'Category',
                        hintText: 'electronics, jewelry...',
                        controller: _categoryController,
                        prefixIcon: Icons.category_outlined,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Image URL
                CustomTextField(
                  label: 'Image URL',
                  hintText: 'https://...',
                  controller: _imageController,
                  prefixIcon: Icons.link_rounded,
                  onChanged: (val) {
                    setState(() {});
                  },
                ),
                const SizedBox(height: 16),

                // Description
                CustomTextField(
                  label: 'Description',
                  hintText: 'Enter product description...',
                  controller: _descriptionController,
                  maxLines: 4,
                  prefixIcon: Icons.description_outlined,
                ),
                const SizedBox(height: 28),

                // Submit Button
                CustomButton(
                  text: 'Save Changes',
                  icon: Icons.check_circle_outline_rounded,
                  isLoading: _isLoading,
                  onPressed: _handleUpdate,
                ),
                const SizedBox(height: 12),

                // Reset Button
                CustomButton(
                  text: 'Reset to Original',
                  isOutlined: true,
                  icon: Icons.restore_rounded,
                  onPressed: _isLoading
                      ? null
                      : () {
                          setState(() {
                            _titleController.text = _product.title;
                            _descriptionController.text = _product.description;
                            _priceController.text = _product.price.toString();
                            _imageController.text = _product.image;
                            _categoryController.text = _product.category;
                          });
                          _showToast('Form reset to original values');
                        },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
