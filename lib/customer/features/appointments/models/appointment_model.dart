class AppointmentModel {
  final String title;
  final String provider;
  final String time;
  final String date;
  final String status;

  AppointmentModel({
    required this.date,
    required this.title,
    required this.provider,
    required this.time,
    required this.status,
  });
}
final List<AppointmentModel> appointments = [
  AppointmentModel(
    title: 'Advanced Diagnostic Screening',
    provider: 'Dr. James Wilson',
    time: '09:00 - 09:30',
    date: '30/06/50',
    status: 'Pending',
  ),
  AppointmentModel(
    title: 'Dental Checkup',
    provider: 'Dr. Emily Smith',
    time: '10:00 - 10:30',
    date: '30/06/50',
    status: 'Confirmed',
  ),
  AppointmentModel(
    title: 'Eye Examination',
    provider: 'Dr. Lisa Johnson',
    time: '11:00 - 11:30',
    date: '30/06/50',
    status: 'Cancelled',
  ),
  AppointmentModel(
    title: 'Physiotherapy Session',
    provider: 'Dr. Ethan Brown',
    time: '12:00 - 12:45',
    date: '01/07/50',
    status: 'Confirmed',
  ),
  AppointmentModel(
    title: 'ENT Consultation',
    provider: 'Dr. Olivia Davis',
    time: '13:00 - 13:30',
    date: '01/07/50',
    status: 'Pending',
  ),
  AppointmentModel(
    title: 'Cardiology Checkup',
    provider: 'Dr. Benjamin Clark',
    time: '14:00 - 14:30',
    date: '01/07/50',
    status: 'Cancelled',
  ),
  AppointmentModel(
    title: 'Neurology Evaluation',
    provider: 'Dr. Sophia Lewis',
    time: '15:00 - 15:30',
    date: '02/07/50',
    status: 'Confirmed',
  ),
  AppointmentModel(
    title: 'Pediatric Follow-up',
    provider: 'Dr. Mason Walker',
    time: '16:00 - 16:20',
    date: '02/07/50',
    status: 'Pending',
  ),
  AppointmentModel(
    title: 'Orthopedic Review',
    provider: 'Dr. Ava Hall',
    time: '08:30 - 09:00',
    date: '03/07/50',
    status: 'Confirmed',
  ),
  AppointmentModel(
    title: 'Skin Allergy Test',
    provider: 'Dr. Logan Allen',
    time: '09:30 - 10:00',
    date: '03/07/50',
    status: 'Pending',
  ),
  AppointmentModel(
    title: 'Routine Blood Work',
    provider: 'Dr. Mia Young',
    time: '10:15 - 10:45',
    date: '03/07/50',
    status: 'Confirmed',
  ),
  AppointmentModel(
    title: 'General Health Review',
    provider: 'Dr. Jacob Wright',
    time: '11:00 - 11:30',
    date: '04/07/50',
    status: 'Cancelled',
  ),
  AppointmentModel(
    title: 'Psychiatric Counseling',
    provider: 'Dr. Harper King',
    time: '11:30 - 12:00',
    date: '04/07/50',
    status: 'Confirmed',
  ),
  AppointmentModel(
    title: 'Nutrition Consultation',
    provider: 'Dr. Henry Green',
    time: '12:15 - 12:45',
    date: '05/07/50',
    status: 'Pending',
  ),
  AppointmentModel(
    title: 'Dermatology Review',
    provider: 'Dr. Ella Adams',
    time: '13:00 - 13:30',
    date: '05/07/50',
    status: 'Confirmed',
  ),
  AppointmentModel(
    title: 'Hearing Test',
    provider: 'Dr. Samuel Baker',
    time: '13:45 - 14:15',
    date: '05/07/50',
    status: 'Pending',
  ),
  AppointmentModel(
    title: 'Cholesterol Check',
    provider: 'Dr. Scarlett Turner',
    time: '14:30 - 15:00',
    date: '06/07/50',
    status: 'Confirmed',
  ),
  AppointmentModel(
    title: 'Post-Surgery Follow-up',
    provider: 'Dr. David Campbell',
    time: '15:15 - 15:45',
    date: '06/07/50',
    status: 'Cancelled',
  ),
  AppointmentModel(
    title: 'Mental Health Session',
    provider: 'Dr. Grace Mitchell',
    time: '16:00 - 16:30',
    date: '06/07/50',
    status: 'Confirmed',
  ),
  AppointmentModel(
    title: 'Immunization Check',
    provider: 'Dr. Luke Perez',
    time: '17:00 - 17:30',
    date: '06/07/50',
    status: 'Pending',
  ),
];
