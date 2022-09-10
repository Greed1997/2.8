//
//  DataManager.swift
//  2.8
//
//  Created by Александр on 13.08.2022.
//

class QuestionDataManager {
    static let shared = QuestionDataManager()
    
    let philosophyQuestions = [
        Question(title: "Кант сформулировал категорический императив, рассматривая вопросы:", answer: Answer(correct: "морали", wrong: "познания")),
        Question(title: "Проект идеального государства, во главе которого должны стоять философы, разработал:", answer: Answer(correct: "Платон", wrong: "Аристотель"))
    ]
    let mathQuestions = [
        Question(title: "Отношение двух однородных функций одинаковых степеней есть однородная функция", answer: Answer(correct: "Нулевой степени", wrong: "Первой степени")),
        Question(title: "Чему равен предел последовательности значений функции, которая является бесконечно малой величиной?", answer: Answer(correct: "0", wrong: "Не существует"))
    ]
    let physicQuestions = [
        Question(title: "Если кто-то нажимает пальцем на камень, то и палец также нажимается камнем». Этим примером И.Ньютон подтверждает", answer: Answer(correct: "Третий закон Ньютона", wrong: "Первый закон Ньютона")),
        Question(title: "Если предмет расположен перед собирающей линзой на расстоянии 5 см, а изображение получается за линзой на расстоянии 10 см, то фокусное расстояние этой линзы равно ...", answer: Answer(correct: "1/30 м", wrong: "0.5 м")),
        Question(title: "Какой металл является самым тугоплавким", answer: Answer(correct: "Вольфрам", wrong: "Титан"))
    ]
    
    private init() {}
}
class GreatPersonDataManager {
    static let shared = GreatPersonDataManager()
    
    let philosophers = [
        GreatPerson(name: "Иммануил Кант", image: "Иммануил Кант"),
        GreatPerson(name: "Аристотель", image: "Аристотель"),
        GreatPerson(name: "Сократ", image: "Сократ"),
        GreatPerson(name: "Платон", image: "Платон")
    ]
    let mathematicians = [
        GreatPerson(name: "Евклид", image: "Евклид"),
        GreatPerson(name: "Жозеф Луи Лагранж", image: "Жозеф Луи Лагранж"),
        GreatPerson(name: "Огюстен Луи Коши", image: "Огюстен Луи Коши")
    ]
    let physicians = [
        GreatPerson(name: "Исаак Ньютон", image: "Исаак Ньютон"),
        GreatPerson(name: "Николо Тесла", image: "Николо Тесла")
    ]
    
    
    private init() {}
}


class CreatorsDataMangaer {
    static let shared = CreatorsDataMangaer()
    
    let creators = [Creator(name: "Olga",
                            surname: "Yurchook",
                            imageURL: "olga",
                            phoneNumber: "+79137047495",
                            email: "olga.yourchooke@gmail.com",
                            responsibilities: "QUIZ CREATOR"),
                    Creator(name: "Alexander",
                            surname: "",
                            imageURL: "alex",
                            phoneNumber: "-",
                            email: "-",
                            responsibilities: "TEAM LEAD"),
                    Creator(name: "Eugene",
                            surname: "Tyan",
                            imageURL: "eugene",
                            phoneNumber: "+79252586736",
                            email: "eugenietyan@gamil.com",
                            responsibilities: "CREATORS VC CREATOR")
    ]
    
    private init() {}
}
