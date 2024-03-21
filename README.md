This a simple and very lightweight for onboarding screens. It is very easy to use and customize

## Preview

![](https://i.ibb.co/YRs9vLK/Video-2024-03-22-022518-ezgif-com-video-to-gif-converter.gif)

## Getting started

Add the package to your `pubspec.yaml` file.

## Usage

Check /example folder for more details

Required parameters:
- `onFinishedPage` - Main page after onboarding
- `pageController` - PageController for the onboarding
- `items` - List of GonePage 

```dart
Scaffold(
body: GoneBoard(
    onFiishedPage: Home(),
    pageController: PageController(initialPage: 0),
    items: [
      GonePage(
        context,
        'assets/onboard_1.png',
        "Stop Making \nLose!",
        Color(0xFFBD3EA1),
       ),
   ] 
  )
);
```

