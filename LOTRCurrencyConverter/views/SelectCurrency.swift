//
//  SelectCurrency.swift
//  LOTRCurrencyConverter
//
//  Created by Jimmy Ghelani on 2023-09-03.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismiss
    @State var gridLayout = [GridItem(), GridItem(), GridItem()]
    var body: some View {
        ZStack {
            //MARK: - BG Immage
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack {
                // TEXT
                Text("Select the currency you are starting with")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Currency Icons
                
                // Text
                Text("Select the currency you would like to convert to")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                // Currency Icons
                LazyVGrid(columns: gridLayout, content: {
                    ForEach(0..<5) { _ in
                        CurrencyIcon(text: "Copper Penny", image: .copperpenny)
                    }
                })
                
                // Done Button
                Button("Done") {
                    dismiss()
                }
                .font(.largeTitle).padding(10)
                .foregroundStyle(.white)
                .background(.brown)
                .clipShape(RoundedRectangle(cornerRadius: 15.0))
            }
        }
    }
}

#Preview {
    SelectCurrency()
}
