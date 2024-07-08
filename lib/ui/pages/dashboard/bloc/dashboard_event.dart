// ignore_for_file: public_member_api_docs, sort_constructors_first
class DashboardEvent {
  const DashboardEvent();
}

class ChangeIndexDashboard extends DashboardEvent {
  final int nextIndex;
  const ChangeIndexDashboard({
    required this.nextIndex,
  });
}
