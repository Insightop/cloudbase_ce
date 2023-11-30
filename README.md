<p align="center">
  <a href="https://flutter.dev/">
    <img src="https://www.vectorlogo.zone/logos/flutterio/flutterio-ar21.svg" alt="flutter" style="vertical-align:top; margin:4px;">
  </a>
  <a href="https://dart.dev/">
    <img src="https://www.vectorlogo.zone/logos/dartlang/dartlang-ar21.svg" alt="dart" style="vertical-align:top; margin:4px;">
  </a>
</p>

# CloudBase Flutter SDK Community Edition

[![Pub Version](https://img.shields.io/pub/v/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![Pub Popularity](https://img.shields.io/pub/popularity/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)
[![Pub Points](https://img.shields.io/pub/points/cloudbase_ce)](https://pub.dev/packages/cloudbase_ce)

<!-- [![GitHub Stars](https://img.shields.io/github/stars/insightoptech/cloudbase_ce?style=social)](https://github.com/insightoptech/cloudbase_ce/stargazers) -->

[![GitHub Stars](https://img.shields.io/github/stars/insightoptech/cloudbase_ce)](https://github.com/insightoptech/cloudbase_ce/stargazers)
[![build-test](https://github.com/insightoptech/cloudbase_ce/actions/workflows/ci.yaml/badge.svg)](https://github.com/insightoptech/cloudbase_ce/actions/workflows/ci.yaml)
[![GitHub License](https://img.shields.io/github/license/insightoptech/cloudbase_ce)](https://github.com/insightoptech/cloudbase_ce/blob/main/LICENSE)

## 描述

[腾讯云·云开发](https://www.cloudbase.net/)的 Flutter 插件，更多的云开发 Flutter 插件请见[云开发文档](https://docs.cloudbase.net/api-reference/flutter/install)。

此 package 相比官方版本的升级：

- 支持空安全
- 删除过时的 API 调用
- 升级依赖版本

## 平台支持

| Platform | Android | iOS |
| -------- | ------- | --- |
| Linux    | ✅      | -   |
| macOS    | ✅      | ✅  |
| Windows  | ✅      | -   |

## 已迁移的包

| Package            | Version                                                         | Status |
| ------------------ | --------------------------------------------------------------- | ------ |
| cloudbase_core     | ![Pub version](https://img.shields.io/pub/v/cloudbase_core)     | ✅     |
| cloudbase_auth     | ![Pub version](https://img.shields.io/pub/v/cloudbase_auth)     | ✅     |
| cloudbase_database | ![Pub version](https://img.shields.io/pub/v/cloudbase_database) | ✅     |
| cloudbase_function | ![Pub version](https://img.shields.io/pub/v/cloudbase_function) | ✅     |
| cloudbase_storage  | ![Pub version](https://img.shields.io/pub/v/cloudbase_storage)  | ✅     |

## 安装

在 flutter 项目的 `pubspec.yaml` 文件的 `dependencies` 中添加

```yaml
dependencies:
  cloudbase_ce:
```

## 简单示例

```dart
import 'package:cloudbase_ce/cloudbase_ce.dart';

// 初始化 CloudBase
CloudBaseCore core = CloudBaseCore.init({
    // 填写你的云开发 env
    'env': 'your-env-id'
});
```

## 详细文档

[云开发·初始化](https://docs.cloudbase.net/api-reference/flutter/initialization)

## 贡献者

[![GitHub contributors](https://contrib.rocks/image?repo=insightoptech/cloudbase_ce)](https://github.com/insightoptech/cloudbase_ce/graphs/contributors)

## CI/CD

- 自动化编译测试
- 自动化发布到 pub.dev
- 自动化升级依赖版本(pub, github-actions)
- 自动化质量控制
