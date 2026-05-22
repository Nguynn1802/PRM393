import 'dart:io';
import 'package:lab3/employee.dart';
import 'package:lab3/employee_manager.dart';

void generateMockData(EmployeeManager manager) {
  manager.addEmployee(AdministrativeEmployee("EMP01", "Nguyen Van A", 7000000));
  manager.addEmployee(AdministrativeEmployee("EMP02", "Tran Thi B", 8500000));
  manager.addEmployee(SalesEmployee("EMP03", "Le Van C", 5000000, 50000000, 0.1)); 
  manager.addEmployee(SalesEmployee("EMP04", "Pham Minh D", 6000000, 90000000, 0.12)); 
  manager.addEmployee(Manager("EMP05", "Hoang Lan E", 12000000, 4000000)); 
  manager.addEmployee(Manager("EMP06", "Do Hoang G", 8000000, 2000000)); 
  print("[SYSTEM] Mock data initialized successfully.");
}

void main() {
  var manager = EmployeeManager();

  generateMockData(manager);

  while (true) {
    print("\n========= EMPLOYEE SALARY MANAGEMENT SYSTEM =========");
    print("1. Input a list of employees");
    print("2. Display the employee list");
    print("3. Search for an employee by ID");
    print("4. Delete an employee by ID");
    print("5. Update employee information");
    print("6. Search employees by income range");
    print("7. Sort employees by full name");
    print("8. Sort employees by total income");
    print("9. Display the top 5 employees with highest income");
    print("0. Exit program");
    stdout.write("Selection (0-9): ");
    
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write("Employee type (1: Admin, 2: Sales, 3: Manager): ");
        var type = stdin.readLineSync();
        
        stdout.write("ID: ");
        var id = stdin.readLineSync() ?? "";
        stdout.write("Full Name: ");
        var name = stdin.readLineSync() ?? "";
        stdout.write("Base Salary: ");
        var baseSalary = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

        if (type == '1') {
          manager.addEmployee(AdministrativeEmployee(id, name, baseSalary));
        } 
        else if (type == '2') {
          stdout.write("Sales Revenue: ");
          var salesRevenue = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;
          stdout.write("Commission Rate: ");
          var commissionRate = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

          manager.addEmployee(SalesEmployee(id, name, baseSalary, salesRevenue, commissionRate));
        } 
        else if (type == '3') {
          stdout.write("Responsibility Allowance: ");
          var responsibilityAllowance = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;

          manager.addEmployee(Manager(id, name, baseSalary, responsibilityAllowance));
        } else {
          print("Error: Invalid employee type.");
        }
        break;

      case '2':
        manager.displayAllEmployees();
        break;

      case '3':
        stdout.write("Enter ID to search: ");
        var searchId = stdin.readLineSync() ?? "";
        manager.searchEmployeeById(searchId);
        break;

      case '4':
        stdout.write("Enter ID to delete: ");
        var deleteId = stdin.readLineSync() ?? "";
        manager.deleteEmployeeById(deleteId);
        break;

      case '5':
        stdout.write("Enter ID to update: ");
        var updateId = stdin.readLineSync() ?? "";
        stdout.write("New Full Name: ");
        var newName = stdin.readLineSync() ?? "";
        stdout.write("New Base Salary: ");
        var newSalary = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;
        manager.updateEmployee(updateId, newName, newSalary);
        break;

      case '6':
        stdout.write("Minimum Income: ");
        var min = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;
        stdout.write("Maximum Income: ");
        var max = double.tryParse(stdin.readLineSync() ?? "") ?? 0.0;
        manager.searchByIncomeRange(min, max);
        break;

      case '7':
        manager.sortByFullName();
        break;

      case '8':
        manager.sortByTotalIncome();
        break;

      case '9':
        manager.displayTop5HighestIncome();
        break;

      case '0':
        print("Exiting program. Goodbye!");
        return;

      default:
        print("Error: Invalid choice. Select from 0 to 9.");
    }
  }
}