// دي الحالة الأم اللي كل الحالات بتورث منها
abstract class AuthState {}

// 1. حالة البداية خالص (أول ما تفتح الشاشة)
class AuthInitial extends AuthState {}

// 2. حالة التحميل (لما اليوزر يدوس على زرار Login والدايرة بتلف)
class AuthLoading extends AuthState {}

// 3. حالة النجاح (لما يسجل دخول صح عشان ننقله للشاشة الرئيسية)
class AuthSuccess extends AuthState {}

// 4. حالة الخطأ (لو الباسورد غلط أو نسي يكتب الإيميل)
class AuthError extends AuthState {
  final String errorMessage;
  AuthError(this.errorMessage);
}