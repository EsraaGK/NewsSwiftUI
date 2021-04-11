//
//  NewsStore.swift
//  News
//
//  Created by EsraaGK on 28/03/2021.
//

import SwiftUI

class NewsStore: ObservableObject {

    @Published var results = [Article]()

    var currentPage = 1

    var url: URL? {
        URL(string: "https://newsapi.org/v2/everything?q=egypt&from=2021-04-11&apiKey=bbb0fc310ea44afb88d8952e2c8bdbc5&pageSize=10&page=\(currentPage)")
    }
        
    func loadData(isRefreshing: Bool) {
        
        if isRefreshing {
            currentPage = 1
            results.removeAll()
        }
        
        guard let url = url else {
            fatalError("Your API end point is Invalid")
        }
        
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    guard response.status == "ok", let items = response.articles else { return }

                    
                    self.currentPage += 1
                    DispatchQueue.main.async {
                        self.results.append(contentsOf: items)
                    }
                } catch {
                    fatalError("Couldn't parse \(Response.self):\n\(error)")
                }
            } else {
                fatalError("Couldn't get data")
            }
        }.resume()
    }
}
