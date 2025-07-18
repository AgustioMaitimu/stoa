//
//  HomeScreen.swift
//  
//
//  Created by Wira Wibisana on 15/07/25.
//
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.stoaDarkBlue)
                .ignoresSafeArea()
            GIFView(gifName: "scribbleRestless")
                .frame(width: 324, height: 324)
                .offset(y: -24)
            VStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.stoaBlack)
                    HStack{
                        Text("Collection")
                            .font(Font.custom("AveriaSerifLibre-Bold", size: 17, relativeTo: .body))
                        Image(systemName: "bookmark.fill")
                    }
                    .foregroundStyle(.stoaGold)
                }
                .frame(width: 140, height: 32)
                .offset(y: 50)
                Text("Tap anywhere to start")
                .font(Font.custom("AveriaSerifLibre-Regular", size: 20))
                .kerning(0.4)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .offset(y: 118)
                Spacer()
                Text("SheetPlaceholder") //Help to replace this as the stylized sheet
                    .foregroundColor(.white)
            }
        }
        
    }
}

#Preview {
    HomeScreen()
}
