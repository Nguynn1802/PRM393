import 'employee.dart';

class EmployeeManager {
  final Map<String, Employee> _employees = {};

  void addEmployee(Employee emp) {
    if (_employees.containsKey(emp.id)) {
      print("Error: Employee ID ${emp.id} already exists!");
      return;
    }
    _employees[emp.id] = emp;
    print("Success: Added employee ${emp.fullName}.");
  }

  void displayAllEmployees() {
    if (_employees.isEmpty) {
      print("Currently, there are no employees in the system.");
      return;
    }
    print("\n--- EMPLOYEE LIST ---");
    for (var emp in _employees.values) {
      emp.displayInfo();
      print("-" * 30);
    }
  }

  void searchEmployeeById(String id) {
    var emp = _employees[id];
    if (emp == null) {
      print("Error: Candidate with ID $id not found.");
      return;
    }
    print("Result found:");
    emp.displayInfo();
  }

  void deleteEmployeeById(String id) {
    var removed = _employees.remove(id);
    if (removed == null) {
      print("Error: Cannot delete. ID $id does not exist.");
    } else {
      print("Success: Deleted employee ${removed.fullName} (ID: $id).");
    }
  }

  void updateEmployee(String id, String newName, double newSalary) {
    var emp = _employees[id];
    if (emp == null) {
      print("Error: Candidate with ID $id not found for update.");
      return;
    }
    emp.fullName = newName;
    emp.baseSalary = newSalary;
    print("Success: Updated information for ID $id.");
  }

  void searchByIncomeRange(double minIncome, double maxIncome) {
    var results = _employees.values
        .where((e) => e.getIncome() >= minIncome && e.getIncome() <= maxIncome)
        .toList();

    if (results.isEmpty) {
      print("No employees found within the income range: $minIncome - $maxIncome");
      return;
    }

    print("\n--- EMPLOYEES IN INCOME RANGE ($minIncome - $maxIncome) ---");
    for (var emp in results) {
      emp.displayInfo();
      print("-" * 30);
    }
  }

  void sortByFullName() {
    var empList = _employees.values.toList();
    empList.sort((a, b) => a.fullName.compareTo(b.fullName));

    print("\n--- LIST SORTED BY FULL NAME (A-Z) ---");
    for (var emp in empList) {
      print("Name: ${emp.fullName} | ID: ${emp.id} | Income: ${emp.getIncome().toStringAsFixed(0)}");
    }
  }

  void sortByTotalIncome() {
    var empList = _employees.values.toList();
    empList.sort((a, b) => a.getIncome().compareTo(b.getIncome()));

    print("\n--- LIST SORTED BY TOTAL INCOME (ASCENDING) ---");
    for (var emp in empList) {
      print("ID: ${emp.id} | Name: ${emp.fullName} | Income: ${emp.getIncome().toStringAsFixed(0)}");
    }
  }

  void displayTop5HighestIncome() {
    var empList = _employees.values.toList();
    // Sort descending
    empList.sort((a, b) => b.getIncome().compareTo(a.getIncome()));
    
    var top5 = empList.take(5).toList();
    print("\n--- TOP 5 HIGHEST INCOME EMPLOYEES ---");
    for (var i = 0; i < top5.length; i++) {
      var emp = top5[i];
      print("Top ${i + 1}: ID: ${emp.id} | Name: ${emp.fullName} | Income: ${emp.getIncome().toStringAsFixed(0)}");
    }
  }
}