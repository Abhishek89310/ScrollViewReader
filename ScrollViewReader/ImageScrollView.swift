//
//  ImageScrollView.swift
//  ScrollViewReader
//
//  Created by Matrix on 03/04/24.
//

import SwiftUI

struct ImageScrollView: View {
    let photos:[UIImage] = [UIImage(imageLiteralResourceName: "1"), UIImage(imageLiteralResourceName: "2"), UIImage(imageLiteralResourceName: "3"),UIImage(imageLiteralResourceName: "4")]
    @State private var currentIndex = 0
    var body: some View {
        VStack{
            ScrollViewReader{scrollView in
                ScrollView(.horizontal){
                    HStackLayout(alignment: .center){
                        ForEach(photos.indices, id: \.self) { index in
                            Image(uiImage: photos[index])
                                .resizable()
                                .scaledToFill()
                                .cornerRadius(25)
                                .padding(.horizontal, 5)
                        }
                    }
                }
                HStack {
                    Button(action: {
                            withAnimation {
                                scrollView.scrollTo(0)
                            }
                        }) {
                            Image(systemName: "backward.end.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.black)
                        }
                     
                        Button(action: {
                            withAnimation {
                                currentIndex = (currentIndex == 0) ? currentIndex : currentIndex - 1
                                scrollView.scrollTo(currentIndex)
                            }
                        }) {
                            Image(systemName: "arrowtriangle.backward.circle")
                                .font(.system(size: 50))
                                .foregroundColor(.black)
                        }
                    Button(action: {
                           withAnimation {
                               currentIndex = (currentIndex == photos.count - 1) ? currentIndex : currentIndex + 1
                               scrollView.scrollTo(currentIndex)
                           }
                       }) {
                           Image(systemName: "arrowtriangle.forward.circle")
                               .font(.system(size: 50))
                               .foregroundColor(.black)
                       }
                    
                       Button(action: {
                           withAnimation {
                               scrollView.scrollTo(photos.count - 1)
                           }
                       }) {
                           Image(systemName: "forward.end.fill")
                               .font(.system(size: 50))
                               .foregroundColor(.black)
                       }
                }
                
                .frame(height: 70)
            }
        }
    }
}

#Preview {
    ImageScrollView()
}
