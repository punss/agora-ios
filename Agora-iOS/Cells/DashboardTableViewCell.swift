//
//  DashboardTableViewCell.swift
//  Agora-iOS
//
//  Created by Hridik Punukollu on 22/03/20.
//  Copyright © 2020 Hridik Punukollu. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cellIcon: UIImageView!
    @IBOutlet weak var electionCounter: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var shadowView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 10
//        bgView.layer.shadowOpacity = 10
//        bgView.layer.shadowRadius = 20
//        bgView.layer.shadowColor = UIColor.purple.cgColor
//        bgView.layer.shadowOffset = CGSize(width: 4, height: 4)
//        bgView.layer.masksToBounds = true
//        shadowView.backgroundColor = .clear
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
