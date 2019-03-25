# SYAudioIndicatorView
Audio indicator bar like default iOS music app.

## Preview  
| SYAudioIndicatorView |  
|:-:|
| ![SYAudioIndicatorView](https://github.com/hayabusabusa/SYAudioIndicatorView/blob/master/gifs/SYAudioIndicatorView.gif) |  

## Installation  
Drag and drop **SYAudioIndicatorView.swift** in your Project.

## Usage  
### Programmatically  
```swift
// Init SYAudioIndicatorView with SYAudioIndicatorView(frame:)
let audioIndicator = SYAudioIndicatorView(frame: CGRect(x: 0, y: 0, width: 100.0, height: 100.0))

// Set bar number ( Option )
audioIndicator.barCount = 6

// Set bar space ( Option )
audioIndicator.barSpace = 8.0

// Set bar corner radius ( Option )
audioIndiactor.barCornerRadius = 4.0

// Set bar color ( Option )
audioIndicator.barColor = UIColor.red

// Set bar animation duration ( Option )
audioIndicator.barAnimationDuration = 0.6

// Setup bars.
audioIndicator.setupBars()

self.view.addSubView(audioIndicator)
```

### Storyboard
