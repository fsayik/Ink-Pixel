//
//  MovieDetailOverviewCell.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 14.11.2025.
//

import UIKit

final class MovieDetailOverviewCell: UICollectionViewCell {
    
    static let identifier = "MovieDetailOverviewCell"
    
    private let overviewLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func prepareForReuse() {
        overviewLabel.text = nil
    }
    
    private func setupUI() {
        contentView.addSubview(overviewLabel)
        
        NSLayoutConstraint.activate([
            overviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    func configure(text: String) {
        overviewLabel.text = text
    }
    
}
