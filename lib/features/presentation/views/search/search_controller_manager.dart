import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';

enum SearchCategory { name, email, company, team, phone, fax }

// class SearchControllerManager extends BasicControllerManager {
//   SearchControllerManager(this.ref) : super(type: ControllerType.search);

//   final NotifierProviderRef<BasicControllerManager> ref;

//   final TextEditingController search = TextEditingController();
//   final DebounceService _debounceService = DebounceService(delay: const Duration(milliseconds: 500));

//   void onSearch(String query) {
//     _debounceService(() {
//       performSearch(query);
//     });
//   }

//   void performSearch(String query) {
//     final List<UserInfoModel> wallet = ref.read(walletProvider);
//     final Map<SearchCategory, List<UserInfoModel>> results = {for (var category in SearchCategory.values) category: []};

//     for (var user in wallet) {
//       for (var category in SearchCategory.values) {
//         if (_matchCategory(user, category, query)) {
//           results[category]!.add(user);
//         }
//       }
//     }

//     final searchResults = results.entries.map((e) => SearchState(title: e.key.name, result: e.value)).toList();

//     ref.read(searchProvider.notifier).update(searchResults);
//   }

//   @override
//   void dispose() {
//     _debounceService.dispose();
//     search.dispose();
//   }
// }

class SearchState {
  SearchState({required this.title, required this.result});

  final String title;
  final List<OtherUserInfoModel> result;

  static List<SearchState> init() {
    return [
      SearchState(title: 'name', result: []),
      SearchState(title: 'email', result: []),
      SearchState(title: 'company', result: []),
      SearchState(title: 'team', result: []),
      SearchState(title: 'phone', result: []),
      SearchState(title: 'fax', result: []),
    ];
  }
}

bool _matchCategory(OtherUserInfoModel user, SearchCategory category, String query) {
  return switch (category) {
    SearchCategory.name => user.name.toLowerCase().contains(query.toLowerCase()),
    SearchCategory.email => user.email.toLowerCase().contains(query.toLowerCase()),
    SearchCategory.company => user.company.toLowerCase().contains(query.toLowerCase()),
    SearchCategory.team => user.team.toLowerCase().contains(query.toLowerCase()),
    SearchCategory.phone => user.phone.toLowerCase().contains(query.toLowerCase()),
    SearchCategory.fax => user.fax.toLowerCase().contains(query.toLowerCase()),
  };
}
