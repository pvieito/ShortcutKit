# ShortcutKit

Swift framework and tool to inspect Shortcut files.

## Requirements

ShortcutKit requires Swift 4.2 or later and has been tested both on macOS and Linux.

## Usage

### ShortcutTool

```bash
$ swift run ShortcutTool -i Example.shortcut 
[*] Example.shortcut
[ ] Client Release: 2.0
[ ] Client Version: 700
[ ] Types: NCWidget, WatchKit
[*] Actions (3)
[ ] is.workflow.actions.properties.appstore
[ ] is.workflow.actions.sirikit.donation.handle
[ ] is.workflow.actions.useractivity.open
```

### ShortcutKit

```swift
import ShortcutKit

let shortcutURL = URL(fileURLWithPath: "Example.shortcut")
let shortcut = try Shortcut(contentsOf: shortcutURL)

print(shortcut.types)
// ["NCWidget", "WatchKit"]

print(shortcut.inputContentItemClasses)
// ["WFRichTextContentItem", "WFLocationContentItem", "WFURLContentItem"]

for action in shortcut.actions {
    print(action)
}
// is.workflow.actions.properties.appstore
// is.workflow.actions.sirikit.donation.handle
// is.workflow.actions.useractivity.open
```

## License

`ShortcutKit` is available under the MIT license. See the LICENSE file for more info.
