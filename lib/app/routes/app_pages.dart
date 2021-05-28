import 'package:doan/app/modules/activity/bindings/activity.binding.dart';
import 'package:doan/app/modules/activity/views/activity.view.dart';
import 'package:doan/app/modules/activity/views/extracurricular_activity.view.dart';
import 'package:doan/app/modules/auth/bindings/auth.binding.dart';
import 'package:doan/app/modules/auth/views/splash.view.dart';
import 'package:doan/app/modules/chat/views/list_user.dart';
import 'package:doan/app/modules/features/bindings/feature.binding.dart';
import 'package:doan/app/modules/features/views/feature.view.dart';
import 'package:doan/app/modules/home/bindings/home.binding.dart';
import 'package:doan/app/modules/home/views/album_detail.dart';
import 'package:doan/app/modules/home/views/home.view.dart';
import 'package:doan/app/modules/schedule/binding/schedule.binding.dart';
import 'package:doan/app/modules/schedule/view/schedule.view.dart';
import 'package:doan/app/modules/tuition/views/tuition.view.dart';
import 'package:doan/app/modules/user_access/bindings/user_access.binding.dart';
import 'package:doan/app/modules/user_access/views/user_access.view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:doan/app/modules/chat/bindings/chat.binding.dart';
import 'package:doan/app/modules/chat/views/chat.view.dart';
import 'package:doan/app/modules/health_management/bindings/detail_health_student.binding.dart';
import 'package:doan/app/modules/health_management/bindings/health_management.binding.dart';
import 'package:doan/app/modules/health_management/views/detail_health_student.view.dart';
import 'package:doan/app/modules/health_management/views/health_management.view.dart';
import '../modules/auth/views/login.view.dart';
import 'package:doan/app/modules/profile/bindings/profile.binding.dart';
import 'package:doan/app/modules/profile/views/profile.view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: Routes.SCHEDULE,
      page: () => ScheduleView(),
      binding: ScheduleBinding(),
    ),

    GetPage(
      name: Routes.ACTIVITY,
      page: () => ActivityView(),
      binding: ActivityBinding(),
    ),

    GetPage(
      name: Routes.FEATURE,
      page: () => FeaturesView(),
      binding: FeaturesBinding(),
    ),

    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.USER_ACCESS,
      page: () => UserAccessView(),
      binding: UserAccessBinding(),
    ),

    GetPage(
      name: Routes.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.HEALTH_MANAGEMENT,
      page: () => HealthManagementView(),
      binding: HeathManagementBinding(),
    ),

    GetPage(
      name: Routes.DETAIL_HEALTH_STUDENT,
      page: () => DetailHealthStudentView(),
      binding: DetailHeathStudentBinding(),
    ),
    GetPage(
      name: Routes.EXTRACURRICULAR_ACTIVITY,
      page: () => ExtracurricularActivityView(),
      binding: ActivityBinding(),
    ),

    GetPage(
      name: Routes.ALBUM,
      page: () => DetailAlbumView(),
    ),

    GetPage(
      name: Routes.TUITION,
      page: () => TuitionView(),
    ),

    GetPage(
      name: Routes.LIST_USER,
      page: () => ListUserView(),
      binding: ChatBinding()
    )
  ];
}
