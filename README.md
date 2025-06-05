# Auto Text Bouncer

[![pub package](https://img.shields.io/pub/v/auto_text_bouncer.svg)](https://pub.dev/packages/auto_text_bouncer)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

A Flutter package for creating auto-scrolling text with bouncing effect. Perfect for displaying long text in limited space with smooth animations.

![Auto Text Bouncer Demo](https://raw.githubusercontent.com/miraskoda/auto_text_bouncer/main/assets/demo.gif)

## ✨ Features

- 🎯 **Dual Direction Support**: Scroll text both horizontally and vertically
- ⚡ **Customizable Speed**: Adjust scroll speed to your needs
- ⏱️ **Rest Time Control**: Set custom pause duration between scrolls
- 🎨 **Style Customization**: Apply your own text styling
- 🔄 **Smooth Animation**: Bouncing effect for better user experience
- 🎯 **Responsive**: Works with any text length
- 🎨 **Theme Support**: Integrates with Flutter's theming system

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  auto_text_bouncer: ^0.1.0
```

## 🚀 Quick Start

```dart
import 'package:auto_text_bouncer/auto_text_bouncer.dart';

ScrollingText(
  text: 'Your long text here...',
  axis: Axis.horizontal, // or Axis.vertical
  speed: 5.0,
  restTime: 1000,
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
)
```

## 🎨 Customization

### Horizontal Scrolling

```dart
ScrollingText(
  text: 'This is a long text that will scroll horizontally...',
  axis: Axis.horizontal,
  speed: 5.0,
  restTime: 1000,
  style: TextStyle(
    color: Colors.blue,
    fontSize: 18,
  ),
)
```

### Vertical Scrolling

```dart
ScrollingText(
  text: 'This is a long text that will scroll vertically...',
  axis: Axis.vertical,
  speed: 3.0,
  restTime: 2000,
  style: TextStyle(
    color: Colors.red,
    fontSize: 16,
  ),
)
```

## 📋 API Reference

### ScrollingText Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `text` | `String` | Required | The text to display |
| `axis` | `Axis` | Required | Scroll direction (horizontal/vertical) |
| `speed` | `double` | 5.0 | Scroll speed (higher = faster) |
| `restTime` | `int` | 1000 | Rest time between scrolls in milliseconds |
| `style` | `TextStyle?` | null | Custom text style |

## 💡 Usage Examples

### News Ticker

```dart
ScrollingText(
  text: 'Breaking News: Flutter 3.0 released with amazing new features...',
  axis: Axis.horizontal,
  speed: 3.0,
  restTime: 1500,
  style: TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
)
```

### Vertical Announcement

```dart
ScrollingText(
  text: 'Important Announcement\nPlease read carefully...',
  axis: Axis.vertical,
  speed: 2.0,
  restTime: 2000,
  style: TextStyle(
    color: Colors.black87,
    fontSize: 14,
  ),
)
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- All contributors who have helped shape this package

## 📫 Contact

Miroslav Skoda - [@visit_my_website](https://www.miroslavskoda.cz/)

Project Link: [https://github.com/miraskoda/auto_text_bouncer](https://github.com/miraskoda/auto_text_bouncer) 