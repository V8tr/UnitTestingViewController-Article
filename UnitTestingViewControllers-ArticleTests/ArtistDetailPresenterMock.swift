//
//  ArtistDetailPresenterMock.swift
//  UnitTestingViewControllers-ArticleTests
//
//  Created by Vadym Bulavin on 11/11/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import Foundation
@testable import UnitTestingViewControllers_Article

class ArtistDetailPresenterMock: ArtistDetailPresenter {
    
    private(set) var onViewLoadedCalled = false
    
    func onViewLoaded() {
        onViewLoadedCalled = true
    }

    
    private(set) var onEditCalled = false
    
    func onEdit() {
        onEditCalled = true
    }
}
