//
//  ApplicationComponentsFactory.swift
//  TMDB
//
//  Created by Maksym Shcheglov on 02/10/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import UIKit

/// The ApplicationComponentsFactory takes responsibity of creating application components and establishing dependencies between them.
final class ApplicationComponentsFactory {
    fileprivate lazy var useCase: MoviesUseCaseType = MoviesUseCase()
}

extension ApplicationComponentsFactory: ApplicationFlowCoordinatorDependencyProvider {

    func rootViewController() -> UINavigationController {
        let rootViewController = UINavigationController()
        rootViewController.navigationBar.tintColor = UIColor.black
        return rootViewController
    }
}

extension ApplicationComponentsFactory: MoviesSearchFlowCoordinatorDependencyProvider {

    func moviesSearchController(navigator: MoviesSearchNavigator) -> UIViewController {
        let viewModel = MoviesSearchViewModel(useCase: useCase, navigator: navigator)
        return MoviesSearchViewController(viewModel: viewModel)
    }

    func movieDetailsController(_ movieId: String) -> UIViewController {
        let viewModel = MovieDetailsViewModel(useCase: useCase)
        return MovieDetailsViewController(viewModel: viewModel)
    }
}