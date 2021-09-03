import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_dev_challenge/core/core.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

part 'sliding_sheet_event.dart';
part 'sliding_sheet_state.dart';

class SlidingSheetBloc extends Bloc<SlidingSheetEvent, SlidingSheetState> {
  SlidingSheetBloc() : super(SlidingSheetInitial());

  @override
  Stream<SlidingSheetState> mapEventToState(
    SlidingSheetEvent event,
  ) async* {
    if (event is OpenSlidingSheetEvent) {
      await showSlidingBottomSheet(
        event.context,
        resizeToAvoidBottomInset: false,
        builder: (context) {
          return SlidingSheetDialog(
            elevation: 8,
            cornerRadius: 30,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.4, 0.9],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Material(
                color: AppColors.backgroundWhite,
                child: event.page,
              );
            },
          );
        },
      );
    }
  }
}
