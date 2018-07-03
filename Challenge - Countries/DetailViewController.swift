//
//  DetailViewController.swift
//  Challenge - Countries
//
//  Created by Catalin Palade on 02/07/2018.
//  Copyright © 2018 Catalin Palade. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailsCountry: Country!
    
    override func loadView() {
        webView = WKWebView()
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard detailsCountry != nil else { return }
        
        var html = "<html>"
        html += "<head>"
        html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
        html += "</head>"
        html += "<body>"
        html += "<img src=\"\(detailsCountry.flagUrl)\" border=\"1\" style=\"max-width:300px;max-height:150px;\">"
        html += "<p></p>"
        html += detailsCountry.name
        html += "<p>Capital: \(detailsCountry.capital)</p>"
        html += "<p>Population: \(detailsCountry.population/1000000).\(detailsCountry.population%1000000/10000) milions</p>"
        html += "<p>Area: \(detailsCountry.area) km²</p>"
        html += "<p>Currency: \(detailsCountry.currency)</p>"
        html += "<p>Language: \(detailsCountry.language)</p>"
        html += "</body>"
        html += "</html>"

        webView.loadHTMLString(html, baseURL: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
