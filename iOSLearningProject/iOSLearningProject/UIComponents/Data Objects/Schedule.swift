//
//  Schedule.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 04/03/25.
//

struct Schedule {
    let date: String
    let scheduleItems: [ScheduleItem]
}

struct ScheduleItem {
    let startTime: String
    let endTime: String
    let subject: String
    let chapterNumber: String
    let venue: String
    let teacher: String
}


let scheduleCollection: [String: [String : [ScheduleItem]]] = [
    "January" : [
        "1": [
            ScheduleItem(startTime: "11:35", endTime: "13:05", subject: "Mathematics", chapterNumber: "Chapter 1: Introduction", venue: "Room 6-205", teacher: "Brooklyn Williamson M"),
            ScheduleItem(startTime: "13:15", endTime: "14:45", subject: "Biology", chapterNumber: "Chapter 3: Animal Kingdom", venue: "Room 2-168", teacher: "Julie Watson"),
            ScheduleItem(startTime: "15:10", endTime: "16:40", subject: "Geography", chapterNumber: "Chapter 2: Economy USA", venue: "Room 1-403", teacher: "Jenny Alexander"),
            ScheduleItem(startTime: "17:10", endTime: "18:40", subject: "Psychology", chapterNumber: "Chapter 3: Body Language", venue: "Room 1-403", teacher: "Jenny Alexander")
        ],
        "2": [
            ScheduleItem(startTime: "11:35", endTime: "13:05", subject: "Mathematics", chapterNumber: "Chapter 1: Introduction", venue: "Room 6-205", teacher: "Brooklyn Williamson"),
            ScheduleItem(startTime: "13:15", endTime: "14:45", subject: "Biology", chapterNumber: "Chapter 3: Animal Kingdom", venue: "Room 2-168", teacher: "Julie Watson"),
            ScheduleItem(startTime: "15:10", endTime: "16:40", subject: "Geography", chapterNumber: "Chapter 2: Economy USA", venue: "Room 1-403", teacher: "Jenny Alexander")
        ]
    ]
]

