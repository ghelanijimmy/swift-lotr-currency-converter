//
//  ExchangeRate.swift
//  LOTRCurrencyConverter
//
//  Created by Jimmy Ghelani on 2023-09-03.
//

import SwiftUI

struct ExchangeRate: View {
    
    @State var leftImage: ImageResource
    @State var text: String
    @State var rightImage: ImageResource
    
    var body: some View {
        HStack {
            //MARK: - Left Currency Image
            Image(leftImage)
                .resizable()
                .scaledToFit()
            .frame(height: 33)
            //MARK: - Exchange Rate Text
            Text(text)
            
            //MARK: - Right Currency Image
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpenny, text: "1 Gold Penny = 4 Silver Pieces", rightImage: .silverpiece)
        .previewLayout(PreviewLayout.sizeThatFits)
}
