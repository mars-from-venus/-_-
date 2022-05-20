//
//  SiteRequest2.swift
//  Quiz17
//
//  Created by mars on 2021/10/23.
//

import Foundation

class SiteRequest2{
    let siteName: String
    
    init(_ site:String){
        siteName = site
        loadWebpage()
    }
    func loadWebpage() -> URLRequest {
        let myUrl = URL(string: siteName)
        return URLRequest(url: myUrl!)
    }
}
