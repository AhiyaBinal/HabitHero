//
//  AddNewHabitView.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-05.
//

import SwiftUI

struct AddNewHabitView: View {
    
    @StateObject private var vm = HabitViewModel(service: HabitService())
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        let isEverydayBinding = Binding<Bool>(
                get: { vm.form.isEveryDay },
                set: { newValue in vm.setEveryday(newValue) }
            )
            Form {
                // MARK: - Habit Name
                ColoredSection(title: Constants.habitName) {
                    TextField(Constants.habitNameTextFieldPlaceholder, text: $vm.form.habitTitle)
                    if vm.didAttemptSave && !vm.hasHabitTitle {
                        Text(Constants.missingHabitTitle)
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
                // MARK: - Description
                ColoredSection(title: Constants.description) {
                    TextField(Constants.descriptionTextFieldPlaceholder,text: $vm.form.habitDescription)
                }
                // MARK: - Habit Type
                ColoredSection(title: Constants.habitType) {
                    CustomSegmentedSelector(selection: $vm.form.habitType)
                }
                // MARK: - Habit Duration
                ColoredSection(title: Constants.habitDuration) {
                    DatePicker(Constants.startDate, selection: $vm.form.startDate, displayedComponents: .date)
                        .font(.bodyRegular)
                        .onChange(of: vm.form.startDate) { _, newValue in
                            if vm.form.endDate < newValue {
                                vm.form.endDate = newValue
                            }
                        }
                    DatePicker(Constants.endDate, selection: $vm.form.endDate, displayedComponents: .date)
                        .font(.bodyRegular)
                    if vm.didAttemptSave && (!vm.isStartDateValid || !vm.isDateRangeValid) {
                        Text(Constants.invalidErrorText)
                                   .font(.caption)
                                   .foregroundColor(.red)
                           }
                }
                // MARK: - Task Days
                ColoredSection(title: Constants.taskDays) {
                    Toggle(Constants.everyDay, isOn: isEverydayBinding)
                        .font(.bodyRegular)
                    if !vm.form.isEveryDay {
                        NavigationLink {
                            WeekdayPickerView(selectedDays: $vm.form.taskDays)
                        } label: {
                            HStack {
                                Text(Constants.chooseDays)
                                Spacer()
                                Text(vm.form.selectedDaysText)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    if vm.didAttemptSave && !vm.isTaskDaysValid {
                        Text(Constants.requiredFieldText)
                                    .font(.caption)
                                    .foregroundColor(.red)
                            }
                }
                // MARK: - Time Range
                ColoredSection(title: Constants.timeRange) {
                    CustomSegmentedSelector(selection: $vm.form.timeRange)
                }
                // MARK: - Goal Section
                ColoredSection(title: Constants.goal) {
                    GoalSectionView(
                           goalValue: $vm.form.goalValue,
                           unit: $vm.form.goalUnit
                       )
                }
            }
            .navigationTitle(Constants.addNewHabit)
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(Constants.save) {
                            vm.createHabit(from: vm.form)
                          //  presentationMode.wrappedValue.dismiss()
                    }
                    .alert(item: $vm.activeAlert) { alert in
                        Alert(
                            title: Text(alert.title),
                            message: Text(alert.message),
                            dismissButton: .default(Text(Constants.okText))
                        )
                    }
                    .onChange(of: vm.didSaveSuccessfully) { _, didSave in
                        if didSave {
                            dismiss()
                        }
                    }
                }
            }
    }
}

    #Preview {
        AddNewHabitView()
    }

