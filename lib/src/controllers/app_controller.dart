import 'package:arslan/src/models/social_button.dart';
import 'package:arslan/src/repositories/app_respository.dart';
import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  AppController({required this.appRepository});

  final AppRepository appRepository;

  List<SocialButton> socialButtons = [];

  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasError => _error != null;

  Future<void> initialize() async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;

    try {
      await Future.delayed(kThemeAnimationDuration);
      await appRepository.loadSocialButtons().then((buttons) {
        socialButtons = buttons;
      });
      notifyListeners();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
