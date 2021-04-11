//
//  CardView.swift
//  News
//
//  Created by EsraaGK on 3/22/21.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    var item: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            KFImage(URL(string: item.urlToImage ?? ""))
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 2)
                .scaledToFit()
            Text(item.author ?? "").font(.headline).foregroundColor(Color.gray).bold()
            Text(item.title ?? "").font(.title).foregroundColor(Color.black)
            Text(item.description ?? "").font(.subheadline).foregroundColor(Color.gray.opacity(0.5))

        }
    }
    

}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(item: Article(source: nil, author: "hb", title: "tuy", description: "guy", url: "huhu", urlToImage: "guygu", publishedAt: "ygu", content: "huihu"))
    }
}
