//
//  HabitViewModelTest.swift
//  HabitHeroTests
//
//  Created by Binal Manek on 2026-01-09.
//

import XCTest
@testable import HabitHero
@MainActor

final class HabitViewModelTest: XCTestCase {
    var mockService: MockHabitService!
    var vm: HabitViewModel!

    override func setUp() {
        super.setUp()
        mockService = MockHabitService()
        vm = HabitViewModel(service: mockService)
    }

    override func tearDown() {
        mockService = nil
        vm = nil
        super.tearDown()
    }

    func test_missingTitle_showsMissingTitleAlert() {

        vm.form.habitTitle = ""
        vm.form.startDate = Date()
        vm.form.endDate = Date()

        vm.createHabit(from: vm.form)

        XCTAssertFalse(mockService.didCreateHabit)
        XCTAssertEqual(vm.activeAlert, AlertScene.missingTitle)
        XCTAssertFalse(vm.didSaveSuccessfully)
    }
    func test_invalidDates_showsInvalidDatesAlert() {

        vm.form.habitTitle = "Walk"
        vm.form.startDate = Date()
        vm.form.endDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!

        vm.createHabit(from: vm.form)

        XCTAssertEqual(vm.activeAlert, AlertScene.invalidDates)
        XCTAssertFalse(vm.didSaveSuccessfully)
        XCTAssertFalse(mockService.didCreateHabit)
    }
    func test_customDaysWithoutSelection_showsError() {
        vm.form.habitTitle = "Walk"
        vm.form.isEveryDay = false
        vm.form.taskDays = []

        vm.createHabit(from: vm.form)

        XCTAssertEqual(vm.activeAlert, .noTaskDays)
        XCTAssertFalse(vm.didSaveSuccessfully)
    }

    func test_validForm_savesSuccessfully() {
        vm.form.habitTitle = "Talk"
        vm.form.startDate = Date()
        vm.form.endDate = Date()
        vm.form.isEveryDay = true

        vm.createHabit(from: vm.form)
        XCTAssertTrue(mockService.didCreateHabit, "Create Habit should be called on the service")
        XCTAssertEqual(mockService.createdHabitForm?.habitTitle, "Talk")
        XCTAssertTrue(vm.didSaveSuccessfully)
        XCTAssertNil(vm.activeAlert)
    }



}
