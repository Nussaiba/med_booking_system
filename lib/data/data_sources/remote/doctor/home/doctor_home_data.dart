import 'package:med_booking_system/api_link.dart';
import 'package:med_booking_system/core/class/crud.dart';

class DoctorHomeData {
  Crud crud;
  DoctorHomeData(this.crud);
  getDoctorCentersData() async {
    print(
      "==========================${AppLink.doctorCenters}==============================",
    );

    var response = await crud.getData(AppLink.doctorCenters);
    return response.fold((l) => l, (r) => r);
  }

  getAppointsmentData() async {
    print(
      "==========================${AppLink.doctorAppointments}==============================",
    );

    var response = await crud.getData(AppLink.doctorAppointments);
    return response.fold((l) => l, (r) => r);
  }

  getPastAppointsmentData(String? date) async {
    String? selDate;

    date != null ? selDate = '?date=$date' : selDate = '';

    print(
      "==========================${AppLink.doctorPastAppointments}$selDate==============================",
    );

    var response = await crud.getData(
      "${AppLink.doctorPastAppointments}$selDate",
    );
    return response.fold((l) => l, (r) => r);
  }

  getDoctorInvitationtData() async {
    print(
      "==========================${AppLink.doctorInvitations}==============================",
    );

    var response = await crud.getData(AppLink.doctorInvitations);
    return response.fold((l) => l, (r) => r);
  }

  acceptInvitationData(String invitationId) async {
    print(
      "==========================${AppLink.doctorInvitations}/$invitationId/accept==============================",
    );

    var response = await crud.putData(
      "${AppLink.doctorInvitations}/$invitationId/accept",
      null,
    );
    return response.fold((l) => l, (r) => r);
  }

  rejectInvitationData(String invitationId) async {
    print(
      "==========================${AppLink.doctorInvitations}/$invitationId/reject==============================",
    );

    var response = await crud.putData(
      "${AppLink.doctorInvitations}/$invitationId/reject",
      null,
    );
    return response.fold((l) => l, (r) => r);
  }
}
