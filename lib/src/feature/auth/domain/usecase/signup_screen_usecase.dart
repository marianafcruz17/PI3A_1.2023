import 'package:marmita_social/src/feature/auth/data/repository/signup_screen_repository.dart';
import '../model/signup.dart';

class SignupUseCase {
    final repository = SignupScreenRepository();

    List validateName(String name) {
        if (name.isEmpty) {
            return [false, "O nome não pode estar em branco."];
        }

        RegExp validName =
            RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");

        if (validName.hasMatch(name)) {
            return [true];
        } else {
            return [false, "Insira um nome válido."];
        }
    }

    List validateBirth(String birth) {
        if (birth.isEmpty) {
            return [false, "A data de nascimento não pode estar em branco."];
        }
        
        return [true];
    }

    List validateFoodOption(String foodOption) {
        if (foodOption.isEmpty) {
            return [false, "A opção alimentar não pode estar em branco."];
        }

        return [true];
    }

    List validateEmail(String email) {
        if (email.isEmpty) {
            return [false, "O email não pode estar em branco."];
        }

        RegExp validEmail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

        if (validEmail.hasMatch(email)) {
            return [true];
        } else {
            return [false, "Insira um email válido."];
        }
    }

    List validateUsername(String username) {
        if (username.isEmpty) {
            return [false, "O nome de usuário não pode estar em branco."];
        }

        if (username.contains(' ')) {
            return [false, "O nome de usuario não pode ter espaço."];
        }

        if (username.length < 5) {
            return [false, "O nome de usuario tem que ter no mínimo 5 caracteres."];
        }

        return [true];
    }

    List validatePassword(String password) {
        if (password.isEmpty) {
            return [false, "A senha não pode estar em branco."];
        }

        RegExp validPasswordUpperCase = RegExp(r"^(?=.*[A-Z])");

        RegExp validPasswordLowerCase = RegExp(r"^(?=.*[a-z])");

        RegExp validPasswordOneDigit = RegExp(r"^(?=.*?[0-9])");

        RegExp validPasswordSpecialCharacter = RegExp(r"^(?=.*?[!@#\%$&*~])");

        RegExp validPasswordMinLength = RegExp(r"^.{8,}");

        /*if (!validPasswordUpperCase.hasMatch(password)) {
            return [false, 'A senha precisa ter pelo menos uma letra maiúscula.'];
        }

        if (!validPasswordLowerCase.hasMatch(password)) {
            return [false, 'A senha precisa ter pelo menos uma letra minúscula.'];
        }

        if (!validPasswordOneDigit.hasMatch(password)) {
            return [false, 'A senha precisa ter pelo menos um número.'];
        }

        if (!validPasswordSpecialCharacter.hasMatch(password)) {
            return [false, 'A senha precisa ter pelo menos um caracter especial.'];
        }

        if (!validPasswordMinLength.hasMatch(password)) {
            return [false, 'A senha precisa ter no mínimo 8 caracteres.'];
        }
*/
        return [true];
    }

    List validateConfirmPassword(String password, String confirm_password) {
        if (confirm_password.isEmpty) {
            return [false, "A confirmação da senha não pode estar em branco."];
        }

        if (password != confirm_password) {
            return [false, "A senha e a confirmação de senha não são as mesmas."];
        }

        return [true];
    }

    List validateAllFields(String username,/* String name,*/ String email,
        String birth, String password, String confirmPassword) {
            if (!validateUsername(username)[0]) {
                return validateUsername(username);
            }

            /* if (!validateName(name)[0]) {
                return validateName(name);
            } */

            if (!validateEmail(email)[0]) {
                return validateEmail(email);
            }

            if (!validateBirth(birth)[0]) {
                return validateBirth(birth);
            }

            if (!validatePassword(password)[0]) {
                return validatePassword(password);
            }

            if (!validateConfirmPassword(password, confirmPassword)[0]) {
                return validateConfirmPassword(password, confirmPassword);
            }

            return [true];
        }

    Future<SignupUser> signup(String username, /*String name,*/ String email, String cep,  String birth, String password,  String confirmPassword ,List<String> intoleranciaAlimentar, List<String> restricaoAlimentar ) {
            var respValidateAllFields = validateAllFields(
                username,/* name,*/ email, birth, password, confirmPassword );
            
            if (!respValidateAllFields[0]) {
                final msg = respValidateAllFields[1];
                return Future.error(msg);
            } else {
                return repository
                    .signup(SignupUser(username, /*name ,*/  email,cep, birth, password ,confirmPassword, intoleranciaAlimentar, restricaoAlimentar ));
            }
        }
}
