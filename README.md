# HarmonyOS NEXT サブスクリプション画面遷移デモ (IAP Kit)

HarmonyOS NEXT (ArkTS / Stage Model) において、`@kit.IAPKit` を使用してアプリ内課金（サブスクリプション）の管理・解約画面（`iap.showManagedSubscriptions`）を呼び出すサンプルアプリケーションです。

## 画面イメージ

| メイン画面 (`image/main.jpg`) | サブスクリプション管理画面 (`image/open.jpg`) |
| :---: | :---: |
| <img src="image/main.jpg" width="300" alt="メイン画面" /> | <img src="image/open.jpg" width="300" alt="サブスクリプション管理画面" /> |

## 概要

このサンプルでは、アプリ内の「購読取り消し」ボタンをタップすることで、HUAWEI IDに紐づくサブスクリプション管理ダイアログ（または画面）を直接表示する機能を実装しています。

### 主な機能・ポイント

- **`@kit.IAPKit` の呼び出し**: `iap.showManagedSubscriptions` を正しいパラメータ構造（`UIAbilityContext`, `UIWindowParameter`, `groupId`）で起動。
- **UIWindowParameter の指定**: `iap.WindowScreenMode.DIALOG_BOX` を指定してダイアログ形式での表示を実現。
- **ArkTS推奨のコンテキスト取得**: `this.getUIContext().getHostContext()` を使用して型安全にコンテキストを取得。
- **簡略化された呼び出し**: 単にサブスクリプション管理画面を開く目的であれば、特定のグループID設定は不要です。

## 事前準備・前提条件

`iap.showManagedSubscriptions` を正常に動作させるためには、AppGallery Connect (AGC) での最小限の設定と適切なテスト環境が必要です。

### 1. AppGallery Connect (AGC) の設定

1. **アプリ内購買（IAP）の有効化**:
    - [AppGallery Connect](https://developer.huawei.com/consumer/cn/service/josp/agc/index.html) にログインします。
    - 対象プロジェクトの `「项目设置」 > 「常规」` で **「应用内购买」(In-App Purchases)** サービスを有効（オン）にします。
2. **SHA256 证书指纹 (署名指紋) の登録**:
    - ビルド・署名に使用するキーストア (Keystore) の **SHA256 指紋** を取得します。
    - AGCの `「常规」 > 「SHA256证书/公钥指纹」` に正確に登録してください。

※ HarmonyOS NEXT アプリにおいては、`agconnect-service.json` の手動配置や事前のアカウント側での個別サブスクリプション商品（グループID）登録は、単なる管理画面呼び出し目的であれば**不要**です。

### 2. 実行・テスト環境の注意事項

- **実機でのテストが必須**:
  IAP Kitの各種UI（決済画面・サブスクリプション管理画面）は **シミュレータ非対応** です。必ず HarmonyOS NEXT 対応の実機デバイスでテストしてください。
- **HUAWEI ID ログイン**:
  テスト端末に有効な **HUAWEI ID** がログインしている必要があります。

## エラー対処（トラブルシューティング）

| エラーコード | エラーメッセージ | 主な原因と対策 |
| :--- | :--- | :--- |
| **`1001860002`** | `The application is not authorized.` | AGC側で **IAPサービスが未有効** であるか、ビルド時の署名（キーストア）の **SHA256指紋** がAGC上の登録と一致していません。AGCのコンソール設定を確認してください。 |

## 動作確認環境

- **DevEco Studio**: DevEco Studio 5.0 / API 12 (HarmonyOS NEXT) 以降
- **Language**: ArkTS (Stage Model)