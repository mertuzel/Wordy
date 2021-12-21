import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:chat_app_wordy/src/domain/usecases/getUsers.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class UsersPresenter extends Presenter {
  late Function getUsersOnNext;
  late Function getUsersOnError;

  final GetUsers _getUsers;

  UsersPresenter(UserReposistory userReposistory)
      : _getUsers = GetUsers(userReposistory);

  void getUsers() {
    _getUsers.execute(_GetUsersObserver(this));
  }

  @override
  void dispose() {
    _getUsers.dispose();
  }
}

class _GetUsersObserver extends Observer<List<User>> {
  final UsersPresenter _presenter;

  _GetUsersObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.getUsersOnError(e);
  }

  @override
  void onNext(List<User>? users) {
    _presenter.getUsersOnNext(users);
  }
}
