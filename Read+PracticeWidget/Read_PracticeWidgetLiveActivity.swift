//
//  Read_PracticeWidgetLiveActivity.swift
//  Read+PracticeWidget
//
//  Created by Kari Douglas on 3/22/26.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Read_PracticeWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Read_PracticeWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Read_PracticeWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension Read_PracticeWidgetAttributes {
    fileprivate static var preview: Read_PracticeWidgetAttributes {
        Read_PracticeWidgetAttributes(name: "World")
    }
}

extension Read_PracticeWidgetAttributes.ContentState {
    fileprivate static var smiley: Read_PracticeWidgetAttributes.ContentState {
        Read_PracticeWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Read_PracticeWidgetAttributes.ContentState {
         Read_PracticeWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Read_PracticeWidgetAttributes.preview) {
   Read_PracticeWidgetLiveActivity()
} contentStates: {
    Read_PracticeWidgetAttributes.ContentState.smiley
    Read_PracticeWidgetAttributes.ContentState.starEyes
}
