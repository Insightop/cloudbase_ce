[![Pub Version](https://img.shields.io/pub/v/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![Pub Popularity](https://img.shields.io/pub/popularity/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![Pub Points](https://img.shields.io/pub/points/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![GitHub Stars](https://img.shields.io/github/stars/insightop/cloudbase_ce)](https://github.com/insightop/cloudbase_ce/stargazers)
[![build-test](https://github.com/insightop/cloudbase_ce/actions/workflows/ci.yaml/badge.svg)](https://github.com/insightop/cloudbase_ce/actions/workflows/ci.yaml)
[![GitHub License](https://img.shields.io/github/license/insightop/cloudbase_ce)](https://github.com/insightop/cloudbase_ce/blob/main/LICENSE)

# Cloudbase_ce

[中文](README_CN.md)

A `community edition` of TencentCloud CloudBase(TCB) Flutter SDK.

> Official documents：[API Reference](https://docs.cloudbase.net/api-reference/flutter/install)

| Features                          | Official SDK | cloudbase_ce |
| --------------------------------- | :----------: | :----------: |
| **Fully compatible official SDK** |      🚫      |      ✅      |
| **Support Null-safety**           |      ❌      |      ✅      |
| **Fixed bugs**                    |      ❌      |      ✅      |
| **Support Phone authentication**  |      ❌      |      🔜      |
| Dart3 Compatibility               |      ❌      |      ✅      |
| Delete deprecated API calls       |      ❌      |      ✅      |
| Latest dependencies versions      |      ❌      |      ✅      |
| GitHub Actions CI/CD              |      ❌      |      ✅      |

## Quick Start

1. Add `cloudbase_ce` to your package's dependencies in `pubspec.yaml` file:

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
    'env': 'your-env-id', // Replace with your own envID
    'appAccess': {
      'key': 'your-app-access-key', // Replace with your own appAccessKey
      'version': 'your-app-access-version' // Replace with your own appAccessVersion
    },
    'timeout': 3000 // Optional, request timeout in milliseconds
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

[![GitHub contributors](https://contrib.rocks/image?repo=insightop/cloudbase_ce)](https://github.com/insightop/cloudbase_ce/graphs/contributors)
