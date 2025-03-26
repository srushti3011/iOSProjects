//
//  Messages.swift
//  UIOne
//
//  Created by Srushti Sarju Engineer on 04/03/25.
//

struct Message {
    let time: String
    let content: String
    let sent: Bool
    var isExpanded: Bool = false
}

struct MessageCollection {
    let date: String
    var messages: [Message]
}

var messagesExample: [MessageCollection] = [
    MessageCollection(date: "1st March 2025", messages: [
        Message(time: "5:20", content: "Hello", sent: false),
        Message(time: "5:21", content: "Hi", sent: true),
        Message(time: "6:00",
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                sent: true),
        Message(time: "6:10", content: "ok", sent: false)
    ]),
    MessageCollection(date: "2nd March 2025", messages: [
        Message(time: "5:20", content: "Hello", sent: false),
        Message(time: "5:21", content: "Hi", sent: true),
        Message(time: "6:00",
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                sent: true),
        Message(time: "6:10", content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum", sent: false)
    ]),
    MessageCollection(date: "3th March 2025", messages: [
        Message(time: "5:20", content: "Hello", sent: false),
        Message(time: "5:21", content: "Hi", sent: true),
        Message(time: "6:00",
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                sent: true),
        Message(time: "6:10", content: "ok", sent: false)
    ]),
    MessageCollection(date: "4th March 2025", messages: [
        Message(time: "5:20", content: "Hello", sent: false),
        Message(time: "5:21", content: "Hi", sent: true),
        Message(time: "6:00",
                content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                sent: true),
        Message(time: "6:10", content: "ok", sent: false)
    ])
]
