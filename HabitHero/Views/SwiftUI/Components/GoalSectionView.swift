//
//  GoalSectionView.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-16.
//

import SwiftUI

struct GoalSectionView: View {
    @Binding var goalValue: Int
    @Binding var unit: GoalUnit
    
    @State private var showUnitSheet = false
    
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                                
                // Goal Value Input
                HStack {
                    Text(Constants.goalValueTitle)
                    TextField("", value: $goalValue, format: .number)
                        .keyboardType(.numberPad)
                        .roundedInputStyle()
                    Button {
                        showUnitSheet = true
                    } label: {
                            Text(unit.rawValue)
                            .foregroundStyle(Color.primaryFontColor)
                            .roundedInputStyle()
                    }
                }
            }
        }
        .sheet(isPresented: $showUnitSheet) {
            GoalUnitPickerSheet(selectedUnit: $unit)
        }
    }
}

