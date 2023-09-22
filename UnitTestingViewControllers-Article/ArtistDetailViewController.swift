//
//  ArtistDetailViewController.swift
//  UnitTestingViewControllers-Article
//
//  Created by Vadym Bulavin on 11/8/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import UIKit

protocol ArtistDetailPresenter {
    func onViewLoaded()
    func onEdit()
}

protocol ArtistDetailComponent: AnyObject {
    func render(_ props: ArtistDetailProps)
}

class ArtistDetailPresenterImpl: ArtistDetailPresenter {
    weak var viewController: ArtistDetailComponent!
    
    func onViewLoaded() {
        viewController.render(.init(title: "A", fullName: "B", numberOfAlbums: "C", numberOfFollowers: "D"))
    }
    
    func onEdit() {}
}

class ArtistDetailViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var numberOfAlbumsLabel: UILabel!
    @IBOutlet weak var numberOfFollowersLabel: UILabel!
    
    var presenter: ArtistDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewLoaded()
    }
    
    @IBAction func onEdit(_ sender: UIBarButtonItem) {
        presenter.onEdit()
    }
}
//test 
extension ArtistDetailViewController: ArtistDetailComponent {
    func render(_ props: ArtistDetailProps) {
        navigationItem.title = props.title
        fullNameLabel.text = props.fullName
        numberOfAlbumsLabel.text = props.numberOfAlbums
        numberOfFollowersLabel.text = props.numberOfFollowers
    }
}

struct ArtistDetailProps {
    let title: String
    let fullName: String
    let numberOfAlbums: String
    let numberOfFollowers: String
}
