//
//  GoalUnitPickerSheet.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-16.
//

import SwiftUI

struct GoalUnitPickerSheet: View {
    @Binding var selectedUnit: GoalUnit

    @State private var selectedTab: UnitTab = .quantity

    var body: some View {
        NavigationView {
            VStack {
                // Segmented Control (specific to this screen)
                Picker(Constants.unitType, selection: $selectedTab) {
                    ForEach(UnitTab.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                .padding()

                List {
                    ForEach(currentUnits) { unit in
                        SelectedRowStyle(
                            title: unit.rawValue,
                            isSelected: selectedUnit == unit
                        ) {
                            selectedUnit = unit
                        }
                    }
                }
            }
            .navigationTitle(Constants.selectUnit)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(Constants.done) {
                        dismiss()
                    }
                }
            }
        }
    }

    private var currentUnits: [GoalUnit] {
        selectedTab == .quantity
        ? GoalUnit.quantityUnits
        : GoalUnit.timeUnits
    }

    @Environment(\.dismiss) private var dismiss
}
