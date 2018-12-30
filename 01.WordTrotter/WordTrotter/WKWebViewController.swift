//
//  WKWebViewController.swift
//  WordTrotter
//
//  Created by 소영 on 2018. 12. 30..
//  Copyright © 2018년 소영. All rights reserved.
//

//import Foundation
import UIKit
import WebKit

class WKWebViewController: UIViewController {
    var webView: WKWebView!
    override func loadView(){
        webView = WKWebView()
        view = webView
        if let url = URL(string: "https://www.bignerdranch.com"){
            let request = URLRequest(url: url)
            webView.load(request)
        }
//        let margins = view.layoutMarginsGuide
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        print("WebViewController loaded its view.")
    }
}

