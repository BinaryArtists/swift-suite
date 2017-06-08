//
//  UserListViewController.swift
//  Example
//
//  Created by Joel on 05/04/2017.
//  Copyright (c) 2017 HELM S.C.P. All rights reserved.
//
//  This file was generated by the Clean Swift HELM Xcode Templates
//

import UIKit

protocol UserListViewControllerInput {
    func displayUser(viewModel: UserListScene.GetUser.ViewModel)
}

protocol UserListViewControllerOutput {
    func getUser(request: UserListScene.GetUser.Request)
    func selectUser(request: UserListScene.SelectUser.Request)
}

class UserListViewController: UIViewController, UserListViewControllerInput {
    
    var output: UserListViewControllerOutput?
    var router: UserListRouter?
    var users: [UserListScene.GetUser.ViewModel.User] = []
    
    @IBOutlet weak var userListTableView: UITableView!
    
    struct cellIdentifiers {
        static let userCell = "userCell"
    }
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UserListConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewOnLoad()
    }
    
    // MARK: Requests
    
    func requestGetUser() {
        let request = UserListScene.GetUser.Request()
        output?.getUser(request: request)
    }
    
    // MARK: Display logic
    
    func displayUser(viewModel: UserListScene.GetUser.ViewModel) {
        let user = viewModel.user
        users.insert(user, at: 0)
        userListTableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
    }
    
    // MARK: UI events
    
    @IBAction func addUserButtonClicked(_ sender: UIBarButtonItem) {
        requestGetUser()
    }

    
}

//This should be on configurator but for some reason storyboard doesn't detect ViewController's name if placed there
extension UserListViewController: UserListPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(for: segue)
    }
}
