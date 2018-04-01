//
//  PagingMenuOptions.swift
//  HackerNews
//
//  Created by Dhiraj Das on 4/1/18.
//  Copyright © 2018 Dhiraj Das. All rights reserved.
//

import Foundation
import PagingMenuController

struct PagingMenuOptions: PagingMenuControllerCustomizable {
    let commentVC = PagingMenuOptions.commentViewController()
    let articleVC = PagingMenuOptions.articleViewController()
    
    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(),
                    pagingControllers: [commentVC, articleVC])
    }
    
    var lazyLoadingPage: LazyLoadingPage {
        return .all
    }
    
    struct MenuOptions: MenuViewCustomizable {
        var selectedBackgroundColor: UIColor {
            return .orange
        }
        
        var backgroundColor: UIColor {
            return .orange
        }
        
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        
        var focusMode: MenuFocusMode {
            return .underline(height: 4,
                              color: .white,
                              horizontalPadding: 0,
                              verticalPadding: 0)
        }
        
        var itemsOptions: [MenuItemViewCustomizable] {
            return [CommentMenuItem(), ArticleMenuItem()]
        }
    }
    
    struct CommentMenuItem: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let text = MenuItemText(text: "Comment",
                                    color: UIColor.white,
                                    selectedColor: UIColor.white,
                                    font: UIFont.systemFont(ofSize: 18),
                                    selectedFont: UIFont.systemFont(ofSize: 18))
            return .text(title: text)
        }
    }
    
    struct ArticleMenuItem: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let text = MenuItemText(text: "Article",
                                    color: UIColor.white,
                                    selectedColor: UIColor.white,
                                    font: UIFont.systemFont(ofSize: 18),
                                    selectedFont: UIFont.systemFont(ofSize: 18))
            return .text(title: text)
        }
    }
    
    private static func commentViewController() -> CommentViewController {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let identifier = String(describing: CommentViewController.self)
        guard let commentViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
            as? CommentViewController else { return CommentViewController() }
        return commentViewController
    }
    
    private static func articleViewController() -> ArticleViewController {
        let storyBoard = UIStoryboard(name: "Home", bundle: nil)
        let identifier = String(describing: ArticleViewController.self)
        guard let articleViewController = storyBoard.instantiateViewController(withIdentifier: identifier)
            as? ArticleViewController else { return ArticleViewController() }
        return articleViewController
    }
}
