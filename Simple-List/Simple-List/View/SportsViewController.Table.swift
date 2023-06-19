//
//  ViewController.Collection.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import UIKit

extension SportsViewController {
    func configureTableView() {
        tableview.dataSource = self
        
        tableview.rowHeight = view.frame.height/6
        tableview.estimatedRowHeight = UITableView.automaticDimension
        
        tableview.estimatedSectionHeaderHeight = UITableView.automaticDimension
        
        tableview.register(Feature.Domain.Sport.Cell.self,
                           forCellReuseIdentifier: Feature.Domain.Sport.Cell.reuseIdentifier)
    }
}

extension SportsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewmodel.sports.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // we will display the events of a sport horizontally so every section will only have at most 1 row
        //
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Feature.Domain.Sport.Cell.reuseIdentifier,
                                                 for: indexPath)
        
        return cell
        
    }
}

extension SportsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewmodel.title(for: section)
    }
}
