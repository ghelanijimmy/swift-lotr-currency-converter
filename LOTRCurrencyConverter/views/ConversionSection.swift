//
//  ConversionSection.swift
//  LOTRCurrencyConverter
//
//  Created by Jimmy Ghelani on 2023-09-05.
//

import SwiftUI

struct ConversionSection: View {
    @Binding var currency: Currency
    @Binding var otherCurrency: Currency
    @Binding var amount: String
    @Binding var otherAmount: String
    @State var tempAmount: String = ""
    @State var typing: Bool = false
    
    @State var showSelectCurrency: Bool = false
    
    var body: some View {
        VStack {
            //MARK: - Currency
            HStack {
                
                //MARK: - CURRENCY IMAGE
                Image(currency.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 33)
                
                //MARK: - CURENCY TEXT
                Text(currency.text)
                    .font(.headline)
                    .foregroundStyle(.white)
            } // END CURENCY
            .padding(.bottom, -5)
            .onTapGesture {
                showSelectCurrency.toggle()
            }
            .sheet(isPresented: $showSelectCurrency, content: {
                SelectCurrency(leftCurrency: $currency, rightCurrency: $otherCurrency)
            })
            
            //MARK: - TEXT FIELD
            TextField("Amount", text: $amount, onEditingChanged: { hasChanged in
                typing = hasChanged
                tempAmount = amount
            })
                .padding(7)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(7)
                .keyboardType(.decimalPad)
                .onChange(of: typing ? amount : tempAmount) {
                    otherAmount = currency.convert(amountString: amount, to: otherCurrency)
                }
                .onChange(of: currency) {
                    amount = otherCurrency.convert(amountString: otherAmount, to: currency)
                }
            
        } // END LEFT CONVERSION
    }
}


#Preview {
    ConversionSection(currency: .constant(Currency.silverPiece), otherCurrency: .constant(Currency.goldPiece), amount: .constant(""), otherAmount: .constant(""))
}
