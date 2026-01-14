//
//  CustomSegmentedSelector.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-08.
//

import SwiftUI

struct CustomSegmentedSelector<T: CaseIterable & RawRepresentable & Hashable>: View
where T.RawValue == String {
    
    @Binding var selection: T
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(Array(T.allCases), id: \.self) { item in
                    Button {
                        withAnimation(.spring(duration: 0.75)) {
                            selection = item
                        }
                    } label: {
                        Text(item.rawValue)
                            .font(.segmentTitle)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, Constants.styleValue)
                            .background(
                                selection == item
                                ? Color.selectedSegmentColor
                                : Color.unselectedSegmentColor
                            )
                            .foregroundColor(selection == item ? .white : .black)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain)
                }
            }
            .background(Color.selectedSegmentColor.opacity(Constants.opacityValue))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}


