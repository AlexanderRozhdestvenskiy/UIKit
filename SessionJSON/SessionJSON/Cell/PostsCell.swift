//
//  PostsCell.swift
//  SessionJSON
//
//  Created by Alexander Rozhdestvenskiy on 01.03.2022.
//

import UIKit

class PostsCell: UITableViewCell {
    
    let labelId = UILabel()
    let labelTitle = UILabel()
    
    static let reuseID = "PostsCell"
    static let rowHeight: CGFloat = 88

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        labelId.translatesAutoresizingMaskIntoConstraints = false
        labelId.font = UIFont.preferredFont(forTextStyle: .title1)
        labelId.adjustsFontForContentSizeCategory = true
        labelId.textColor = .systemRed
        labelId.textAlignment = .center
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.preferredFont(forTextStyle: .body)
        labelTitle.adjustsFontForContentSizeCategory = true
        labelTitle.numberOfLines = 0
        labelTitle.textColor = .black
        labelTitle.textAlignment = .left
    }
    
    private func layout() {
        contentView.addSubview(labelId)
        contentView.addSubview(labelTitle)
        
        labelId.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        labelId.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        labelId.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        labelId.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        labelTitle.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: labelId.trailingAnchor, constant: 8).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
}
