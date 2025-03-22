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

    init(question: String, answer: String, options: [String]) {
        self.id = UUID()
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
        Quiz(question: "Question", answer: "Answer", options: ["Option 1", "Option 2", "Option 3"]),
        Quiz(question: "Creator", answer: "Arch Patel", options: ["Jay Patel", "Yash Patel", "NinjaMaster"])
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
        self.deleteQuiz(id: updatedQuiz.id)
        self.addQuiz(newQuiz: updatedQuiz)
    }
}
