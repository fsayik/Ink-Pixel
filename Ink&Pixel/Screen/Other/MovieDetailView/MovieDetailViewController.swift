//
//  MovieDetailViewController.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 8.11.2025.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    
    //MARK: Section
    enum Section: Int, CaseIterable {
        case header
        case overview
        case videos
        case cast
        
        var title: String {
            switch self {
            case .header:
                return ""
            case .overview:
                return "Overview"
            case .videos:
                return "Videos"
            case .cast:
                return "Casts"
            }
        }
    }
    
    // MARK: - Variable
    private var viewModel: MovieDetailViewModelProtocol
    private var coordinator: Coordinator
    
    // MARK: - UI Components
       
    private var collectionView: UICollectionView!
    
    // MARK: - Init
    init(coordinator: Coordinator,
         viewModel: MovieDetailViewModelProtocol) {
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
        view.backgroundColor = .systemBackground
        viewModel.delegate = self
        
        setupCollectionView()
        setCollectionViewConstraints()
        
        // Fetch data
        viewModel.getMovieInfoData()
        viewModel.getCastData()
        viewModel.getCreditData()
        viewModel.getVideosData()
    }
    
    // MARK: - UI Setup
  
    private func setCollectionViewConstraints() {
        view.addSubViews(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
       
        collectionView.register(MovieDetailHeaderCell.self, forCellWithReuseIdentifier: MovieDetailHeaderCell.identifier)
        collectionView.register(MovieDetailOverviewCell.self, forCellWithReuseIdentifier: MovieDetailOverviewCell.identifier)
        collectionView.register(MovieDetailVideosCell.self, forCellWithReuseIdentifier: MovieDetailVideosCell.identifier)
        collectionView.register(MovieDetailPeopleCell.self, forCellWithReuseIdentifier: MovieDetailPeopleCell.identifier)
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            
            let sectionType = Section.allCases[sectionIndex]
            switch sectionType {
            case .header:
                return Self.createHeaderSection()
            case .overview:
                return Self.createOverviewSection()
            case .videos:
                return Self.createHorizontalSection(height: 150, width: 200)
            case .cast:
                return Self.createHorizontalSection(height: 300, width: 160)
            }
        }
    }
    
    static func createHeaderSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:
            .init(widthDimension: .fractionalWidth(1.0),
                  heightDimension: .fractionalHeight(1.0))
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .absolute(450)),
            subitems: [item]
        )
        return NSCollectionLayoutSection(group: group)
    }
    
    static func createOverviewSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize:
            .init(widthDimension: .fractionalWidth(1.0),
                  heightDimension: .estimated(150))
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(widthDimension: .fractionalWidth(1.0),
                              heightDimension: .estimated(300)),
            subitems: [item]
        )
        return NSCollectionLayoutSection(group: group)
    }
    
    static func createHorizontalSection(height: CGFloat, width: CGFloat) -> NSCollectionLayoutSection {

        let item = NSCollectionLayoutItem(
            layoutSize: .init(widthDimension: .absolute(width),
                              heightDimension: .absolute(height))
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(widthDimension: .estimated(width),
                              heightDimension: .absolute(height)),
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        section.contentInsets = .init(top: 20, leading: 16, bottom: 10, trailing: 16)

        return section
    }
    
       
}
// MARK: - Extension

// MARK: - LibraryViewModelDelegate
extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
   
}

extension MovieDetailViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sec = Section.allCases[section]
        
        switch sec {
        case .header: return 1
        case .overview: return 1
        case .videos: return viewModel.movieVideosResult?.count ?? 0
        case .cast: return viewModel.movieCastResult?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sec = Section.allCases[indexPath.section]
        
        switch sec {
            
        case .header:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailHeaderCell.identifier, for: indexPath) as? MovieDetailHeaderCell else { fatalError()}
            cell.configure(with: viewModel.movieDetail!)
            return cell
        case .overview:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailOverviewCell.identifier, for: indexPath) as! MovieDetailOverviewCell
            cell.configure(text: viewModel.movieDetail!.overview!)
            return cell
        case .videos:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailVideosCell.identifier, for: indexPath) as! MovieDetailVideosCell
            cell.configure(title: viewModel.movieVideosResult![indexPath.row].name!)
            return cell
        case .cast:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailPeopleCell.identifier, for: indexPath) as! MovieDetailPeopleCell
            cell.configure(with: viewModel.movieCastResult![indexPath.row])
            return cell
            
        }
    }
    
}
