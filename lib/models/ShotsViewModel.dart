import 'package:flutter/material.dart';
import 'package:flutter_dribbble/models/AppState.dart';

class ShotsViewModel {
  final ShotsState shotsState;
  final VoidCallback onRefresh;
  final Function() loadNextPage;

  ShotsViewModel({
    this.shotsState,
    this.onRefresh,
    this.loadNextPage
  });
}