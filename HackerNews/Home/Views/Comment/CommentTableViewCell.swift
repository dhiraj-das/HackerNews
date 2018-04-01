//
//  CommentTableViewCell.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

protocol CommentTableViewCellRepresentable {
    var datetime: String { get }
    var userName: String { get }
    var description: NSAttributedString { get }
}

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var cellData: CommentTableViewCellRepresentable? {
        didSet {
            guard let data = cellData else { return }
            dateTimeLabel.text = "\(data.datetime) | \(data.userName)"
            bodyLabel.attributedText = data.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nullifyLabels()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nullifyLabels()
    }
    
    private func nullifyLabels() {
        bodyLabel.text = nil
        dateTimeLabel.text = nil
    }
}
