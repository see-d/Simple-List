//
//  ViewController.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import UIKit

class SportsViewController: UIViewController {
    private(set) var viewmodel: SportsViewModel
    lazy var tableview = UITableView(frame: view.frame, style: .plain)
    
    private var stateObserver: NSKeyValueObservation?
    
    required init(with viewmodel: SportsViewModel) {
        self.viewmodel = viewmodel
        
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareViewHeirarchy()
        
        stateObserver = viewmodel.observe(\.onStateChanged, changeHandler: { [weak self] _,_ in
            self?.render()
        })
  
        viewmodel.fetchSports()
    }
    
    private func prepareViewHeirarchy() {
        view.backgroundColor = .white
        displayTableview()
    }

    private func displayTableview() {
        configureTableView()
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableview.topAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableview.bottomAnchor),
            view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: tableview.leadingAnchor),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: tableview.trailingAnchor)
        ])
    }
    
    private func render() {
        switch viewmodel.state {
        case .success(_):
            tableview.reloadData()
        default:
            return
        }
    }

}

