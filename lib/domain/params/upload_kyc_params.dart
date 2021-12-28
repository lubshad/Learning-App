import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class UploadKycParams extends Equatable {
  final KYCType kycType;
  final DateTime? expDate;
  final Map<String, File> images;
  final String sessionId;
  final String userId;

  const UploadKycParams(
      {required this.sessionId,
      required this.userId,
      required this.kycType,
      required this.expDate,
      required this.images});

  @override
  List<Object?> get props => [kycType, expDate];

  Map<String, dynamic> toMap() {
    return {
      'kyc_type': kycType.index,
      "session_id" :sessionId,
      "user_id" :userId,
      'exp_date':
          expDate == null ? "" : DateFormat("yyyy-MM-dd").format(expDate!),
    };
  }
}

enum KYCType { none, tradingLicense, vatCertificate }



