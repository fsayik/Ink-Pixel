//
//  MovieDetailTitleView.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 14.11.2025.
//

import UIKit

final class MovieDetailTitleView: UICollectionReusableView {
    static let identifier = "MovieDetailTitleView"
    
    private let posterImageView = MoviePosterImageView(frame: .zero)
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .boldSystemFont(ofSize: 24)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let ratingLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 18, weight: .semibold)
        lbl.textColor = .systemYellow
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.ratingLabel.text = nil
        posterImageView.image = nil
    }
    
    private func setupUI() {
        addSubViews(posterImageView, titleLabel, ratingLabel)
       
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            
            ratingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            ratingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func configure(with movie: MovieDetail) {
        posterImageView.downloadImage(posterPath: movie.posterPath!)
        titleLabel.text = movie.title
        ratingLabel.text = "⭐️ \(movie.voteAverage?.description ?? "")"
    }
}
