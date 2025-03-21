//
//  QuizTileTableViewCell.swift
//  Quiz_Assignment
//
//  Created by Arch Umeshbhai Patel on 2025-03-21.
//

import UIKit

class QuizTileTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var CorrectAnswerLabel: UILabel!
    
    
    @IBOutlet weak var OptionThreeLabel: UILabel!
    
    @IBOutlet weak var OptionTwoLabel: UILabel!
    
    @IBOutlet weak var OptionOneLabel: UILabel!
    
}
