//
//  EventListCell.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import UIKit

extension Feature.Domain.Sport {
    class Cell: UITableViewCell {
        static let reuseIdentifier: String = String(describing: Feature.Domain.Sport.Cell.self)
        
        lazy var collection = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            let collection = UICollectionView(frame: contentView.frame,
                                              collectionViewLayout: layout)
            return collection
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            addSubview(collection)
            collection.translatesAutoresizingMaskIntoConstraints = false
            
            configureCollection()
            
            NSLayoutConstraint.activate([
                leadingAnchor.constraint(equalTo: collection.leadingAnchor),
                trailingAnchor.constraint(equalTo: collection.trailingAnchor),
                bottomAnchor.constraint(equalTo: collection.bottomAnchor),
                topAnchor.constraint(equalTo: collection.topAnchor),
            ])
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

extension Feature.Domain.Sport.Cell {
    private func configureCollection() {
        
        collection.insetsLayoutMarginsFromSafeArea = true
        collection.contentInsetAdjustmentBehavior = .automatic
        
        collection.keyboardDismissMode = .onDrag
        collection.showsVerticalScrollIndicator = false
        
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        
        collection.register(Feature.Domain.Sport.Event.Cell.self,
                            forCellWithReuseIdentifier: Feature.Domain.Sport.Event.Cell.reuseIdentifier)
        
        collection.dataSource = self
        collection.delegate = self
    }
}


extension Feature.Domain.Sport.Cell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Feature.Domain.Sport.Event.Cell.reuseIdentifier,
                                                      for: indexPath)
        
        return cell
    }
}

extension Feature.Domain.Sport.Cell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4.4
        let hardCodedPadding:CGFloat = 3
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
