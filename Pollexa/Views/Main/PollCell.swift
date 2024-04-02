//
//  PollCell.swift
//  Pollexa
//
//  Created by Karim Amsha on 2.04.2024.
//

import UIKit

class PollCell: UITableViewCell {
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblCreatedDate: UILabel!
    @IBOutlet weak var lblLastVotedDate: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var mediaView: UIView!
    @IBOutlet weak var textChoicesView: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var choiceImageView1: UIImageView!
    @IBOutlet weak var choiceImageView2: UIImageView!
    @IBOutlet weak var choiceImageView3: UIImageView!
    @IBOutlet var voteLabel1: UILabel!
    @IBOutlet var voteLabel2: UILabel!
    @IBOutlet var voteLabel3: UILabel!
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet weak var lblTotalVote: UILabel!
    
    @IBOutlet weak var choiceView1: UIView!
    @IBOutlet weak var choiceView2: UIView!
    @IBOutlet weak var choiceView3: UIView!
    @IBOutlet var choiceLabel1: UILabel!
    @IBOutlet var choiceLabel2: UILabel!
    @IBOutlet var choiceLabel3: UILabel!
    @IBOutlet var lblPres1: UILabel!
    @IBOutlet var lblPres2: UILabel!
    @IBOutlet var lblPres3: UILabel!

    var choiceImageViews: [UIImageView] {
        return [choiceImageView1, choiceImageView2, choiceImageView3]
    }
    var views: [UIView] {
        return [view1, view2, view3]
    }
    var labels: [UILabel] {
        return [voteLabel1, voteLabel2, voteLabel3]
    }
    var likesBtns: [UIButton] {
        return [btn1, btn2, btn3]
    }
    var choicesViews: [UIView] {
        return [choiceView1, choiceView2, choiceView3]
    }
    var choicesLabels: [UILabel] {
        return [choiceLabel1, choiceLabel2, choiceLabel3]
    }
    var presLabels: [UILabel] {
        return [lblPres1, lblPres2, lblPres3]
    }

    var didPressLike: ((Int)->Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure(with pollViewModel: PollViewModel) {
        userImg.image = pollViewModel.userImage
        lblUsername.text = pollViewModel.userName
        lblCreatedDate.text = pollViewModel.createdAt
        lblLastVotedDate.text = pollViewModel.lastVotedAt
        questionLabel.text = pollViewModel.question
        lblTotalVote.text = "\(pollViewModel.totalVoted ?? "") Total Votes"

        for (index, choiceViewModel) in pollViewModel.choices.enumerated() {
            //            choiceLabels[index].text = choiceViewModel.text
            if let image = choiceViewModel.image {
                choiceImageViews[index].image = image
                choiceImageViews[index].isHidden = false
                if pollViewModel.isFinished {
                    labels[index].text = choiceViewModel.text
                    labels[index].isHidden = false
                    likesBtns[index].isHidden = true
                } else {
                    labels[index].isHidden = true
                    likesBtns[index].isHidden = false
                }
            } else {
                choiceImageViews[index].isHidden = true
                views[index].isHidden = true
            }
            
            if let label = choiceViewModel.content {
                choicesLabels[index].text = label
                choicesViews[index].isHidden = false
                if pollViewModel.isFinished {
                    presLabels[index].text = choiceViewModel.text
                    presLabels[index].isHidden = false
                } else {
                    presLabels[index].isHidden = true
                }
                
                choicesViews[index].backgroundColor = choiceViewModel.meVoted ? ColorManager.primary5856D6 : ColorManager.grayF0F3FA
                choicesLabels[index].textColor = choiceViewModel.meVoted ? .white : ColorManager.text02182B
                presLabels[index].textColor = choiceViewModel.meVoted ? .white : ColorManager.text02182B
            } else {
                choicesLabels[index].isHidden = true
                choicesViews[index].isHidden = true
            }
        }
        
        for index in pollViewModel.choices.count..<choiceImageViews.count {
            choiceImageViews[index].isHidden = true
            views[index].isHidden = true
        }
        
        for index in pollViewModel.choices.count..<choicesViews.count {
            choicesViews[index].isHidden = true
        }
        
        mediaView.isHidden = pollViewModel.pollType != .image
        textChoicesView.isHidden = pollViewModel.pollType != .text

        choiceImageView1.applyCornerRadius(10, corners: [.topLeft, .bottomLeft])
        choiceImageView2.applyCornerRadius(10, corners: [.topRight, .bottomRight])
        choiceImageView3.applyCornerRadius(10, corners: [.bottomLeft, .bottomRight])
    }
    
    @IBAction func didTapLike(_ sender: UIButton) {
        didPressLike?(sender.tag)
    }
}
