import 'package:flutter/foundation.dart';
import 'project_material.dart';

class MaterialsProvider with ChangeNotifier {
  final List<ProjectMaterial> _materials = [
    ProjectMaterial(name: 'Concrete', quantity: 100),
    ProjectMaterial(name: 'Steel Rebar', quantity: 50),
    ProjectMaterial(name: 'Wood Planks', quantity: 200),
    ProjectMaterial(name: 'Nails', quantity: 500),
    ProjectMaterial(name: 'Paint', quantity: 30),
  ];

  List<ProjectMaterial> get materials => _materials;

  void addMaterial(ProjectMaterial material) {
    _materials.add(material);
    notifyListeners();
  }
}
