//
//  WhatchlistViewController.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import UIKit

final class WhatchlistViewController: UIViewController {
    
    // MARK: - Variable
    private var viewModel: WhatchlistViewModelProtocol
    private var coordinator: Coordinator
    
    // MARK: - UI Components
    private let movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let numberOfColumns: CGFloat = 2
        let totalHorizontalPadding = layout.sectionInset.left + layout.sectionInset.right + (layout.minimumInteritemSpacing * (numberOfColumns - 1))
        let cellWidth = (UIScreen.main.bounds.width - totalHorizontalPadding) / numberOfColumns
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.3)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    
    // MARK: - Init
    init(coordinator: Coordinator,
         viewModel: WhatchlistViewModelProtocol) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getPopulerMovie()
        setupUI()
        setCollectionViewLayout()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(movieCollectionView)
        navigationItem.title = "Populer Movies"
        
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            movieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
        
    private func setCollectionViewLayout() {
        movieCollectionView.delegate = self
        movieCollectionView.dataSource = self
        movieCollectionView.register(WhatchlistMovieCell.self, forCellWithReuseIdentifier: WhatchlistMovieCell.cellIdentifier)
    }
    
}
// MARK: - Extension

// MARK: - WhatchlistViewModelDelegate
extension WhatchlistViewController: WhatchlistViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.movieCollectionView.reloadData()
        }
        
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension WhatchlistViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.popularMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = movieCollectionView.dequeueReusableCell(withReuseIdentifier: WhatchlistMovieCell.cellIdentifier, for: indexPath) as? WhatchlistMovieCell else {
            return UICollectionViewCell()
        }
        cell.configure(title: viewModel.popularMovies[indexPath.item].title!, posterPath: viewModel.popularMovies[indexPath.item].posterPath ?? "/wwemzKWzjKYJFfCeiB57q3r4Bcm.svg")
        return cell
    }
    
    // For pagining
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        guard contentHeight != 0 else { return }
        
        if offsetY >= contentHeight - (2 * height) && viewModel.shouldDownloadMore {
            viewModel.getPopulerMovie()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MovieDetailViewBuilder.build(coordinator: coordinator, movieId: viewModel.popularMovies[indexPath.item].id!)
        coordinator.eventOccurred(with: vc)
    }
    
}
