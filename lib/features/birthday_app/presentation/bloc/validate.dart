class DefaultValidator {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return "Введите имя";
    }

    String pattern = r'^[a-zA-Zа-яА-Я]+$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(name)) {
      return "Имя должно сордержать только символы";
    }
    return null;
  }

  static String? validateSurname(String? surname) {
    if (surname == null || surname.isEmpty) {
      return "Введите фамилию";
    }

    String pattern = r'^[a-zA-Zа-яА-Я]+$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(surname)) {
      return "Фамилия должно сордержать только символы";
    }
    return null;
  }

  static String? validateNumber(String? number) {
    if (number == null || number.isEmpty) {
      return "Введите номер";
    }

    final RegExp regex = RegExp(r'^\+\d{1,3}\s\d{1,3}[-\s\d]+$');
    if (!regex.hasMatch(number)) {
      return "Номер должен быть в формате +7 *** *** ** **";
    }
    return null;
  }

  static String? validateDate(String? date) {
    if (date == null || date.isEmpty) {
      return "Введите Дату";
    }
    return null;
  }

  static String? validateProfession(String? profession) {
    if (profession == null || profession.isEmpty) {
      return "Введите профессию";
    }
    return null;
  }


  static String getYearWord(int years) {
      if (years % 10 == 1 && years % 100 != 11) {
        return "год";
      } else if ((years % 10 >= 2 && years % 10 <= 4) &&
          !(years % 100 >= 12 && years % 100 <= 14)) {
        return "года";
      } else {
        return "лет";
      }
    }

    static int calculateAge(DateTime birthDate) {
      final now = DateTime.now();
      int age = now.year - birthDate.year;
      if (now.month < birthDate.month ||
          (now.month == birthDate.month && now.day < birthDate.day)) {
        age--;
      }
      return age;
    }
}
