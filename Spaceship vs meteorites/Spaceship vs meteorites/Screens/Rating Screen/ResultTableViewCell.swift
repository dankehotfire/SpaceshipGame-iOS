//
//  TableViewCell.swift
//  Spaceship vs meteorites
//
//  Created by Danil Nurgaliev on 16.05.2021.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var shipImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
