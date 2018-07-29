//
//  NewsViewController.swift
//  LampaTest
//
//  Created George Kyrylenko on 7/29/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class NewsViewController: UIViewController, NewsViewProtocol {
    
    @IBOutlet weak var newsTable: UITableView!
    
    
	var presenter: NewsPresenterProtocol?
    var news = [MovieEntity]()
    var currentPage = 0

	override func viewDidLoad() {
        super.viewDidLoad()
        NewsRouter.createModule(view: self)
        self.presenter?.getNewNews(page: currentPage + 1)
    }
    
    func setNews(news: MovieDataEntity?) {
        DispatchQueue.main.async {
            self.currentPage = news?.page ?? 1
            self.news += news?.results ?? []
            self.newsTable.reloadData()
        }
    }
}
