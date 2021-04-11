//
//  ContentView.swift
//  News
//
//  Created by EsraaGK on 3/22/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var newsStore = NewsStore() // new store
    
    var body: some View {
        NavigationView {
            List(newsStore.results.indices, id: \.self) { index in
                NavigationLink(destination: DetailsView(item: newsStore.results[index])) {
                    CardView(item: newsStore.results[index])
                        .onAppear(perform: { //pagenation
                            self.getNextPageIfNecessary(encounteredIndex: index)
                        })
                }
            }
            .navigationBarTitle(Text("Today"), displayMode: .automatic)//.navigationBarItems(trailing: Image("profile"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Help tapped!")
                    }, label: {
                        Image("profile")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    })
                }
            }
            .onAppear(perform: { // first load
                newsStore.loadData(isRefreshing: true)
            })
            
        }
    }
    
    private func getNextPageIfNecessary(encounteredIndex: Int) {
        guard encounteredIndex == newsStore.results.count - 1 else { return }
        newsStore.loadData(isRefreshing: false)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
