import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:med_booking_system/core/class/status_request.dart';
import 'package:med_booking_system/core/functions/handlingdata.dart';
import 'package:med_booking_system/core/services/services.dart';
import 'package:med_booking_system/data/data_sources/remote/patient/search.dart';
import 'package:med_booking_system/data/model/patient/search_model.dart';

class SearchController extends GetxController {
  SearchData searchData = SearchData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  late TextEditingController queryController;
  @override
  void onInit() {
    queryController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    queryController.dispose();

    super.dispose();
  }

  void clear() {
    queryController.clear();
    dataSpecialties.clear();
    dataDoctors.clear();
    dataCenters.clear();
    specialtiesList.clear();
    doctorsList.clear();
    centersList.clear();
    results.clear();
    update();
  }

  String type = "all";
  String limit = "10";

  List dataSpecialties = [];
  List dataDoctors = [];
  List dataCenters = [];

  List<SearchSpecialtyModel> specialtiesList = [];
  List<SearchDoctorModel> doctorsList = [];
  List<SearchCenterModel> centersList = [];

  
  List<dynamic> results = [];

  fetchAdvancedSearch(
    String searchText, {
    String? selectedType,
    String? selectedLimit,
  }) async {
    queryController.text = searchText;
    if (queryController.text.length < 2) {
      results.clear();
      update();
      return;
    }

    // إذا المستخدم غيّر الفلتر أو اللِيمِت
    if (selectedType != null) type = selectedType;
    if (selectedLimit != null) limit = selectedLimit;

    // نفرغ القديم
    dataSpecialties.clear();
    dataDoctors.clear();
    dataCenters.clear();
    specialtiesList.clear();
    doctorsList.clear();
    centersList.clear();
    results.clear();

    // نجهّز الحالة
    statusRequest = StatusRequest.loading;
    update();

    // الريكويست
    var response = await searchData.advancedSearchData(
      queryController.text,
      type,
      limit,
    );
    print("===== Search Response: $response =====");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 200) {
        var dataJson = response['data'];

        // specialties
        if (dataJson['specialties'] != null) {
          dataSpecialties.addAll(dataJson['specialties']);
          specialtiesList =
              dataSpecialties
                  .map((e) => SearchSpecialtyModel.fromJson(e))
                  .toList();
        }

        // doctors
        if (dataJson['doctors'] != null) {
          dataDoctors.addAll(dataJson['doctors']);
          doctorsList =
              dataDoctors.map((e) => SearchDoctorModel.fromJson(e)).toList();
        }

        // centers
        if (dataJson['centers'] != null) {
          dataCenters.addAll(dataJson['centers']);
          centersList =
              dataCenters.map((e) => SearchCenterModel.fromJson(e)).toList();
        }

        print("===== Search Doctors: $doctorsList ===============");
        print("===== Search spe: $specialtiesList ============");
        print("===== Search Centers: $centersList ============");
        // اجمع النتائج حسب نوع الفلتر
        results = _mergeResults();
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  List<dynamic> _mergeResults() {
    List<dynamic> all = [];

    if (type == "all") {
      all.addAll(specialtiesList);
      all.addAll(doctorsList);
      all.addAll(centersList);
    } else if (type == "specialties") {
      all.addAll(specialtiesList);
    } else if (type == "doctors") {
      all.addAll(doctorsList);
    } else if (type == "centers") {
      all.addAll(centersList);
    }

    print("=====all  $all======");
    return all;
  }

  bool showFilter = false;

  void toggleFilter() {
    showFilter = !showFilter;
    update();
  }
}

class SearchPage extends StatelessWidget {
  final SearchController controller = Get.put(SearchController());

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder:
          (controller) => Scaffold(
            backgroundColor: const Color(0xFFF8FAFC),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
             
              title: const Text(
                "Search",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: FaIcon(
                    controller.showFilter
                        ? FontAwesomeIcons.xmark
                        : FontAwesomeIcons.slidersH,
                    size: 18,
                    color: Colors.black87,
                  ),
                  onPressed: controller.toggleFilter,
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                
                ),
                child: Column(
                  children: [
                    // Search Box with improved design
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.1),
                            blurRadius: 15,
                            spreadRadius: 1,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 16,
                            color: Color(0xFF3B82F6),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              controller: controller.queryController,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Search doctors, centers...",
                                hintStyle: TextStyle(color: Color(0xFF94A3B8)),
                                border: InputBorder.none,
                              ),
                              onChanged:
                                  (val) => controller.fetchAdvancedSearch(
                                    val,
                                    selectedType: controller.type,
                                    selectedLimit: controller.limit,
                                  ),
                            ),
                          ),
                          if (controller.queryController.text.isNotEmpty)
                            IconButton(
                              icon: const Icon(
                                Icons.clear,
                                size: 18,
                                color: Color(0xFF64748B),
                              ),
                              onPressed: () {
                                controller.clear();
                              },
                            ),
                        ],
                      ),
                    ),

                    // Enhanced Filter Section
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child:
                          controller.showFilter
                              ? Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blueGrey.withOpacity(
                                          0.08,
                                        ),
                                        blurRadius: 12,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                    border: Border.all(
                                      color: const Color(0xFFE2E8F0),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.filter_list_rounded,
                                            size: 18,
                                            color: Color(0xFF3B82F6),
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            "Filters",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const Spacer(),
                                          TextButton(
                                            onPressed: () {
                                              controller.type = 'all';
                                              controller.limit = '10';
                                              controller.fetchAdvancedSearch(
                                                controller.queryController.text,
                                              );
                                            },
                                            child: const Row(
                                              children: [
                                                Icon(
                                                  Icons.refresh,
                                                  size: 16,
                                                  color: Color(0xFF3B82F6),
                                                ),
                                                SizedBox(width: 4),
                                                Text(
                                                  "Reset",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF3B82F6),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 6,
                                                    left: 4,
                                                  ),
                                                  child: Text(
                                                    "Type",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF64748B),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.blueGrey
                                                            .withOpacity(0.05),
                                                        blurRadius: 4,
                                                        offset: const Offset(
                                                          0,
                                                          2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  child: DropdownButtonFormField<
                                                    String
                                                  >(
                                                    value: controller.type,
                                                    isExpanded: true,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 14,
                                                            vertical: 10,
                                                          ),
                                                      filled: true,
                                                      fillColor: const Color(
                                                        0xFFF8FAFC,
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        borderSide:
                                                            const BorderSide(
                                                              color: Color(
                                                                0xFFE2E8F0,
                                                              ),
                                                              width: 1.5,
                                                            ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10,
                                                                ),
                                                            borderSide:
                                                                const BorderSide(
                                                                  color: Color(
                                                                    0xFFE2E8F0,
                                                                  ),
                                                                  width: 1.5,
                                                                ),
                                                          ),
                                                    ),
                                                    items: const [
                                                      DropdownMenuItem(
                                                        value: "all",
                                                        child: Text(
                                                          "All",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: "doctors",
                                                        child: Text(
                                                          "Doctors",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: "specialties",
                                                        child: Text(
                                                          "Specialties",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                      DropdownMenuItem(
                                                        value: "centers",
                                                        child: Text(
                                                          "Centers",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                    onChanged:
                                                        (val) => controller
                                                            .fetchAdvancedSearch(
                                                              controller
                                                                  .queryController
                                                                  .text,
                                                              selectedType: val,
                                                              selectedLimit:
                                                                  controller
                                                                      .limit,
                                                            ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 6,
                                                    left: 4,
                                                  ),
                                                  child: Text(
                                                    "Limit",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF64748B),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.blueGrey
                                                            .withOpacity(0.05),
                                                        blurRadius: 4,
                                                        offset: const Offset(
                                                          0,
                                                          2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                            vertical: 8,
                                                          ),
                                                      hintText: "10",
                                                      hintStyle:
                                                          const TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                      filled: true,
                                                      fillColor: const Color(
                                                        0xFFF8FAFC,
                                                      ),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              10,
                                                            ),
                                                        borderSide:
                                                            const BorderSide(
                                                              color: Color(
                                                                0xFFE2E8F0,
                                                              ),
                                                              width: 1.5,
                                                            ),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  10,
                                                                ),
                                                            borderSide:
                                                                const BorderSide(
                                                                  color: Color(
                                                                    0xFFE2E8F0,
                                                                  ),
                                                                  width: 1.5,
                                                                ),
                                                          ),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged:
                                                        (val) => controller
                                                            .fetchAdvancedSearch(
                                                              controller
                                                                  .queryController
                                                                  .text,
                                                              selectedType:
                                                                  controller
                                                                      .type,
                                                              selectedLimit:
                                                                  val,
                                                            ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              : const SizedBox.shrink(),
                    ),

                    const SizedBox(height: 16),

                    // Results Section with enhanced design
                    Expanded(
                      child:
                          controller.statusRequest == StatusRequest.loading
                              ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFF3B82F6),
                                      ),
                                      strokeWidth: 2.5,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      "Searching...",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : controller.statusRequest ==
                                  StatusRequest.failure
                              ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline_rounded,
                                      size: 48,
                                      color: Colors.grey[400],
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      "Failed to fetch data",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        controller.fetchAdvancedSearch(
                                          controller.queryController.text,
                                          selectedType: controller.type,
                                          selectedLimit: controller.limit,
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFF3B82F6,
                                        ),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 8,
                                        ),
                                      ),
                                      child: const Text(
                                        "Try Again",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : controller.results.isEmpty
                              ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search_off_rounded,
                                      size: 48,
                                      color: Colors.grey[400],
                                    ),
                                    const SizedBox(height: 12),
                                    const Text(
                                      "No results found",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    if (controller
                                        .queryController
                                        .text
                                        .isNotEmpty)
                                      Text(
                                        "Try a different search term",
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 13,
                                        ),
                                      ),
                                  ],
                                ),
                              )
                              : ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.results.length,
                                separatorBuilder:
                                    (_, __) => const SizedBox(height: 10),
                                itemBuilder: (context, index) {
                                  final item = controller.results[index];
                                  IconData icon;
                                  Color iconColor;
                                  String title;
                                  String? subtitle;

                                  if (item is SearchDoctorModel) {
                                    icon = FontAwesomeIcons.userMd;
                                    iconColor = const Color(0xFF3B82F6);
                                    title = item.name;
                                    subtitle = item.specialty;
                                  } else if (item is SearchSpecialtyModel) {
                                    icon = FontAwesomeIcons.star;
                                    iconColor = const Color(0xFFF59E0B);
                                    title = item.name;
                                    subtitle = "${item.doctorsCount} doctors";
                                  } else if (item is SearchCenterModel) {
                                    icon = FontAwesomeIcons.hospital;
                                    iconColor = const Color(0xFF10B981);
                                    title = item.name;
                                    subtitle = item.location;
                                  } else {
                                    return const SizedBox.shrink();
                                  }

                                  return AnimatedScale(
                                    duration: const Duration(milliseconds: 350),
                                    scale: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.blueGrey.withOpacity(
                                              0.07,
                                            ),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                        border: Border.all(
                                          color: const Color(0xFFF1F5F9),
                                          width: 1,
                                        ),
                                      ),
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                        leading: Container(
                                          width: 44,
                                          height: 44,
                                          decoration: BoxDecoration(
                                            color: iconColor.withOpacity(0.12),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            icon,
                                            color: iconColor,
                                            size: 18,
                                          ),
                                        ),
                                        title: Text(
                                          title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black87,
                                            fontSize: 15,
                                          ),
                                        ),
                                        subtitle:
                                            subtitle != null &&
                                                    subtitle.isNotEmpty
                                                ? Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                        top: 4,
                                                      ),
                                                  child: Text(
                                                    subtitle,
                                                    style: const TextStyle(
                                                      color: Color(0xFF64748B),
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                )
                                                : null,
                                        trailing: Container(
                                          width: 34,
                                          height: 34,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF1F5F9),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.arrow_forward_rounded,
                                            size: 16,
                                            color: Color(0xFF64748B),
                                          ),
                                        ),
                                        onTap: () {
                                          // Add navigation logic here
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
