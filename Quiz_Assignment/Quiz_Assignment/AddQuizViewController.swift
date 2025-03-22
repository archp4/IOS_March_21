//
//  AddQuizViewController.swift
//  Quiz_Assignment
//
//  Created by Arch Umeshbhai Patel on 2025-03-21.
//

import UIKit

class AddQuizViewController: ViewController {

    
    var data: Quiz?
    
    var localModel : QuizManager?
    var isError : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        localModel = ((UIApplication.shared.delegate) as! AppDelegate).model
        ErrorLabel.isHidden = true
        ErrorLabel.text = "All are required please enter them";
        // Do any additional setup after loading the view.
    }
    
    
    

    @IBOutlet weak var questionTF: UITextField!
    @IBOutlet weak var answerTF: UITextField!
    @IBOutlet weak var optionThreeTF: UITextField!
    @IBOutlet weak var optionTwoTF: UITextField!
    @IBOutlet weak var optionOneTF: UITextField!
    
    @IBAction func onSave(_ sender: Any) {
        if validateField() {
            var list : [String] = []
            list.append(optionOneTF.text ?? "")
            list.append(optionTwoTF.text ?? "")
            list.append(optionThreeTF.text ?? "")
            list.append(answerTF.text ?? "")
            let quiz : Quiz = Quiz(question: questionTF.text ?? "", answer: answerTF.text ?? "", options: list)
            localModel?.addQuiz(newQuiz: quiz)
            print(quiz.question)
            self.dismiss(animated: true)
        }else{
            ErrorLabel.textColor = UIColor.red
            ErrorLabel.isHidden = false
        }
    }
    
    @IBAction func onCancel(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "Are you sure want quit with unsave data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.dismiss(animated: true, completion: nil) 
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: false)
        self.dismiss(animated: true)
    }
    

    @IBOutlet weak var ErrorLabel: UILabel!
    
    func validateField() -> Bool {
        if (((questionTF.text) != nil) && questionTF.text?.isEmpty ?? true) {
            return false
        }
        if (((answerTF.text) != nil) && answerTF.text?.isEmpty ?? true) {
            return false
        }
        
        if (((optionOneTF.text) != nil) && optionOneTF.text?.isEmpty ?? true) {
            return false
        }
        
        if (((optionTwoTF.text) != nil) && optionTwoTF.text?.isEmpty ?? true) {
            return false
        }
        
        if (((optionThreeTF.text) != nil) && optionThreeTF.text?.isEmpty ?? true) {
            return false
        }
        
        
        return true
    }
}
