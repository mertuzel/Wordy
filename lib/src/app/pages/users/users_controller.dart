import 'package:chat_app_wordy/src/app/pages/users/users_presenter.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UsersController extends Controller {
  final UsersPresenter _presenter;

  UsersController(UserReposistory userReposistory)
      : _presenter = UsersPresenter(userReposistory);

  List<User>? users;
  bool isLoading = true;

  @override
  void onInitState() {
    _presenter.getUsers();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getUsersOnNext = (List<User> response) {
      users = response;
      refreshUI();
    };

    _presenter.getUsersOnError = (e) {};
  }
}
