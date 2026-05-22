import 'employee.dart';

class EmployeeManager {
  final Map<String, Employee> _employees = {};

  void addEmployee(Employee emp) {
    if (_employees.containsKey(emp.id)) {
      print("❌ Lỗi: ID nhân viên ${emp.id} đã tồn tại trong hệ thống!");
      return;
    }
    _employees[emp.id] = emp;
    print("✅ Đã thêm nhân viên ${emp.fullName} thành công.");
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
    Employee? emp = _employees[id];
    if (emp == null) {
      print("❌ Không tìm thấy nhân viên nào có ID: $id");
    } else {
      print("🔍 Đã tìm thấy nhân viên:");
      emp.displayInfo();
    }
  }

  void deleteEmployeeById(String id) {
    Employee? removedEmp = _employees.remove(id);
    if (removedEmp == null) {
      print("❌ Xóa thất bại! Không tồn tại nhân viên có ID: $id.");
    } else {
      print("🗑️ Đã xóa thành công nhân viên ${removedEmp.fullName} (ID: $id).");
    }
  }

  void updateEmployee(String id, String newName, double newSalary) {
    Employee? emp = _employees[id];
    if (emp == null) {
      print("❌ Không tìm thấy nhân viên có ID: $id để cập nhật.");
      return;
    }
    emp.fullName = newName;
    emp.baseSalary = newSalary;
    print("✅ Đã cập nhật thông tin mới thành công.");
  }

  void searchByIncomeRange(double minIncome, double maxIncome) {
    var results = _employees.values.where((emp) {
      double income = emp.getIncome();
      return income >= minIncome && income <= maxIncome;
    }).toList();

    if (results.isEmpty) {
      print("❌ Không có nhân viên nào có thu nhập trong khoảng từ $minIncome đến $maxIncome.");
      return;
    }
    print("\n🔍 --- EMPLOYEES IN INCOME RANGE ---");
    for (var emp in results) {
      emp.displayInfo();
      print("-" * 30);
    }
  }

  void sortByFullName() {
    List<Employee> empList = _employees.values.toList();
    empList.sort((a, b) => a.fullName.compareTo(b.fullName));
    print("\n🔤 --- LIST SORTED BY FULL NAME (A-Z) ---");
    for (var emp in empList) {
      print("Tên: ${emp.fullName} | ID: ${emp.id} | Thu nhập: ${emp.getIncome().toStringAsFixed(0)}");
    }
  }

  void sortByTotalIncome() {
    List<Employee> empList = _employees.values.toList();
    empList.sort((a, b) => a.getIncome().compareTo(b.getIncome()));
    print("\n💰 --- LIST SORTED BY TOTAL INCOME (ASCENDING) ---");
    for (var emp in empList) {
      print("ID: ${emp.id} | Tên: ${emp.fullName} | Thu nhập: ${emp.getIncome().toStringAsFixed(0)}");
    }
  }

  void displayTop5HighestIncome() {
    List<Employee> empList = _employees.values.toList();
    empList.sort((a, b) => b.getIncome().compareTo(a.getIncome()));
    var top5 = empList.take(5).toList();
    print("\n🏆 --- TOP 5 HIGHEST INCOME EMPLOYEES ---");
    int rank = 1;
    for (var emp in top5) {
      print("Top $rank: ID: ${emp.id} | Tên: ${emp.fullName} | Thu nhập: ${emp.getIncome().toStringAsFixed(0)}");
      rank++;
    }
  }
}