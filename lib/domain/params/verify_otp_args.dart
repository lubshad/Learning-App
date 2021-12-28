class VerifyOtpArgs {
  final String phoneNumber;
  final OTPVerification otpVerificationType;

  VerifyOtpArgs(this.phoneNumber, this.otpVerificationType);
}


enum OTPVerification {
  createAccount,
  loginUser,
}