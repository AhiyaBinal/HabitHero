//
//  HabitListView.swift
//  HabitHero
//
//  Created by Binal Manek on 2025-12-02.
//

import SwiftUI
internal import CoreData

struct HabitListView: View {

    @StateObject private var vm = HabitViewModel(service: HabitService())

    @State private var newHabit = ""
    @State private var updatedTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter habit title", text: $newHabit)
                        .textFieldStyle(.roundedBorder)

                    Button("Add") {
                        if !newHabit.isEmpty {
                            vm.createHabit(title: newHabit)
                            newHabit = ""
                        }
                    }
                }
                .padding()

                List {
                    ForEach(vm.habits, id: \.id) { habit in
                        VStack(alignment: .leading) {
                            Text(habit.title ?? "")
                                .font(.headline)

                            Text("\(habit.timestamp ?? Date(), formatter: dateFormatter)")
                                .font(AppFont.title(10))
                                .foregroundColor(.gray)
                        }
                    }
                    .onDelete(perform: vm.deleteHabit)
                }
            }
            .navigationTitle("Habits")
            .onAppear {
                vm.loadHabits()
            }
        }
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM d, yyyy h:mm a"
    return formatter
}()


#Preview {
    HabitListView()
}
