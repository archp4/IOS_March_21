//
//  models.swift
//  Quiz_Assignment
//
//  Created by Arch Umeshbhai Patel on 2025-03-21.
//

import Foundation


protocol QuizDelegate{
    func QuizAdded()
}

class Quiz {
    var id: UUID
    var question: String
    var answer: String
    var options: [String] // Changed to an array of options

    init(id: UUID = UUID(), question: String, answer: String, options: [String]) {
        self.id = id
        self.question = question
        self.answer = answer
        self.options = options.shuffled() // Shuffle options during initialization
    }

    // Function to shuffle options if needed later
    func shuffleOptions() ->[String] {
        var list = options
        list.append(answer)
        list.shuffle()
        return list
    }
}

class QuizManager {
    static var shared = QuizManager()

    var quizDelegate: QuizDelegate?

    var quizBank: [Quiz] = [
        Quiz(question: "I wield three swords, but I'm no pirate. Who am I?", answer: "Roronoa Zoro", options: ["Monkey D. Luffy", "Sanji", "Nami"]),
        Quiz(question: "I seek the power of friendship, and scream my attacks. Who am I?", answer: "Natsu Dragneel", options: ["Gray Fullbuster", "Erza Scarlet", "Lucy Heartfilia"]),
        Quiz(question: "I'm a detective who shrinks, but still solves crimes. Who am I?", answer: "Conan Edogawa", options: ["Kaito Kid", "Ran Mouri", "Heiji Hattori"]),
        Quiz(question: "I'm the strongest hunter, but my best friend is a robot. Who am I?", answer: "Gon Freecss", options: ["Killua Zoldyck", "Kurapika", "Leorio Paladinight"]),
        Quiz(question: "I'm the number one unpredictable ninja. Who am I?", answer: "Naruto Uzumaki", options: ["Sasuke Uchiha", "Sakura Haruno", "Kakashi Hatake"]),
        Quiz(question: "I'm a titan shifter, fighting for humanity's freedom. Who am I?", answer: "Eren Yeager", options: ["Mikasa Ackerman", "Armin Arlert", "Levi Ackerman"]),
        Quiz(question: "I'm the world's greatest detective, with a notebook of death. Who am I?", answer: "Light Yagami", options: ["L Lawliet", "Misa Amane", "Near"]),
        Quiz(question: "I'm a psychic with a powerful spoon, but I just want to be normal. Who am I?", answer: "Mob", options: ["Reigen Arataka", "Ritsu Kageyama", "Teruki Hanazawa"]),
        Quiz(question: "I'm a demon slayer, fighting to avenge my family. Who am I?", answer: "Tanjiro Kamado", options: ["Zenitsu Agatsuma", "Inosuke Hashibira", "Nezuko Kamado"]),
        Quiz(question: "I'm a high school student who gained the power of a shinigami. Who am I?", answer: "Ichigo Kurosaki", options: ["Orihime Inoue", "Uryu Ishida", "Byakuya Kuchiki"])
    ]

    var quiz: [Quiz] {
        return quizBank
    }

    func addQuiz(newQuiz: Quiz) {
        print(newQuiz.question)
        quizBank.append(newQuiz)
        self.quizDelegate?.QuizAdded()
    }

    func deleteQuiz(id: UUID) {
        
        quizBank.removeAll { quiz in return quiz.id == id }
    }

    func updateQuiz(updatedQuiz: Quiz) {
        print("In Update")
        print("\(updatedQuiz.id) To Update")
        for quiz in quizBank{
            print("\(quiz.id) \(quiz.question)")
        }
        print(quizBank.contains(where: {quiz in return quiz.id == updatedQuiz.id}))
        self.deleteQuiz(id: updatedQuiz.id)
        self.addQuiz(newQuiz: updatedQuiz)
    }
}
