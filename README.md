<p align="center">
  <a href="https://cloudbase.net/">
    <img src="https://docs.cloudbase.net/img/logo.png" alt="cloudbase" style="max-width: 70px; max-height: 70px; vertical-align:bottom; margin:4px;">
  </a>
  <a href="https://flutter.dev/">
    <img src="https://www.vectorlogo.zone/logos/flutterio/flutterio-ar21.svg" alt="flutter" style="vertical-align:bottom; margin:4px;">
  </a>
  <a href="https://dart.dev/">
    <img src="https://www.vectorlogo.zone/logos/dartlang/dartlang-ar21.svg" alt="dart" style="vertical-align:bottom; margin:4px;">
  </a>
</p>

[![Pub Version](https://img.shields.io/pub/v/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![Pub Popularity](https://img.shields.io/pub/popularity/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![Pub Points](https://img.shields.io/pub/points/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![GitHub Stars](https://img.shields.io/github/stars/insightoptech/cloudbase_ce)](https://github.com/insightoptech/cloudbase_ce/stargazers)
[![build-test](https://github.com/insightoptech/cloudbase_ce/actions/workflows/ci.yaml/badge.svg)](https://github.com/insightoptech/cloudbase_ce/actions/workflows/ci.yaml)
[![GitHub License](https://img.shields.io/github/license/insightoptech/cloudbase_ce)](https://github.com/insightoptech/cloudbase_ce/blob/main/LICENSE)

# Cloudbase_ce

A **community edition** of TencentCloud CloudBase(TCB) Flutter SDK.

> Official documents：[API Reference](https://docs.cloudbase.net/api-reference/flutter/install)

| Features                          | cloudbase_ce | Official SDK |
| --------------------------------- | :----------: | :----------: |
| **Fully compatible official SDK** |      ✅      |      /       |
| **Support Null-safety**           |      ✅      |      ❌      |
| **Fixed bugs**                    |      ✅      |      ❌      |
| **Support Phone authentication**  |      ✅      |      ❌      |
| Dart3 Compatibility               |      ✅      |      ❌      |
| Delete deprecated API calls       |      ✅      |      ❌      |
| Latest dependencies versions      |      ✅      |      ❌      |
| Github Actions CI/CD              |      ✅      |      ❌      |

## Quick Start

1. Add `cloudbase_ce` to your package's dependencies in pubspec.yaml file:

```diff
// pubspec.yaml

  ...

  dependencies:
    flutter:
      sdk: flutter
+   cloudbase_ce: ^2.x.x

  dev_dependencies:

  ...
```

2. Import the package in your dart file:

```dart
 import 'package:cloudbase_ce/cloudbase_ce.dart';
```

3. Initialize CloudBase:

```dart
void main() async {
  CloudBaseCore core = CloudBaseCore.init({
    'env': 'your-env-id',
    'appAccess': {
      'key': 'your-app-access-key',
      'version': 'your-app-access-version'
    },
    'timeout': 3000 // Optional
  });
}
```

## Migrated packages

| Package            | Version                                                         | Status |
| ------------------ | --------------------------------------------------------------- | :----: |
| cloudbase_core     | ![Pub version](https://img.shields.io/pub/v/cloudbase_core)     |   ✅   |
| cloudbase_auth     | ![Pub version](https://img.shields.io/pub/v/cloudbase_auth)     |   ✅   |
| cloudbase_database | ![Pub version](https://img.shields.io/pub/v/cloudbase_database) |   ✅   |
| cloudbase_function | ![Pub version](https://img.shields.io/pub/v/cloudbase_function) |   ✅   |
| cloudbase_storage  | ![Pub version](https://img.shields.io/pub/v/cloudbase_storage)  |   ✅   |

## CI/CD

- [x] Automatically build & test
- [x] Automatically upgrade dependencies(pub, github-actions)
- [x] Automatically quality control
- [ ] Automatically publish to `pub.dev`

## Contributors

[![GitHub contributors](https://contrib.rocks/image?repo=insightoptech/cloudbase_ce)](https://github.com/insightoptech/cloudbase_ce/graphs/contributors)
