part of '../setting_item_model.dart';

class ProfileSettingItems {
  final BuildContext context;
  final WidgetRef ref;

  ProfileSettingItems(this.context, this.ref);

  List<SettingItemModel> get items {
    final MyUserInfoModel auth = ref.watch(authInfoProvider);

    return [
      _createStringItem(AppString.name, auth.name),
      _createStringItem(AppString.company, auth.company),
      _createStringItem(AppString.team, auth.team),
      _createStringItem(AppString.phone, auth.phone),
      _createStringItem(AppString.email, auth.email),
      _createStringItem(AppString.fax, auth.fax),
      // _createStringItem(AppString.external, auth.external),

      // SettingItemModel(
      //   title: AppString.external,
      //   onTap: (_) => context.push(SettingEditTextFormScreen.route, extra: items[6]),
      // ),
    ];
  }

  SettingItemModel _createStringItem(String title, String? detail) {
    return SettingItemModel(
      title: title,
      detail: detail ?? '-',
      onTap: (_) => context.push(
        SettingEditTextFormScreen.route,
        extra: SettingItemModel(
          title: title,
          onTap: (p0) {},
        ),
      ),
    );
  }
}
