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
    @IBOutlet weak var search: UISearchBar!
    
    
    var presenter: NewsPresenterProtocol?
    var news = [MovieEntity]()
    var newsOrigin = [MovieEntity]()
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewsRouter.createModule(view: self)
        self.presenter?.getNewNews(page: currentPage + 1)
        self.newsTable.contentInset = UIEdgeInsets(top: search.frame.size.height, left: 0, bottom: 0, right: 0)
    }
    
    func setNews(news: MovieDataEntity?) {
        DispatchQueue.main.async {
            self.currentPage = news?.page ?? 1
            self.newsOrigin += news?.results ?? []
            self.filterNews(title: self.search.text ?? "")
        }
    }
    
    @IBAction func swipeUP(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.search.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, self.search.frame.size.height * -1, 0)
        }
    }
    
    
    @IBAction func swipeDown(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.search.layer.transform = CATransform3DIdentity
        }
    }
    
    func filterNews(title: String){
        if title != ""{
            self.news = newsOrigin.filter({ (movie) -> Bool in
                return movie.title?.lowercased().range(of: title.lowercased()) != nil
            })
        } else {
            self.news = newsOrigin
        }
        
        self.newsTable.reloadData()
    }
}
