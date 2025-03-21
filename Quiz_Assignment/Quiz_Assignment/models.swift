//
//  models.swift
//  Quiz_Assignment
//
//  Created by Arch Umeshbhai Patel on 2025-03-21.
//

import Foundation


class Quiz
{
    var id : UUID
    var question : String
    var answer: String
    var optionOne: String
    var optionTwo: String
    var optionThree: String
    
    init(question: String, answer: String, optionOne: String, optionTwo: String, optionThree: String) {
        self.id = UUID()
        self.question = question
        self.answer = answer
        self.optionOne = optionOne
        self.optionTwo = optionTwo
        self.optionThree = optionThree
    }
    
}


class QuizManager{
    
    var quizBank : [Quiz] = [
        Quiz(question: "Question", answer: "Answer", optionOne: "Option 1", optionTwo: "Option 2", optionThree: "Option 3")
    ]
    
    func addQuiz(newQuiz : Quiz){
        quizBank.append(newQuiz)
    }
    
    func deleteQuiz(id:UUID){
        quizBank.removeAll{ quiz in return quiz.id == id }
    }
    
    func updateQuiz(updatedQuiz: Quiz)
    {
        self.deleteQuiz(id: updatedQuiz.id)
        self.addQuiz(newQuiz: updatedQuiz)
    }
}

