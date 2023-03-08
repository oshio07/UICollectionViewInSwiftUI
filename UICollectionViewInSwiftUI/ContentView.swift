//
//  ContentView.swift
//  UICollectionViewInSwiftUI
//
//  Created by Shigenari Oshio on 2023/03/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CollectionView()
            .frame(height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
