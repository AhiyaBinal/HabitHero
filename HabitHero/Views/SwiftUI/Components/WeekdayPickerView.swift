//
//  WeekdayPickerView.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-08.
//

import SwiftUI

struct WeekdayPickerView: View {
    @Binding var selectedDays: [TaskDays]

    var body: some View {
        List {
            ForEach(TaskDays.allCases) { day in
                SelectedRowStyle(
                    title: day.shortName,
                    isSelected: selectedDays.contains(day)
                ) {
                    toggle(day)
                }
            }
        }
        .navigationTitle(Constants.chooseDays)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func toggle(_ day: TaskDays) {
        if selectedDays.contains(day) {
            selectedDays.removeAll { $0 == day }
        } else {
            selectedDays.append(day)
        }
    }
}
