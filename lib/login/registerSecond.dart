// import 'package:flutter/material.dart';

// class RegisterSecond extends StatefulWidget {
//   const RegisterSecond({super.key});

//   @override
//   State<RegisterSecond> createState() => _RegisterSecondState();
// }

// int _currentStep = 0;

// var _step = 0;

//  const _steps = [
//     Step(
//       title: Text('Address'),
//       content: ,
//     ),
//     Step(
//       title: Text('Card Details'),
//       content: _CardForm(),
//     ),
//     Step(
//       title: Text('Overview'),
//       content: _Overview(),
//     )
//   ];


//   // List<Step> getSteps() => [
//   //       const Step(title: Text('Student'), content: Center(child: 
//   //       Column(
//   //         children: [
//   //         ],
//   //       )
//   //       )),
//   //        const Step(title: Text('Academic '), content: Center(child: Text('Address'),)),
//   //         const Step(title: Text('Final2'), content: Center(child: Text('Confirm'),))
//   //  ];
// class _RegisterSecondState extends State<RegisterSecond> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stepper(
//            onStepTapped: (step) => setState(() => _currentStep = step),
//       onStepContinue: () {
//         setState(() {
//           if (_currentStep < _steps.length - 1) {
//             _currentStep += 1;
//           } else {
//             _currentStep = 0;
//           }
//         });
//       },
//       onStepCancel: () {
//         setState(() {
//           if (_currentStep > 0) {
//             _currentStep -= 1;
//           } else {
//             _currentStep = 0;
//           }
//         });
//       },
//       currentStep: _currentStep,

//           type: StepperType.horizontal,
//           steps: ,
//           )
//       )
//     );
//   }

  
// }