//
//  MovieDetailVideosCell.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 9.11.2025.
//

import UIKit

final class MovieDetailVideosCell: UICollectionViewCell {
    static let identifier = "MovieDetailVideosCell"
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .systemGray
        return image
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20)
        label.textColor = .label
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setUpLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        self.title.text = nil

    }
    
    func configure(title: String) {
        imageView.image = nil
        self.title.text = title
    }
    
    private func setUpLayer() {
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.label.cgColor
        layer.shadowOffset = CGSize(width: -4, height: 4)
        layer.shadowOpacity = 0.3
    }
    
    private func setupUI() {
        addSubViews(imageView, title)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.8),
            
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}
