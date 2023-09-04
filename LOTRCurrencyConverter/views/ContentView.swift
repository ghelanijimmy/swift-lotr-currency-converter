//
//  ContentView.swift
//  LOTRCurrencyConverter
//
//  Created by Jimmy Ghelani on 2023-09-02.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece
    
    @State var showSelectCurrency: Bool = false
    @State var showExchangeInfo: Bool = false
    
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
                    VStack {
                        //MARK: - Currency
                        HStack {
                            
                            //MARK: - CURRENCY IMAGE
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                            
                            //MARK: - CURENCY TEXT
                            Text(leftCurrency.text)
                                .font(.headline)
                                .foregroundStyle(.white)
                        } // END CURENCY
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        
                        //MARK: - TEXT FIELD
                        TextField("Amount", text: $leftAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                        
                    } // END LEFT CONVERSION
                    
                    //MARK: - EQUAL SIGN
                    Image(systemName: "equal")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    
                    //MARK: - RIGHT CONVERSION
                    VStack {
                        //MARK: - Currency
                        HStack {
                            //MARK: - CURENCY TEXT
                            Text(rightCurrency.text)
                                .font(.headline)
                                .foregroundStyle(.white)
                            //MARK: - CURRENCY IMAGE
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)
                        } // END CURRENCY
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        .sheet(isPresented: $showSelectCurrency, content: {
                            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
                        })
                        
                        //MARK: - TEXT FIELD
                        TextField("Amount", text: $rightAmount)
                            .padding(7)
                            .background(Color(UIColor.systemGray6))
                            .cornerRadius(7)
                            .multilineTextAlignment(.trailing)
                    } // END RIGHT CONVERSION
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
