// features/cart/presentation/views/payment_view.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myproducts/core/resources/app_assets.dart';
import 'package:myproducts/core/resources/app_colors.dart';
import 'package:myproducts/core/resources/app_text.dart';
import 'package:myproducts/core/validations/validations.dart';
import 'package:myproducts/features/cart/presentation/views/widgets/custom_app_bar_paymet.dart';
import 'package:myproducts/features/cart/presentation/views/widgets/list_view_item_payment.dart';
import 'package:myproducts/features/component/button.dart';
import 'package:myproducts/features/component/text_form_field.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
class PaymentView extends StatefulWidget {
  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  var emailcontroller = TextEditingController();

    var nameController = TextEditingController();

    var CardNumbercontroller = TextEditingController();
    var CVVcontroller = TextEditingController();
        var Expirycontroller = TextEditingController();


 final _formkey = GlobalKey<FormState>();
 final _controller07 = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
         child: AppBar()
         ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const CustomAppBarPaymet(),
             const TitleMedium(text: 'Payment Method',bold: true,fontSize: 15,),
             const Padding(
               padding: EdgeInsets.symmetric(vertical: 15),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   ItemPayment(name: 'MasterCard', image: ImageAssets.MasterCard,),
                  ItemPayment(name: 'visa', image: ImageAssets.visa,),
                  ItemPayment(name: 'paypal', image: ImageAssets.paypal,),
                  
                ],
               ),
               
             ),
               const TitleMedium(text: 'E-mail ',bold: true,fontSize: 15,),
                        Form(
                          key: _formkey,
                          child: SingleChildScrollView(
                            child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultFormField(
                                  Prefix: Icons.email ,
                                  Controller: emailcontroller,
                                  Type: TextInputType.emailAddress,
                                  Validator: validateEmail,
                                ),
                                const TitleMedium(text: 'Card number ',bold: true,fontSize: 15,),
                                                  DefaultFormField(
                            Prefix: Icons.credit_card,
                            Controller: CardNumbercontroller,
                            Type: TextInputType.number,
                            inputFormatter:  [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16), 
              ],
                            Validator: validateCardNumber,
                                                  ),

                      const TitleMedium(text: 'Name on Card  ',bold: true,fontSize: 15,),
                                                  DefaultFormField(
                            Prefix: Icons.person,
                            Controller: nameController,
                            Type: TextInputType.name,
                           
                            Validator: validateName,
                                                  ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const TitleMedium(text: 'CVV ',bold: true,fontSize: 15,),
                                   DefaultFormField(
                                    hintText: '•••',
                                    fonthintText: 20,
                                    inputFormatter:[LengthLimitingTextInputFormatter(3)],
                            Prefix: Icons.credit_card,
                            Controller: CVVcontroller,
                            Type: TextInputType.number,
                           isobscureText: true,
                           width: 130.w,
                            Validator: (value){
                               if (value == null || value.isEmpty) {
                              return 'enter the numbers';
                                   }
                                    if (value.length < 6) {
                                    return 'must be 3 numbers';
                                              }
                                                return null;
                            },
                                                  ),
                                 ],
                               ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   const TitleMedium(text: 'Expiry ',bold: true,fontSize: 15,),
                                   DefaultFormField(
                                    hintText: '09/88',
                                    inputFormatter: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(5)
                                    ],
                            Prefix: Icons.calendar_month,
                            Controller: Expirycontroller,
                            Type: TextInputType.number,
                           width: 130.w,
                            Validator: validateName,
                                                  ),
                                 ],
                               ),
                             ],
                           ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               const TitleMedium(text: 'Save your credit information ',
                               bold: true,fontSize: 16,
                               textColor: LightAppColors.primary700,
                               ),
                               AdvancedSwitch(
                                onChanged: (valu){

                                },
                      width: 32,
                      height: 16,
                      controller: _controller07,
                    ),
                              
               
                            ],
                           ),
                          

                    Padding(
                    padding: const EdgeInsets.symmetric(
                     vertical: 15
                      ),
                                                     
                     child: defaultButton(
                       onPressed: () {
                if (_formkey.currentState!.validate()){
                                                                                         
                                                                                           
               }     
             },
                    text: 'Pay\$90',
             ),
                  ),
                              ],
                            ),
                          ),
                        ),
                        
            ]
          
          ),
        ),
      ) ,
    );
  }
}