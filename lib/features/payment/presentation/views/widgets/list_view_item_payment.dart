// features/payment/presentation/views/widgets/list_view_item_payment.dart
import 'package:flutter/material.dart';

class ItemPayment extends StatefulWidget {
   ItemPayment({super.key, required this.name, required this.image,this.payment});
  final String name;
  final String image;
  Function ?payment;

  @override
  State<ItemPayment> createState() => _ItemPaymentState();
}

class _ItemPaymentState extends State<ItemPayment> {
  String selectedPayment = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          widget. payment!();

        setState(() {
          selectedPayment = widget.name;
        });
      },
      child: Container(
        width: 90,
        height: 50,
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selectedPayment == widget.name ? Colors.green : Colors.grey,
            width: 2,
          ),
          //  bottom: BorderSide()

          // color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: AspectRatio(
          aspectRatio: 1.5 / 0.5,
          child: Image.asset(
            widget.image,
            // height: 180,
            // width: 5,
          ),
        ),
      ),
    );
  }
}
