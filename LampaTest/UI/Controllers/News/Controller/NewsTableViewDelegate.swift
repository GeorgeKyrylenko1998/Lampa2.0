//
//  NewsTableViewDelegate.swift
//  LampaTest
//
//  Created by George Kyrylenko on 7/29/18.
//  Copyright © 2018 George Kyrylenko. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        cell.title.text = news[indexPath.row].title
        cell.descriptionLbl.text = news[indexPath.row].overview
        cell.score.text = "\(Int((news[indexPath.row].vote_average ?? 0) * 10))%"
        let green = CGFloat((news[indexPath.row].vote_average ?? 0) / 10.0)
        cell.scoreView.backgroundColor = UIColor(red: 0.5, green: green, blue: 0.0, alpha: 1.0)
        cell.poster.kf.setImage(with: ImageUrl.getDownloadURL(path: news[indexPath.row].poster_path ?? ""))
        return cell
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height{
            self.presenter?.getNewNews(page: currentPage + 1)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: "ALERT", message: news[indexPath.row].title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
 
    
}
