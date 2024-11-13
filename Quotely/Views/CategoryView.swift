//
//  CategoryView.swift
//  Quotely
//
//  Created by Maxim Svidrak on 11.11.24.
//

import SwiftUI

struct CategoryView: View {
    
    
    @State private var quoteCategories: [String] = []
    @State private var categoryQuotes: [String: [Quote]] = [:]
    @State private var selectedLanguage: String = "English"
    @State private var isPickerShown: Bool = false
    
    
    
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Text("Categories")
                    .font(.title.bold())
                    .padding(.bottom)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        isPickerShown.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $isPickerShown) {
                        Text("Enter a language")
                            .font(.title.bold())
                            .padding()
                        
                        Picker ("Language", selection: $selectedLanguage) {
                            Text("English").tag("English")
                            Text("Deutsch").tag("Deutsch")
                        }
                        .pickerStyle(.segmented)
                        .padding()
                        
                        Button(action: {
                            isPickerShown.toggle()
                        }) {
                            Text ("Save")
                                .font(.title.bold())
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(quoteCategories, id: \.self) { category in
                        NavigationLink(destination: CategoryDetailView(
                            category: category,
                            quotes: categoryQuotes[category] ?? []
                        )) {
                            Text(displayCategoryName(for: category))
                                .foregroundStyle(.black)
                        }
                        .frame(height: 80)
                        .onAppear {
                            loadQuotes(category: category)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .padding()
                    .font(.headline)
                    .background(Color.white)
                    .clipShape(.buttonBorder)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 0)
                    .padding()
                }
                .onAppear{
                    fetchCategories()
                }
            }
            
        }
        .navigationTitle("Categories")
    }
    
    //для языка
    private func displayCategoryName(for category: String) -> String {
            if selectedLanguage == "Deutsch",
               let quoteCategory = QouteLanguage(rawValue: category.lowercased()) {
                return quoteCategory.localized
            }
            return category.capitalizingFirstLetter()
        }
    
    private func getQuoteCategoryFromAPI() async throws -> [String] {
        
        let urlString = "https://api.syntax-institut.de/categories"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode([String].self, from: data)
        
        return result
        
        
    }
    
    private func fetchCategories() {
        Task {
            do {
                let categories = try await getQuoteCategoryFromAPI()
                self.quoteCategories = categories
            } catch {
                print(error)
            }
        }
    }
    
    private func getQuotesCategoryFromAPI(category: String) async throws -> [Quote] {
        let urlString = "https://api.syntax-institut.de/quotes?limit=1000&category=\(category)"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let quotes = try JSONDecoder().decode([Quote].self, from: data)
        
        return quotes
    }
    
    private func loadQuotes(category: String) {
        Task {
            do {
                let quotes = try await getQuotesCategoryFromAPI(category: category)
                self.categoryQuotes[category] = quotes
            } catch {
                print(error)
            }
        }
    }
}

#Preview {
    CategoryView()
}
