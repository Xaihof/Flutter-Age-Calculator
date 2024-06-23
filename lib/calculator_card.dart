import 'package:flutter/material.dart';

class CalculatorCard extends StatefulWidget {
  const CalculatorCard({super.key});

  @override
  State<CalculatorCard> createState() => _CalculatorCardState();
}

class _CalculatorCardState extends State<CalculatorCard> {
  // variables
  var dateController = TextEditingController();
  var monthController = TextEditingController();
  var yearController = TextEditingController();

  var age = "Calculate your age";

  // functions

  void ageCalculator() {
    var date = dateController.text;
    var month = monthController.text;
    var year = yearController.text;

    if (date.isNotEmpty && month.isNotEmpty && year.isNotEmpty) {
      try {
        var dateInt = int.parse(date);
        var monthInt = int.parse(month);
        var yearInt = int.parse(year);

        var currentDate = DateTime.now();
        var birthDate = DateTime(yearInt, monthInt, dateInt);

        int years = currentDate.year - birthDate.year;
        int months = currentDate.month - birthDate.month;
        int days = currentDate.day - birthDate.day;

        if (days < 0) {
          months--;
          days += DateTime(currentDate.year, currentDate.month - 1, 0)
              .day; // Days in previous month
        }

        if (months < 0) {
          years--;
          months += 12;
        }

        setState(() {
          age = "You are $years years, $months months and $days days old";
        });
      } catch (e) {
        // Handle parsing errors (e.g., invalid input)
        setState(() {
          age = "Invalid date input";
        });
      }
    } else {
      setState(() {
        age = "Please enter all fields";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
            width: 350,
            height: 350,
            child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(age,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.red,
                              fontSize: 21,
                              fontWeight: FontWeight.bold)),
                      Row(children: [
                        Expanded(
                            child: SizedBox(
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: dateController,
                                    decoration: const InputDecoration(
                                        labelText: "Date",
                                        helperText: "31",
                                        border: OutlineInputBorder())))),
                        const SizedBox(width: 7),
                        Expanded(
                            child: SizedBox(
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: monthController,
                                    decoration: const InputDecoration(
                                        labelText: "Month",
                                        helperText: "12",
                                        border: OutlineInputBorder())))),
                        const SizedBox(width: 7),
                        Expanded(
                            child: SizedBox(
                                child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: yearController,
                                    decoration: const InputDecoration(
                                        labelText: "Year",
                                        helperText: "1999",
                                        border: OutlineInputBorder())))),
                      ]),
                      OutlinedButton(
                          onPressed: ageCalculator,
                          child: const Text("Calculate"))
                    ]))));
  }
}
