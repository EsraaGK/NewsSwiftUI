//
//  DetailsView.swift
//  News
//
//  Created by EsraaGK on 29/03/2021.
//

import SwiftUI
import Kingfisher

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var item: Article
    
    var body: some View {
        ScrollView {
            KFImage(URL(string: item.urlToImage ?? ""))
                .resizable()
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height / 2)
                .scaledToFit()
                .overlay(Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }).position(x: UIScreen.main.bounds.width - 40, y: 70))
            
            
            VStack(alignment: .leading, spacing: 10.0) {
                Text(item.author ?? "").font(.headline).foregroundColor(Color.gray).bold()
                Text(item.title ?? "").font(.title).foregroundColor(Color.black)
                Text(item.description ?? "").font(.subheadline).foregroundColor(Color.gray.opacity(0.5))
            }
            
        }.navigationBarTitle(Text(item.title ?? ""), displayMode: .inline)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(item: Article(source: nil, author: "hb", title: "tuy", description: "guy", url: "huhu", urlToImage: "guygu", publishedAt: "ygu", content: "huihu"))
    }
}
