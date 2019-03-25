# SYAudioIndicatorView
Audio indicator bar like default iOS music app.

## Preview  
| SYAudioIndicatorView |  
|:-:|
| ![SYAudioIndicatorView](https://github.com/hayabusabusa/SYAudioIndicatorView/blob/master/gifs/SYAudioIndicatorView.gif) |  

## Installation  
Drag and drop `SYAudioIndicatorView.swift` in your Project.

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
Only put a `View` on your `ViewController`. And set Custom Class `SYAudioIndicatorView`.  

| Identity Inspector | Attribute Inspector |  
|:-:|:-:|  
| ![view](https://github.com/hayabusabusa/SYAudioIndicatorView/blob/master/gifs/view.png) | ![settings](https://github.com/hayabusabusa/SYAudioIndicatorView/blob/master/gifs/settings.png) |

### Animation start and stop  
#### Start  
```swift
audioIndicator.start()
```

#### Stop  
```swift
audioIndicator.stop()
```

## Lisence  
```
MIT License

Copyright (c) 2019 hayabusabusa

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
