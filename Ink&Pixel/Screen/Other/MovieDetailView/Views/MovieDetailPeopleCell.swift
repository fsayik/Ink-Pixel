//
//  MovieDetailPeopleCell.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 14.11.2025.
//

import UIKit

final class MovieDetailPeopleCell: UICollectionViewCell {
    static let identifier = "MovieDetailPeopleCell"
    
   
    private let imageView = MoviePosterImageView(frame: .zero)
    
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    let department: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 12)
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
        self.name.text = nil
        self.department.text = nil
        imageView.image = nil
    }
    
    func configure(with people: Cast) {
        imageView.downloadImage(posterPath: people.profilePath ?? "")
        self.name.text = people.name
        self.department.text = people.department
    }
    
    private func setUpLayer() {
        layer.shadowColor = UIColor.label.cgColor
        layer.shadowOffset = CGSize(width: -4, height: 4)
        layer.shadowOpacity = 0.3
    }
    
    private func setupUI() {
        addSubViews(imageView, name, department)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: contentView.bounds.height * 0.7),
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            name.leadingAnchor.constraint(equalTo: leadingAnchor),
            name.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            department.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            department.leadingAnchor.constraint(equalTo: leadingAnchor),
            department.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
    }
}
