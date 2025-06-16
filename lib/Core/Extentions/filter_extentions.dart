enum SearchFilterType { name, number, phone, address, nid }

extension SearchFilterTypeExtension on SearchFilterType {
  String get label {
    switch (this) {
      case SearchFilterType.name:
        return "الاسم";
      case SearchFilterType.number:
        return "رقم العائلة";
      case SearchFilterType.phone:
        return "رقم الهاتف";
      case SearchFilterType.address:
        return "العنوان";
      case SearchFilterType.nid:
        return "رقم البطاقة";
    }
  }
}
