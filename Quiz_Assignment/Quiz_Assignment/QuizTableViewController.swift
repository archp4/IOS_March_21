//
//  QuizTableViewController.swift
//  Quiz_Assignment
//
//  Created by Arch Umeshbhai Patel on 2025-03-21.
//

import UIKit

class QuizTableViewController: UITableViewController, QuizDelegate {
    func QuizAdded() {
        reloadData()
    }
    

    var localModel : QuizManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        QuizManager.shared.quizDelegate = self
        localModel = ((UIApplication.shared.delegate) as! AppDelegate).model
    }
    
    func reloadData(){
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return localModel?.quizBank.count ?? 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Appear")
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizTile") as! QuizTileTableViewCell
        let object = localModel?.quizBank[indexPath.row]
        
        
        cell.QuestionLabel?.text = object?.question ?? ""
        cell.CorrectAnswerLabel?.text = object?.answer ?? ""
        cell.OptionOneLabel?.text = object?.options[0] ?? ""
        cell.OptionTwoLabel?.text = object?.options[1] ?? ""
        cell.OptionThreeLabel?.text = object?.options[2] ?? ""
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier!)
        if segue.identifier! == "updateQuiz"{
            if let hs = segue.destination as? UpdateQuizViewController{
                let localModel = self.localModel
                let index  = tableView.indexPathForSelectedRow?.row ?? 0
                hs.data = localModel?.quizBank[index]
                print("ready")
            }
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
