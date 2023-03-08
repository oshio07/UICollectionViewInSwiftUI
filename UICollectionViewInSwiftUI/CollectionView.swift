//
//  CollectionView.swift
//  UICollectionViewInSwiftUI
//
//  Created by Shigenari Oshio on 2023/03/08.
//

import SwiftUI

struct CollectionView: UIViewRepresentable {
    
    typealias UIViewType = UICollectionView
    
    func makeUIView(context: Context) -> UICollectionView {
        
        let layoutSection: NSCollectionLayoutSection = {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                  heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                                   heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let layoutSection = NSCollectionLayoutSection(group: group)
            layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
            layoutSection.interGroupSpacing = 8
            
            return layoutSection
        }()
        
        let collectionViewLayout: UICollectionViewLayout = {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
                return layoutSection
            }
            return layout
        }()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = UIColor.systemBackground
        collectionView.dataSource = context.coordinator

        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))

        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator() }

    class Coordinator: NSObject, UICollectionViewDataSource {
        
        private let colors: [UIColor] = [.systemMint, .systemTeal, .systemCyan, .systemBlue, .systemIndigo]

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return colors.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CollectionViewCell.self), for: indexPath) as? CollectionViewCell
            else { return .init() }
            cell.configure(backgroundColor: colors[indexPath.row])
            return cell
        }
    }
}
