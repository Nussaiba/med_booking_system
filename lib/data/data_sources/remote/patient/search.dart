import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  fullSearchData(String query) async {
    print(
      "=================================${AppLink.search}?q=$query========================================",
    );
    var response = await crud.getData("${AppLink.search}?q=$query");
    return response.fold((l) => l, (r) => r);
  }

  advancedSearchData(String query, String type, String limit) async {
    print(
      "=================================${AppLink.advancedSearch}?query=$query&type=$type&limit=$limit========================================",
    );
    var response = await crud.getData(
      "${AppLink.advancedSearch}?query=$query&type=$type&limit=$limit",
    );
    return response.fold((l) => l, (r) => r);
  }

  specialtiesSearchData(String query, String limit) async {
    print(
      "=================================${AppLink.specialtiesSearch}?query=$query&limit=$limit========================================",
    );
    var response = await crud.getData(
      "${AppLink.specialtiesSearch}?query=$query&limit=$limit",
    );
    return response.fold((l) => l, (r) => r);
  }

  doctorsSearchData(String query, String limit) async {
    print(
      "=================================${AppLink.doctorsSearch}?query=$query&limit=$limit========================================",
    );

    var response = await crud.getData(
      "${AppLink.doctorsSearch}?query=$query&limit=$limit",
    );
    return response.fold((l) => l, (r) => r);
  }

  centersSearchData(String query, String limit) async {
    print(
      "=================================${AppLink.centersSearch}?query=$query&limit=$limit========================================",
    );
    var response = await crud.getData(
      "${AppLink.centersSearch}?query=$query&limit=$limit",
    );
    return response.fold((l) => l, (r) => r);
  }
}
