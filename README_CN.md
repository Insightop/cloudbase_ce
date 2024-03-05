[![Pub Version](https://img.shields.io/pub/v/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![Pub Popularity](https://img.shields.io/pub/popularity/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![Pub Points](https://img.shields.io/pub/points/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![GitHub Stars](https://img.shields.io/github/stars/insightoptech/cloudbase_ce)](https://github.com/insightoptech/cloudbase_ce/stargazers)
[![build-test](https://github.com/insightoptech/cloudbase_ce/actions/workflows/ci.yaml/badge.svg)](https://github.com/insightoptech/cloudbase_ce/actions/workflows/ci.yaml)
[![GitHub License](https://img.shields.io/github/license/insightoptech/cloudbase_ce)](https://github.com/insightoptech/cloudbase_ce/blob/main/LICENSE)

# Cloudbase_ce

[English](README.md)

腾讯云 CloudBase(TCB) Flutter SDK 的 `社区版`。

> 官方文档：[API 参考](https://docs.cloudbase.net/api-reference/flutter/install)

| 特性                 | 官方 SDK | cloudbase_ce |
| -------------------- | :------: | :----------: |
| **完全兼容官方 SDK** |    🚫    |      ✅      |
| **支持空安全**       |    ❌    |      ✅      |
| **修复 Bug**         |    ❌    |      ✅      |
| **支持手机号认证**   |    ❌    |      🔜      |
| Dart3 兼容           |    ❌    |      ✅      |
| 删除过时的 API 调用  |    ❌    |      ✅      |
| 最新的依赖版本       |    ❌    |      ✅      |
| GitHub Actions CI/CD |    ❌    |      ✅      |

## 快速开始

1. 添加`cloudbase_ce`依赖到工程中的 `pubspec.yaml`文件：

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

2. 在 Dart 代码中引入 `cloudbase_ce`：

```dart
 import 'package:cloudbase_ce/cloudbase_ce.dart';
```

3. 初始化 CloudBase：

```dart
void main() async {
  CloudBaseCore core = CloudBaseCore.init({
    'env': 'your-env-id', // 替换为你的云开发环境ID
    'appAccess': {
      'key': 'your-app-access-key', // 替换为你的appAccessKey
      'version': 'your-app-access-version' // 替换为你的appAccessVersion
    },
    'timeout': 3000 // 可选，请求超时时间
  });
}
```

## 移植的包

| Package            | Version                                                         | Status |
| ------------------ | --------------------------------------------------------------- | :----: |
| cloudbase_core     | ![Pub version](https://img.shields.io/pub/v/cloudbase_core)     |   ✅   |
| cloudbase_auth     | ![Pub version](https://img.shields.io/pub/v/cloudbase_auth)     |   ✅   |
| cloudbase_database | ![Pub version](https://img.shields.io/pub/v/cloudbase_database) |   ✅   |
| cloudbase_function | ![Pub version](https://img.shields.io/pub/v/cloudbase_function) |   ✅   |
| cloudbase_storage  | ![Pub version](https://img.shields.io/pub/v/cloudbase_storage)  |   ✅   |

## CI/CD

- [x] 自动化编译&测试
- [x] 自动化升级依赖版本(pub, github-actions)
- [x] 自动化质量控制
- [ ] 自动化发布到 `pub.dev`

## 贡献者们

[![GitHub contributors](https://contrib.rocks/image?repo=insightoptech/cloudbase_ce)](https://github.com/insightoptech/cloudbase_ce/graphs/contributors)
