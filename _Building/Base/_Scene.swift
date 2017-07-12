//
//  _BaseViewController.swift
//  readmate
//
//  Created by fallen.ink on 01/07/2017.
//  Copyright © 2017 fallen.ink. All rights reserved.
//

import UIKit

/**
    @knowledge
 
    - 强引用 Interactor
 */
class _Scene: UIViewController { // Change ViewController to Scene

    // MARK: - Arch
    
    // Hold Interactor
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initNavigationBar();
        
        initContainer();
        
        initTableView();
        
        makeConstraints();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints();
        
        updateConstraints();
    }
    
    // MARK: - Initialize template

    func initNavigationBar() {
        
    }
    
    func initContainer() {
        
    }
    
    func initTableView() {
        
    }
    
    // MARK: - Constraints template
    
    func makeConstraints() {
        
    }
    
    func remakeConstraints() {
        
    }
    
    func updateConstraints() {
        
    }
    
}
