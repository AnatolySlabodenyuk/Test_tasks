// объявление переменной (пользователь вводит значение во всплывающее окно)
let number = Number(prompt('Введите число', "Ваше число"));

if(number % 3 == 0 && number % 5 == 0) {
    alert("Fifteen"); // проверка на то, что число делится на 3 и на 5 одновременно
  } else if (number % 5 == 0) {
    alert("Five"); // проверка на то, что число делится на 5 
  } else if( number % 3 == 0) {
    alert("Three"); // проверка на то, что число делится на 3
  } else {
    alert(number); // если проверки не прошли, то возвращается число
  }  