//
//  PollViewModel.swift
//  Pollexa
//
//  Created by Karim Amsha on 2.04.2024.
//

import UIKit

class PollViewModel {
    let id: String
    let userImage: UIImage
    let userName: String
    let createdAt: String
    let lastVotedAt: String
    let question: String
    let choices: [PollChoiceViewModel]
    let totalVoted: String?
    var isFinished: Bool
    var pollType: PollType
    var meVoted: Bool

    init(poll: Poll) {
        self.id = poll.id ?? ""
        self.userImage = poll.userImage ?? UIImage()
        self.userName = poll.userName ?? ""
        self.createdAt = poll.createdAt ?? ""
        self.lastVotedAt = poll.lastVotedAt ?? ""
        self.question = poll.question ?? ""
        self.choices = poll.choices.map { PollChoiceViewModel(text: $0.text, content: $0.content, image: $0.image, meVoted: $0.meVoted) }
        self.totalVoted = poll.totalVoted ?? ""
        self.isFinished = poll.isFinished 
        self.pollType = poll.pollType
        self.meVoted = poll.meVoted
    }
}
