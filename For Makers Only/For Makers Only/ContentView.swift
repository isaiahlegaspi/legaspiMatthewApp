//
//  ContentView.swift
//  For Makers Only
//
//  Created by xcodeday on 12/8/23.
//

import SwiftUI

// search bar
struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("search...", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding([.leading, .trailing], 10)
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
    }
}
extension Color {
    init(hex:UInt) {
        self.init( .sRGB,
                   red: Double((hex & 0xFF0000) >> 16)/255.0,
                  green: Double((hex & 0x00FF00) >> 8)/255.0,
                   blue: Double(hex & 0x0000FF)/255.0,
                  opacity: 1.0)
    }
}

struct FontNameManager {
    struct Montserrat {
        static let light = "Montserrat-Light"
        static let regular = "Montserrat-Regular"
        static let bold = "Montserrat-ExtraBold"
    }
}

let headerFont = Font.custom(FontNameManager.Montserrat.bold, size: UIFont.preferredFont(forTextStyle:.largeTitle).pointSize)
let bodyFont = Font.custom(FontNameManager.Montserrat.regular, size: UIFont.preferredFont(forTextStyle: .body).pointSize)



struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("image1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                Text("It is what it is")
                    .font(.largeTitle)
                
                NavigationLink(destination: ProductView()){
                    Text("Next Page")
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.green)
                        .cornerRadius(9)
                    
                }
            }
            .padding()
        }
    }
}

struct ProductView: View {
    @State private var searchText =  ""
    let allProducts = (1..<7).map {"Product\($0)"}
    
    var filteredproducts: [String] {
        if searchText.isEmpty {
            return allProducts
        } else {
            return allProducts.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            let gridItems = [GridItem(.flexible(), spacing:10), GridItem(.flexible(), spacing:10)]
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 10) {
                    ForEach(filteredproducts, id: \.self) { product in
                        NavigationLink(destination: getPageViewForProduct(product)) {
                            VStack{
                                Spacer()
                                Image("image\(product.last!)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150, height: 150)
                                Text(product)
                                    .font(.caption)
                                    .foregroundColor(.black)
                                
                                
                                
                                Image("14-OZ.-HAVANA-Champagne-CANDLE-JAR-100x100")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                Text("14 OZ Vessel")
                                    .font(.largeTitle)
                                
                                Image("10-oz-monticiano-clear-candle-vessel")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                Text("9.5 OZ Vessel")
                                    .font(.largeTitle)
                                
                                Image("Candle_Wick_eco")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                Text("Cotton Wicks")
                                    .font(.largeTitle)
                                
                                Image("soy-wax-bowls-stock-Web")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                Text("Soy Wax")
                                    .font(.largeTitle)
                                Image("soy-wax-bowls-stock-Web")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150, height: 150)
                                Text("Soy Wax")
                                    .font(.largeTitle)
                                
                            }
                        }
                    }
                }
            }
            
        }
    }
    func getPageViewForProduct(_ product: String) -> some View {
        guard let productNumber = Int(String(product.last ?? "1")) else {
            return AnyView(EmptyView())
        }
        switch productNumber {
        case 1:
            return AnyView(EmptyView())
        case 2:
            return AnyView(EmptyView())
        default:return AnyView(EmptyView())
        }
    }}
                               
    
    #Preview {
        ContentView()
    }
