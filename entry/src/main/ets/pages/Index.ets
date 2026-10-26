import { iap } from '@kit.IAPKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = 'IAP Demo';

  build() {
    RelativeContainer() {
      Column({ space: 20 }) {
        Text(this.message)
          .id('IAPDemo')
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.message = 'Welcome';
          })

        Button('購読取り消し')
          .fontSize(16)
          .onClick(async () => {
            const uiWindowParameter: iap.UIWindowParameter = {
              windowScreenMode: iap.WindowScreenMode.DIALOG_BOX
            }
            const groupId = '***';
            iap.showManagedSubscriptions(this.getUIContext().getHostContext() as common.UIAbilityContext, uiWindowParameter, groupId).then(() => {
              console.info('Succeeded in showing subscription page.');
            }).catch((err: BusinessError) => {
              console.error(`Failed to show subscription page. Code is ${err.code}, message is ${err.message}`);
            });
          })
      }
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
    }
    .height('100%')
    .width('100%')
  }
}