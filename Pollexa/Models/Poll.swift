//
//  Poll.swift
//  Pollexa
//
//  Created by Karim Amsha on 2.04.2024.
//

import UIKit

struct Poll {
    var id: String?
    var userImage: UIImage?
    var userName: String?
    var createdAt: String?
    var lastVotedAt: String?
    var question: String?
    let choices: [PollChoice]
    var totalVoted: String?
    var isFinished: Bool
    var pollType: PollType
    var meVoted: Bool
}
