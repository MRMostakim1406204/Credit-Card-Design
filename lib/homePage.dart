import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

 String cardNumber ="";
 String cardHolderName ="";
 String cvvCode ="";
 bool isCvvFocused =false;
 String expiryDate ="";

 final GlobalKey<FormState> formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        title: Text("Add New Card",style: TextStyle(
          fontSize: 23,color: Colors.black
        ),),
        centerTitle: true,
      ),resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            
            CreditCardWidget(
              isHolderNameVisible: true,
              
              isChipVisible: true,
              cardNumber: cardNumber, expiryDate: expiryDate,
               cardHolderName: cardHolderName, cvvCode: cvvCode,
                showBackView: isCvvFocused, 
                onCreditCardWidgetChange: (CreditCardBrand brand){}),
                
                
               Expanded(child: SingleChildScrollView(
                 child: Column(
                  children: [
                    CreditCardForm(cardNumber: cardNumber,
                     expiryDate: expiryDate,
                     isCardNumberVisible: true,
                     isHolderNameVisible: true,
                     
                      cardHolderName: cardHolderName,
                       cvvCode: cvvCode,
                        onCreditCardModelChange: (CreditCardModel creditCardModel){},
                         formKey: formKey,
                         inputConfiguration: InputConfiguration(
                          cardNumberDecoration:  InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Number",
                            hintText: "**** **** ****"
                          ),
                          expiryDateDecoration:  InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Expired date",
                            hintText: "MM/YY"
                          ),
                          cvvCodeDecoration:  InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "CVV",
                            hintText: "***"
                          ),
                          cardHolderDecoration:  InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Card Holder",
                            
                          ),
                         ),
                         ),
                         ElevatedButton(onPressed: (){
                          if(formKey.currentState!.validate()){
                            print('valid');
                          }
                          else{
                            print("invalid");
                          }
                         },
                         style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          ),
                          primary: Color(0xff1b447b)
                         ),
                          child: Container(
                            margin: EdgeInsets.all(8),
                            child: Text("Validate",style: TextStyle(
                              color: Colors.white,fontFamily: "halter",fontSize: 14,package: 'Flutter_Credit_Card'
                            ),),
                          )),
                          
                  ],
                 ),
               ))
          ],
        ),
      );
  }
  void onCreditCardModelChange (CreditCardModel creditCardModel){
    setState(() {
      cardNumber =creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused =creditCardModel.isCvvFocused;
    });
  }
}