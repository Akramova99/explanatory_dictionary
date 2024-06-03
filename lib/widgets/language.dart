// This code defines a map containing the words in Uzbek, English, and Russian

final languageMap = {
  'uz': {
    "So'z qidirish": "So'z qidirish",
    "So'z qo'shish": "So'z qo'shish",
    "So'z o'chirish": "So'z o'chirish",
    "Til tanlash": "Til tanlash",
    "Natija!": "Natija!",
    "Atama": "Atama",
    'Kiriting': 'Kiriting',
    "Tasnifi": "Tasnifi",
    "Qo'shish": "Qo'shish",
    "Muvaffaqiyatli saqlandi": "Muvaffaqiyatli saqlandi",
    "Muvaffaqiyatli o'chirildi": "Muvaffaqiyatli o'chirildi",
    "Ushbu bo'limdan faqat adminstratorlar foydalana oladi!":
        "Ushbu bo'limdan faqat adminstratorlar foydalana oladi!",
    "Parolni kiriting": "Parolni kiriting",
    "Qidiruv": "Qidiruv",
    "Ortga": "Ortga"
  },
  'en': {
    "So'z qidirish": "word search",
    "So'z qo'shish": "add words",
    "So'z o'chirish": "delete word",
    "Til tanlash": "language selection",
    "Natija!": "Result!",
    "Atama": "Term",
    'Kiriting': 'Enter',
    "Tasnifi": "Classification",
    "Qo'shish": "Insert",
    "Muvaffaqiyatli saqlandi": "successfully saved",
    "Muvaffaqiyatli o'chirildi": "successfully deleted",
    "Ushbu bo'limdan faqat adminstratorlar foydalana oladi!":
        "Only administrators can use this section!",
    "Parolni kiriting": "Enter the password",
    "Ortga": "Back",
    "Qidiruv": "Search",
  },
  'ru': {
    "So'z qidirish": "Поиск слов",
    "So'z qo'shish": "Добавить слово",
    "So'z o'chirish": "Удалить слово",
    "Til tanlash": "Выбор языка",
    "Natija!": "Результат!",
    "Atama": "Термин",
    'Kiriting': 'Введите',
    "Tasnifi": "Классификация",
    "Qo'shish": "Вставить",
    "Muvaffaqiyatli saqlandi": "Успешно сохранено",
    "Muvaffaqiyatli o'chirildi": "Успешно удалено",
    "Ushbu bo'limdan faqat adminstratorlar foydalana oladi!":
        "Только администраторы могут использовать этот раздел!",
    "Parolni kiriting": "Введите пароль",
    "Ortga": "Назад",
    "Qidiruv":"Поиск"
  },
};

// Function to get the word in a specific language
String getWord(String language, String key) {
  if (languageMap.containsKey(language) &&
      languageMap[language]!.containsKey(key)) {
    return languageMap[language]![key]!;
  } else {
    return 'Translation not found';
  }
}

// Example usage
String uzbekLanguage = getWord('uzbek', 'language');
String englishLife = getWord('english', 'life');
String russianBeauty = getWord('russian', 'beauty');
