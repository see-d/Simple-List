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
        tableview.delegate = self
        
        tableview.rowHeight = view.frame.height/6
        tableview.estimatedRowHeight = UITableView.automaticDimension
        
        tableview.sectionFooterHeight = .leastNormalMagnitude
        tableview.sectionHeaderHeight = UITableView.automaticDimension
        
        if #available(iOS 15.0, *) {
            tableview.sectionHeaderTopPadding = 0.0
        }
        
        tableview.separatorStyle = .none

        tableview.register(Feature.Domain.Sport.Cell.self,
                           forCellReuseIdentifier: Feature.Domain.Sport.Cell.reuseIdentifier)
        
        tableview.register(Feature.Domain.Sport.TitleHeader.self,
                           forHeaderFooterViewReuseIdentifier: Feature.Domain.Sport.TitleHeader.reuseIdentifier)
    }
}

extension SportsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewmodel.sports.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.shouldShowEvents(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Feature.Domain.Sport.Cell.reuseIdentifier,
                                                 for: indexPath)
        
        return cell
    }
}

extension SportsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: Feature.Domain.Sport.TitleHeader.reuseIdentifier)
        
        let toggleAction = { [weak self] in
            guard let self else { return }
            let on = self.viewmodel.toggleEvents(for: section)

            switch on {
            case false:
                self.tableview.insertRows(at: [IndexPath(row:0, section: section)], with: .automatic)
            case true:
                self.tableview.deleteRows(at: [IndexPath(row:0, section: section)], with: .automatic)
            }
        }
        
        (header as? Feature.Domain.Sport.TitleHeader)?.prepare(with: viewmodel.title(for: section),
                                                               toggle: toggleAction)
        return header
    }
}
