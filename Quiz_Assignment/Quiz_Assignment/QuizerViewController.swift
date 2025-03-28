//
//  QuizerViewController.swift
//  Quiz_Assignment
//
//  Created by Arch Umeshbhai Patel on 2025-03-21.
//

import UIKit

class QuizerViewController: ViewController {

    
    var localModel : QuizManager?
    var progressMarker: [Float] = []
    var currentQuestionIndex = 0
    @IBOutlet weak var radio1: RadioButton!
    @IBOutlet weak var radio2: RadioButton!
    @IBOutlet weak var radio3: RadioButton!
    @IBOutlet weak var radio4: RadioButton!
    @IBOutlet weak var backBTN: UIButton!
    @IBOutlet weak var ForwardBTN: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    
    var answerList: [Bool] = []
    
    
    var selectedAnswer:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localModel = ((UIApplication.shared.delegate) as! AppDelegate).model
        setupProgressMarker()
        loadQuestion()
        for quiz in localModel!.quiz {
            answerList.append(false)
        }
    }
    
    
    func setupProgressMarker() {
            guard let quiz = localModel?.quiz else { return }
        let totalQuestions = Float(quiz.count)
            if totalQuestions > 0 {
                for i in 0..<quiz.count {
                    progressMarker.append(Float(i + 1) / totalQuestions)
                }
            }
        }

    func loadQuestion() {
        guard let quiz = localModel?.quiz, currentQuestionIndex < quiz.count else {
            return
        }

        let currentQuestion = quiz[currentQuestionIndex]
        questionLabel.text = currentQuestion.question
        var list  = currentQuestion.shuffleOptions()
        radio1.setTitle(list[0], for: .normal)
        radio2.setTitle(list[1], for: .normal)
        radio3.setTitle(list[2], for: .normal)
        radio4.setTitle(list[3], for: .normal)

        ProgressBar.progress = progressMarker[currentQuestionIndex]

        deselector()

        backBTN.isEnabled = currentQuestionIndex > 0
        ForwardBTN.isEnabled = currentQuestionIndex < quiz.count
    }


    
    @IBAction func radioButtonTapped(_ sender: RadioButton){
        deselector()
        if sender == radio1 {
            selectedAnswer = radio1.titleLabel?.text
            radio1.isSelected = true
        } else if sender == radio2 {
            selectedAnswer = radio2.titleLabel?.text
            radio2.isSelected = true
        } else if sender == radio3 {
            selectedAnswer = radio3.titleLabel?.text
            radio3.isSelected = true
        } else if sender == radio4 {
            selectedAnswer = radio4.titleLabel?.text
            radio4.isSelected = true
        } else {
            selectedAnswer = nil
        }
        
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
            if currentQuestionIndex > 0 {
                currentQuestionIndex -= 1
                answerList[currentQuestionIndex] = false
                loadQuestion()
            }
        }

    @IBAction func forwardButtonTapped(_ sender: UIButton) {
        
        
        
        if selectedAnswer != nil && localModel?.quiz[currentQuestionIndex].answer == selectedAnswer {
            answerList[currentQuestionIndex] = true
        } else {
            answerList[currentQuestionIndex] = false
        }
        
        if currentQuestionIndex < (localModel?.quiz.count ?? 0) - 1 {
            currentQuestionIndex += 1
            loadQuestion()
        } else {
            var result : Int = 0
            for answer in answerList {
                if answer {
                    result = result + 1
                }
            }
            
            let alert = UIAlertController(title: "Quiz Completed", message: "You have reached the end of the quiz.\n Your Score is \(result)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    func deselector(){
        selectedAnswer = nil
        radio1.deselect()
        radio2.deselect()
        radio3.deselect()
        radio4.deselect()
    }
    
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
