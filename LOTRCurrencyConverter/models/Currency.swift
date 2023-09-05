//
//  Currency.swift
//  LOTRCurrencyConverter
//
//  Created by Jimmy Ghelani on 2023-09-03.
//

import Foundation
import SwiftUI

enum Currency: Double, CaseIterable {
    case copperPenny = 640
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    
    func convert(amountString: String, to currency: Currency) -> String {
        guard let startAmount = Double(amountString) else {
            return ""
        }
        
        let convertedAmount = (startAmount / self.rawValue) * currency.rawValue
        
        return convertedAmount > 0 ? String(format: "%.2f", convertedAmount) : ""
    }
    
    var image: ImageResource {
        switch self {
        case .copperPenny:
            return .copperpenny
        case .silverPenny:
            return .silverpenny
        case .silverPiece:
            return .silverpiece
        case .goldPenny:
            return .goldpenny
        case .goldPiece:
            return .goldpiece
        }
    }
    
    var text: String {
        switch self {
        case .copperPenny:
            return "Copper Penny"
        case .silverPenny:
            return "Silver Penny"
        case .silverPiece:
            return "Silver Piece"
        case .goldPenny:
            return "Gold Penny"
        case .goldPiece:
            return "Gold Piece"
        }
    }
}

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
