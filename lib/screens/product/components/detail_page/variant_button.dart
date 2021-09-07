import 'package:flutter/material.dart';
class VariantButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget title;
  final ValueChanged<T> onChanged;
  
  const VariantButton({
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    @required this.leading,
    this.title,
  });
  
  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            _customRadioButton,
            if (title != null) title,
          ],
        ),
      ),
    );
  }
  
  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : null,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey[300],
          width: 2,
        ),
      ),
      child: Text(
        leading,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey[600],
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}