# HarmonyOS NEXT Subscription Management Demo (IAP Kit)

This sample application demonstrates how to open the In-App Purchase (IAP) subscription management and cancellation screen using `iap.showManagedSubscriptions` from `@kit.IAPKit` in HarmonyOS NEXT (ArkTS / Stage Model).

## Screenshots

| Main Screen (`image/main.jpg`) | Subscription Management Screen (`image/open.jpg`) |
| :---: | :---: |
| <img src="image/main.jpg" width="300" alt="Main Screen" /> | <img src="image/open.jpg" width="300" alt="Subscription Management Screen" /> |

## Overview

Tapping the "Cancel Subscription" button inside the app directly pops up the subscription management dialog (or screen) associated with the logged-in HUAWEI ID.

### Key Features & Highlights

- **`@kit.IAPKit` Integration**: Invokes `iap.showManagedSubscriptions` using the correct parameter structure (`UIAbilityContext`, `UIWindowParameter`, `groupId`).
- **`UIWindowParameter` Specification**: Uses `iap.WindowScreenMode.DIALOG_BOX` to present the management UI as a pop-up dialog.
- **ArkTS Recommended Context Retrieval**: Uses `this.getUIContext().getHostContext()` for type-safe context retrieval.
- **Simplified Invocation**: If the goal is simply to open the subscription management screen, configuring specific product group IDs (`groupId`) is not required.

---

## Prerequisites & Setup

To ensure `iap.showManagedSubscriptions` works properly, minimal setup in AppGallery Connect (AGC) and an appropriate testing environment are required.

### 1. AppGallery Connect (AGC) Configuration

1. **Enable In-App Purchases (IAP)**:
    - Log in to [AppGallery Connect](https://developer.huawei.com/consumer/cn/service/josp/agc/index.html).
    - Navigate to `Project settings > General` for your target project and enable the **In-App Purchases (IAP)** service.
2. **Register SHA-256 Certificate Fingerprint**:
    - Obtain the **SHA-256 fingerprint** of the keystore used for building and signing your application.
    - Register it under `General > SHA-256 certificate fingerprint` in the AGC console.

> **Note**: For HarmonyOS NEXT applications, manually placing `agconnect-service.json` or pre-registering specific subscription products (Group IDs) is **not required** if you only need to invoke the subscription management page.

### 2. Testing Environment Notes

- **Physical Device Required**:
  IAP Kit UI flows (checkout, subscription management) **are not supported on emulators**. Always test on a physical HarmonyOS NEXT device.
- **Logged-in HUAWEI ID**:
  The test device must be signed in with a valid **HUAWEI ID**.

---

## Troubleshooting

| Error Code | Error Message | Cause & Solution |
| :--- | :--- | :--- |
| **`1001860002`** | `The application is not authorized.` | The **IAP service is not enabled** in AGC, or the **SHA-256 fingerprint** of the build signature does not match the registered fingerprint in AGC. Check your AGC console settings. |

---

## Environment Requirements

- **DevEco Studio**: DevEco Studio 5.0 / API 12 (HarmonyOS NEXT) or later
- **Language**: ArkTS (Stage Model)