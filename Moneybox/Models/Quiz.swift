//
//  Quiz.swift
//  Моя копилка сбережений
//
//  Created by Nick Sagan on 13.03.2022.
//

import Foundation

struct Quiz {
    
    let questions: [Question] = [
    Question(question: "Вы решили накопить на достойную старость и ежемесячно откладывать с зарплаты несколько тысяч рублей на специальный счет. А знаете ли вы, в каком возрасте лучше начинать это делать?", answer1: "За 15 лет до пенсии", answer2: "В 30-35 лет", answer3: "в 22-25 лет", correctAnswer: 2),
    Question(question: "Границы открыли и вы отправились отдыхать за рубеж. Какой валютой будете расплачиваться?", answer1: "Заранее обменяю деньги", answer2: "Сниму наличку в банкомате", answer3: "Главное — не картой", correctAnswer: 1),
    Question(question: "Вы наконец-то закрыли кредит и готовы к новым финансовым целям. Как теперь лучше всего поступить?", answer1: "Возьму новый кредит", answer2: "Буду тратить больше", answer3: "Буду больше откладывать", correctAnswer: 3),
    Question(question: "Чтобы увеличить накопления, вы решили их куда-нибудь инвестировать. И наткнулись на предложение — обещают аж 35% годовых. Надо соглашаться?", answer1: "Да, небольшую сумму", answer2: "Нет, звучит сомнительно", answer3: "Однозначно да!", correctAnswer: 2),
    Question(question: "Популярный способ приучить себя копить — метод двух конвертов. Как он работает, для чего предназначены первый и второй конверты?", answer1: "Сдача / накопления", answer2: "Зарплата / подарки", answer3: "Накопления / расходы", correctAnswer: 3),
    Question(question: "Друг просит занять 20 тысяч «до зарплаты». Что ответите на это?", answer1: "Дам без вопросов", answer2: "Дам под процент", answer3: "Дам под расписку", correctAnswer: 3),
    Question(question: "Cобираетесь совершить крупную покупку, но до нужной суммы не хватает 200 тыс. рублей. Решаете взять кредит. Как поступите?", answer1: "Выберу банк с оптимальными условиями, низким процентом и подам заявку", answer2: "Подам заявку сразу в несколько банков — один точно одобрит", answer3: "Возьму микрозаем — точно не откажут", correctAnswer: 1)
    ]
    
    var questionNum: Int = 0
    var score: Int = 0
    
    mutating func check(answer: Int) -> Bool {
        if questions[questionNum].correctAnswer == answer {
            score += 1
        }
        
        questionNum += 1
        
        if questionNum > questions.count - 1 {
            questionNum = questions.count - 1
        }

        if questionNum == questions.count - 1 {
            return true
        } else {
            return false
        }
    }
}
