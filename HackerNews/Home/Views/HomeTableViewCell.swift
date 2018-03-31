//
//  HomeTableViewCell.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

protocol HomeTableViewCellRepresentable {
    var title: String { get }
    var commentCount: Int { get }
    var score: Int { get }
    var datetime: String { get }
    var userName: String { get }
    var description: String { get }
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var additionalDetailsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    struct Dimensions {
        static let cellHeight: CGFloat = 110.0
    }
    
    var cellData: HomeTableViewCellRepresentable? {
        didSet {
            guard let data = cellData else { return }
            postTitleLabel.text = data.title
            commentCountLabel.text = "\(data.commentCount)"
            scoreLabel.text = "\(data.score)"
            descriptionLabel.text = "\(data.description)"
            
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
        postTitleLabel.text = nil
        commentCountLabel.text = nil
        scoreLabel.text = nil
        additionalDetailsLabel.text = nil
        descriptionLabel.text = nil
    }

}
