//
//  ArtistDetailViewControllerTests.swift
//  UnitTestingViewControllers-ArticleTests
//
//  Created by Vadym Bulavin on 11/11/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import XCTest
@testable import UnitTestingViewControllers_Article

class ArtistDetailsRouter {
    init(navController: UINavigationController?, editProvider: @escaping () -> UIViewController) {
        self.navController = navController
        self.editProvider = editProvider
    }
    
    let navController: UINavigationController?
    let editProvider: () -> UIViewController
    
    func showEdit() {
        navController?.pushViewController(editProvider(), animated: true)
    }
}

class NavControllerSpy: UINavigationController {
    
    var lastPushedViewController: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        lastPushedViewController = viewController
    }
}

class ArtistDetailViewControllerTests: XCTestCase {
    
    let presenter = ArtistDetailPresenterMock()

    func testViewDidLoadCallsPresenter() {
        let sut = makeSUT()
        
        sut.viewDidLoad()
        
        XCTAssertTrue(presenter.onViewLoadedCalled)
    }

    func testOnEditCallsPresenter() {
        let sut = makeSUT()
        
        sut.onEdit(.init())
        
        XCTAssertTrue(presenter.onEditCalled)
    }

    func testRender() {
        let props = ArtistDetailProps(title: "TITLE", fullName: "NAME", numberOfAlbums: "1", numberOfFollowers: "2")
        
        let sut = makeSUT()
        
        sut.render(props)
        
        XCTAssertEqual(sut.navigationItem.title, "TITLE")
        XCTAssertEqual(sut.fullNameLabel.text, "NAME")
        XCTAssertEqual(sut.numberOfAlbumsLabel.text, "1")
        XCTAssertEqual(sut.numberOfFollowersLabel.text, "2")
    }
    
    // MARK: - Helpers
    
    func makeSUT() -> ArtistDetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "ArtistDetailViewController") as! ArtistDetailViewController
        sut.presenter = presenter
        sut.loadViewIfNeeded()
        return sut
    }

}
