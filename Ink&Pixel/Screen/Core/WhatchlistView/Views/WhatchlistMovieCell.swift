//
//  WhatchlistMovieCell.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import UIKit

final class WhatchlistMovieCell: UICollectionViewCell {
    
    // MARK: - Variable
    static let cellIdentifier = "WhatchlistMovieCell"
    
    // MARK: - UI Components
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.numberOfLines = 1
        label.clipsToBounds = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var posterImage = MoviePosterImageView(frame: .zero)
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayer()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        posterImage.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImage.frame = contentView.bounds
        gradientLayer.frame = posterImage.bounds
    }
    
    // MARK: - UI Setup
    private func setUpLayer() {
        
        contentView.layer.cornerRadius = 16
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }
    
    private func setupUI() {
        
        contentView.addSubview(posterImage)
        contentView.addSubview(title)
        
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(1).cgColor
        ]
        gradientLayer.locations = [0.3, 1.0]
        posterImage.layer.addSublayer(gradientLayer)
        
        NSLayoutConstraint.activate([
            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            title.bottomAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: -8),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
    
    func configure(title: String, posterPath: String) {
        self.title.text = title
        self.posterImage.downloadImage(posterPath: posterPath)
    }
    
    // MARK: - Extension
    
}

