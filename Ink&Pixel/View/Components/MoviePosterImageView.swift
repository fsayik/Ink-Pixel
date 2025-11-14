//
//  MoviePosterImageView.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 5.11.2025.
//

import UIKit
import Kingfisher

final class MoviePosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setUpLayer()
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayer() {
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.label.cgColor
        layer.shadowOffset = CGSize(width: -4, height: 4)
        layer.shadowOpacity = 0.3
    }
    
    func downloadImage(posterPath: String) {
        if let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
            kf.setImage(with: url, options: [
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ])
        }
    }
}
