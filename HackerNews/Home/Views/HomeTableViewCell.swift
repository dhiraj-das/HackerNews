//
//  HomeTableViewCell.swift
//  HackerNews
//
//  Created by Dhiraj Das on 3/31/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import UIKit

protocol HomeTableViewCellRepresentable {
    var id: Int { get }
    var title: String { get }
    var commentCount: Int { get }
    var votes: Int { get }
    var datetime: String { get }
    var userName: String { get }
    var description: NSAttributedString { get }
    var urlString: String { get }
}

protocol HomeTableViewCellDelegate: class {
    func didTapOnComment(id: Int)
}

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var additionalDetailsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var commentImageView: UIImageView!
    
    struct Dimensions {
        static let cellHeight: CGFloat = 110.0
    }
    
    weak var delegate: HomeTableViewCellDelegate?
    var cellData: HomeTableViewCellRepresentable? {
        didSet {
            guard let data = cellData else { return }
            postTitleLabel.text = data.title
            commentCountLabel.text = "\(data.commentCount)"
            scoreLabel.text = "\(data.votes)"
            descriptionLabel.attributedText = data.description
            urlLabel.text = data.urlString
            additionalDetailsLabel.text = "\(data.datetime) | \(data.userName)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nullifyLabels()
        addTapGestureToCommentImageView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nullifyLabels()
    }
    
    private func addTapGestureToCommentImageView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SELCommentTapped(sender:)))
        commentImageView.addGestureRecognizer(tapGesture)
    }

    private func nullifyLabels() {
        postTitleLabel.text = nil
        commentCountLabel.text = nil
        scoreLabel.text = nil
        additionalDetailsLabel.text = nil
        descriptionLabel.text = nil
    }
    
    @objc private func SELCommentTapped(sender: Any) {
        guard let data = cellData else { return }
        delegate?.didTapOnComment(id: data.id)
    }
    
}
