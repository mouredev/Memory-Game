//
//  MenuView.swift
//  MemoryGame
//
//  Created by Brais Moure on 11/5/22.
//

import SwiftUI

struct MenuView: View {
    
    private var viewModel = MenuViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: .medium) {
                
                TitleView(key: viewModel.titleTextKey.key())

                Image(viewModel.randomImageId())
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.accentColor)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                
                Spacer()
                
                SubtitleView(key: viewModel.subtitleTextKey.key())
                
                ForEach(DifficultyLevel.allCases, id: \.self) { difficultyLevel in
                    NavigationLink(destination: BoardView(difficultyLevel: difficultyLevel), label: {
                        MenuButtonView(key: difficultyLevel.nameKey.key())
                    })
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
        MenuView().preferredColorScheme(.dark)
    }
}
