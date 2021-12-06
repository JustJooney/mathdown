//
//  HighscoreView.swift
//  mathdown
//
//  Created by Joon Kang on 12/1/21.
//

import SwiftUI

struct HighscoreView: View {
    
    @FetchRequest(entity: ScoreList.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ScoreList.scorePoint, ascending: false)]) var scoreLists: FetchedResults<ScoreList>
    
    var body: some View {
        List {

            Text("Score Board")
                .font(.system(size: 50))
                .bold()
        
            ForEach(0..<scoreLists.count, id: \.self) { score in
                HStack {
                    Text("#\(score + 1) \(scoreLists[score].scoreName ?? "")")
                        .font(.title2)
                    Spacer()
                    Text("\(scoreLists[score].scorePoint) points")
                        .font(.title2)
                }
            }
        }
        .environment(\.colorScheme, .light)
        .listStyle(.insetGrouped)
    }
}

struct HighscoreView_Previews: PreviewProvider {
    static var previews: some View {
        HighscoreView()
    }
}
