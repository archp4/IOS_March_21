//
//  UpdateQuizViewController.swift
//  Quiz_Assignment
//
//  Created by Arch Umeshbhai Patel on 2025-03-21.
//

import UIKit

class UpdateQuizViewController: ViewController{
    var data: Quiz?
    var localModel : QuizManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        localModel = ((UIApplication.shared.delegate) as! AppDelegate).model
        ErrorLabel.isHidden = true
        ErrorLabel.text = "All are required please enter them";
        // Do any additional setup after loading the view.
    }
    func loadData(){
        questionTF.text = data?.question
        answerTF.text = data?.answer
        optionOneTF.text = data?.options[0]
        optionTwoTF.text = data?.options[1]
        optionThreeTF.text = data?.options[2]
    }
    
    @IBAction func onSave(_ sender: Any) {
        if validateField() {
            var list : [String] = []
            list.append(optionOneTF.text ?? "")
            list.append(optionTwoTF.text ?? "")
            list.append(optionThreeTF.text ?? "")
            let quiz : Quiz = Quiz(id:data!.id, question: questionTF.text ?? "", answer: answerTF.text ?? "", options: list)
            localModel?.updateQuiz(updatedQuiz: quiz)
            print(quiz.question)
            self.dismiss(animated: true)
        }else{
            ErrorLabel.textColor = UIColor.red
            ErrorLabel.isHidden = false
        }
    }
    
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
    
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBOutlet weak var questionTF: UITextField!
    @IBOutlet weak var answerTF: UITextField!
    @IBOutlet weak var optionThreeTF: UITextField!
    @IBOutlet weak var optionTwoTF: UITextField!
    @IBOutlet weak var optionOneTF: UITextField!
    @IBOutlet weak var ErrorLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
