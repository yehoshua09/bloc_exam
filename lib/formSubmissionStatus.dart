abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {}

class Register extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class RegisterSuccess extends FormSubmissionStatus {}

class RegisterFailed extends FormSubmissionStatus {
  final Object exception;

  RegisterFailed(this.exception);
}

class SubmissionFailed extends FormSubmissionStatus {
  final Object exception;

  SubmissionFailed(this.exception);
}
