//
//  CollectionViewCell.swift
//  UICollectionViewInSwiftUI
//
//  Created by Shigenari Oshio on 2023/03/08.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    private lazy var baseView: UIView = {
        let carouselContentView = UIView()
        carouselContentView.translatesAutoresizingMaskIntoConstraints = false
        carouselContentView.layer.cornerRadius = 16
        return carouselContentView
    }()
    
    func configure(backgroundColor: UIColor) {
        baseView.backgroundColor = backgroundColor
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(baseView)
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: contentView.topAnchor),
            baseView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            baseView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            baseView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
