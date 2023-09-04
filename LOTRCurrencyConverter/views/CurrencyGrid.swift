//
//  CurrencyGrid.swift
//  LOTRCurrencyConverter
//
//  Created by Jimmy Ghelani on 2023-09-04.
//

import SwiftUI

struct CurrencyGrid: View {
    
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    @Binding var currency: Currency
    
    
    var body: some View {
        LazyVGrid(columns: gridLayout, content: {
            ForEach(0..<Currency.allCases.count, id: \.hashValue) { i in
                if Currency.allCases[i] == currency {
                    CurrencyIcon(text: Currency.allCases[i].text, image: Currency.allCases[i].image)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                                .opacity(0.5)
                        )
                        .shadow(color: .black, radius: 9)
                } else {
                    CurrencyIcon(text: Currency.allCases[i].text, image: Currency.allCases[i].image)
                        .onTapGesture {
                            currency = Currency.allCases[i]
                        }
                }
            }
        })
        .padding([.bottom, .leading, .trailing])
    }
}

#Preview {
    CurrencyGrid(currency: .constant(.silverPenny))
}
