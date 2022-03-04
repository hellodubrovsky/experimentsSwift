//
//  ViewController.swift
//  ExampleCollectionView
//
//  Created by Илья on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var profiles: [Profile] = []
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .systemGray
        return collectionView
    }()
    
    //
    private enum LayoutCostant {
        static let spacing: CGFloat = 16.0
        static let itemHeight: CGFloat = 300.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayouts()
        populateProfiles()
        collectionView.reloadData()
    }
    
    private func setupViews() {
        view.backgroundColor = .systemRed
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: ProfileCell.identifier)
    }
    
    private func setupLayouts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    private func populateProfiles() {
        profiles = [
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-1", profession: "God Thunder"),
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-2", profession: "God Thunder"),
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-3", profession: "God Thunder"),
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-4", profession: "God Thunder"),
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-5", profession: "God Thunder"),
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-1", profession: "God Thunder"),
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-2", profession: "God Thunder"),
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-3", profession: "God Thunder"),
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-4", profession: "God Thunder"),
            Profile(name: "Thor", location: "Asgard", imageName: "imageExample-5", profession: "God Thunder")]
    }
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        let profile = profiles[indexPath.row]
        cell.setup(with: profile)
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(for: view.frame.width, spacing: LayoutCostant.spacing)
        return CGSize(width: 100, height: LayoutCostant.itemHeight)
    }
    
    func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 2
        let totalSpasing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpasing) / itemsInRow
        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: LayoutCostant.spacing, left: LayoutCostant.spacing, bottom: LayoutCostant.spacing, right: LayoutCostant.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutCostant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return LayoutCostant.spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.init(red: CGFloat(Int.random(in: 0 ... 255)) / 255.0, green: CGFloat(Int.random(in: 0 ... 255)) / 255.0, blue: CGFloat(Int.random(in: 0 ... 255)) / 255.0, alpha: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did select cell at \(indexPath.row)")
        let vc = UIViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
