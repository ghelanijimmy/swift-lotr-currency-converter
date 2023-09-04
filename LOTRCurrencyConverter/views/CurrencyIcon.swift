//
//  CurrencyIcon.swift
//  LOTRCurrencyConverter
//
//  Created by Jimmy Ghelani on 2023-09-03.
//

import SwiftUI

struct CurrencyIcon: View {
    @State var text: String
    @State var image: ImageResource
    
    var body: some View {
        ZStack {
            // Currency Image
            Image(image)
                .resizable()
                .scaledToFit()
            // Currency Text
            VStack {
                Spacer()
                
                Text(text)
                    .padding(3)
                    .font(.caption)
                .background(.brown.opacity(0.75))
            }
        }
        .padding(3)
        .frame(width: 100, height: 100)
        .background(.brown)
        .clipShape(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    CurrencyIcon(text: "Copper Penny", image: .copperpenny)
        .previewLayout(.sizeThatFits)
}
