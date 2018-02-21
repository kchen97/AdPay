//
//  ViewController.swift
//  AdPay
//
//  Created by Korman Chen on 2/19/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit

enum MenuStatus {
    case show
    case hide
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISplitViewControllerDelegate {
    
    //MARK: Properties
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuLeading: NSLayoutConstraint!
    var menuVisible = false
    
    let homeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.red
        button.layer.shadowOpacity = 1
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Delegate and Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell") as! PaymentTableViewCell
        
        return cell
    }
    
    @objc func handleDismiss() {
        if menuVisible {
            handleMenu(.hide)
        }
    }
    
    @IBAction func menuPressed(_ sender: UIBarButtonItem) {
        
        if !menuVisible {
            handleMenu(.show)
        }
        else {
            handleMenu(.hide)
        }
    }
    
    func handleMenu(_ action: MenuStatus) {
        
        if action == .show {
            menuLeading.constant = 8
        }
        else {
            menuLeading.constant = -160
        }
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }, completion: { (cool) in
            self.menuVisible = !self.menuVisible
        })
    }
    
    func setupUI() {
        menuView.layer.shadowOpacity = 1
        menuView.backgroundColor = UIColor.darkGray
        menuView.layer.cornerRadius = 12
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.rowHeight = 65
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
        menuView.addSubview(homeButton)
        
        homeButton.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 6).isActive = true
        homeButton.trailingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: -6).isActive = true
        homeButton.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 50).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}

