//
//  EventListCell.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import UIKit

extension Feature.Domain.Sport.Event {
    class Cell: UICollectionViewCell {
        static let reuseIdentifier: String = String(describing: Feature.Domain.Sport.Event.Cell.self)
        
        override init(frame: CGRect) {
            super.init(frame: frame)

            self.contentView.backgroundColor = .red
            
        }

        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

