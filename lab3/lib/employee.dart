abstract class Employee {
  final String _id;
  String _fullName;
  double _baseSalary;
 
  Employee(this._id, this._fullName, this._baseSalary);

  String get id => _id;
  String get fullName => _fullName;
  double get baseSalary => _baseSalary;

  set fullName(String newName) => _fullName = newName;
  set baseSalary(double newSalary) {
    if (newSalary > 0) _baseSalary = newSalary;
  }

  double getIncome();

  double getTax() {
    double income = getIncome();
    if (income < 9000000) return 0.0;
    if (income <= 15000000) return income * 0.1;
    return income * 0.12;
  }

  void displayInfo() {
    print("ID: $_id | Name: $_fullName | Base Salary: ${_baseSalary.toStringAsFixed(0)}");
    print("Income: ${getIncome().toStringAsFixed(0)} | Tax: ${getTax().toStringAsFixed(0)}");
  }
}

class AdministrativeEmployee extends Employee {
  AdministrativeEmployee(String id, String fullName, double baseSalary) 
      : super(id, fullName, baseSalary);

  @override
  double getIncome() => baseSalary;
}

class SalesEmployee extends Employee {
  final double _salesRevenue;
  final double _commissionRate;

  SalesEmployee(String id, String fullName, double baseSalary, this._salesRevenue, this._commissionRate) 
      : super(id, fullName, baseSalary);

  @override
  double getIncome() => baseSalary + (_salesRevenue * _commissionRate);
}

class Manager extends Employee {
  final double _responsibilityAllowance;

  Manager(String id, String fullName, double baseSalary, this._responsibilityAllowance) 
      : super(id, fullName, baseSalary);

  @override
  double getIncome() => baseSalary + _responsibilityAllowance;
}