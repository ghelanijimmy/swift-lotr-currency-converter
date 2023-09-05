//
//  ContentView.swift
//  LOTRCurrencyConverter
//
//  Created by Jimmy Ghelani on 2023-09-02.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftCurrency: Currency = (UserDefaults.standard.value(forKey: "leftCurrency") as? Currency ?? Currency.silverPiece)
    @State var rightCurrency: Currency = (UserDefaults.standard.value(forKey: "rightCurrency") as? Currency ?? Currency.goldPiece)
    
    @State var showExchangeInfo: Bool = false
    
    @State var leftAmount: String = ""
    @State var rightAmount: String = ""
    
    var body: some View {
        ZStack {
            //MARK: - BG Image
            Image(.background)
                .resizable()
                .ignoresSafeArea(.all)            
            //MARK: - MAIN Stack
            VStack {
                //MARK: - PRANCING PONY
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                //MARK: - CURENCY EXCHANGE TEXT
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //MARK: - CONVERSION SECTION
                HStack {
                    //MARK: - LEFT CONVERSION
                    ConversionSection(currency: $leftCurrency, otherCurrency: $rightCurrency, amount: $leftAmount, otherAmount: $rightAmount)
                    
                    //MARK: - EQUAL SIGN
                    Image(systemName: "equal")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                    //MARK: - RIGHT CONVERSION
                    ConversionSection(currency: $rightCurrency, otherCurrency: $leftCurrency, amount: $rightAmount, otherAmount: $leftAmount)
                } // END CONVERSION SECTION HSTACK
                .padding()
                .background(.black.opacity(0.5))
                .cornerRadius(100)
                
                Spacer()
                
                //MARK: - INFO BUTTON
                HStack {
                    Spacer()
                    Button(action: {
                        // DISPLAY EXCHANGE INFO SCREEN
                        showExchangeInfo.toggle()
                    }, label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .padding(.trailing)
                    })
                    .sheet(isPresented: $showExchangeInfo, content: {
                        ExchangeInfo()
                    })
                }
                
            } // END MAIN STACK
        }// END MAIN ZSTACK
    }
}

#Preview {
    ContentView()
}
