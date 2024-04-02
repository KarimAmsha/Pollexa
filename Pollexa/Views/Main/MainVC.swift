//
//  MainVC.swift
//  Pollexa
//
//  Created by Karim Amsha on 2.04.2024.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var pollViewModels: [PollViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup ViewController
        setup()
        
        // Initialize
        initializeData()
    }
    
    func setup() {
        view.backgroundColor = ColorManager.grayF8F8FF
        
        setTitle(discover)
    
        // Leading and Traling bar button items
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(goToProfile), imageName: "ic_avatar")
        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(didTapAdd), imageName: "ic_plus")
        
        // Thems for navigationBar
        navigationController?.navigationBar.applyLargeNavigation()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(id: PollCell.self)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
    }
    
    @objc func goToProfile() {
    }
    
    @objc func didTapAdd() {
        
    }
    
    func initializeData() {
        // Initialize sample data
        let poll1 = Poll(id: "1", userImage: UIImage(named: "ic_av1"), userName: "Lisa Bryant", createdAt: "2 days ago", lastVotedAt: "Last voted 1 hour ago", question: "I am in the middle of these two perfumes. Which one should I buy?", choices: [PollChoice(text: "10 %", content: nil, image: UIImage(named: "img1"), meVoted: false), PollChoice(text: "10 %", content: nil, image: UIImage(named: "img2"), meVoted: false)], totalVoted: "6", isFinished: false, pollType: .image, meVoted: false)

        let poll2 = Poll(id: "2", userImage: UIImage(named: "ic_av2"), userName: "Aaron Almaraz", createdAt: "6 days ago", lastVotedAt: "last voted 12 minutes ago", question: "I have 3 days off for the next week. How would you spend this 72 hours of freedom.", choices: [PollChoice(text: "10 %", content: "Netflix & Chill 🍿", image: nil, meVoted: false), PollChoice(text: "10 %", content: "Visit Paris.", image: nil, meVoted: false), PollChoice(text: "10 %", content: "Go camping with your friends.", image: nil, meVoted: false)], totalVoted: "12", isFinished: false, pollType: .text, meVoted: false)

        let poll3 = Poll(id: "3", userImage: UIImage(named: "ic_av3"), userName: "Sophia Bennett", createdAt: "2 weeks ago", lastVotedAt: "last voted 12 seconds ago", question: "My friend just invited me to his birthday party but I have an exam tomorrow.", choices: [PollChoice(text: "12 %", content: "This is a no brainer, study!", image: nil, meVoted: true), PollChoice(text: "88 %", content: "We only come to life once 🎉", image: nil, meVoted: false)], totalVoted: "62", isFinished: true, pollType: .text, meVoted: true)

        let poll4 = Poll(id: "4", userImage: UIImage(named: "ic_av4"), userName: "Oliver Green", createdAt: "1 month ago", lastVotedAt: "last voted 2 weeks ago", question: "I am looking for an asthetic chair my backyard. I finally managed to narrow my options down to these three. Whatme know your choice.", choices: [PollChoice(text: "13 %", content: nil, image: UIImage(named: "img3"), meVoted: false), PollChoice(text: "46 %", content: nil, image: UIImage(named: "img4"), meVoted: false), PollChoice(text: "41 %", content: nil, image: UIImage(named: "img5"), meVoted: false)], totalVoted: "412", isFinished: true, pollType: .image, meVoted: false)

        let poll5 = Poll(id: "4", userImage: UIImage(named: "ic_av5"), userName: "John Smith", createdAt: "2 months ago", lastVotedAt: "Last voted 1 minute ago", question: "Which way would you choose for your next vacation?", choices: [PollChoice(text: "56 %", content: nil, image: UIImage(named: "img6"), meVoted: false), PollChoice(text: "34 %", content: nil, image: UIImage(named: "img7"), meVoted: false)], totalVoted: "68", isFinished: true, pollType: .image, meVoted: false)

        let pollViewModel1 = PollViewModel(poll: poll1)
        let pollViewModel2 = PollViewModel(poll: poll2)
        let pollViewModel3 = PollViewModel(poll: poll3)
        let pollViewModel4 = PollViewModel(poll: poll4)
        let pollViewModel5 = PollViewModel(poll: poll5)

        // Add view models to the array
        pollViewModels = [pollViewModel1, pollViewModel2, pollViewModel3, pollViewModel4, pollViewModel5]
        
        // Reload table view
        tableView.reloadData()
    }
}

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pollViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PollCell", for: indexPath) as! PollCell
        
        let pollViewModel = pollViewModels[indexPath.row]
        cell.configure(with: pollViewModel)
        
        return cell
    }
}

extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Adjust row height as needed
        return UITableView.automaticDimension
    }
}
