//
//  VideoListView.swift
//  SwiftUI-List-Starter
//
//  Created by Sean Allen on 4/23/21.
//

import SwiftUI

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

struct VideoListView: View {
    var videos: [Video] = VideoList.topTen
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List(videos, id: \.id ) { item in
                    NavigationLink(destination: VideoDetailView(video: item), label: {
                        VideoRowView(
                            imageName: item.imageName,
                            title: item.title,
                            date: item.uploadDate
                        )
                    })
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle(
                    Text("Sean's Top 10"),
                    displayMode: .inline
                )
            }
        }
    }
}

struct VideoRowView: View {
    var imageName: String
    var title: String
    var date: String
    
    var body: some View {
        HStack() {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 4)
            
            VStack(alignment: .leading, spacing: 5){
                Text(title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
