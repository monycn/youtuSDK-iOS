# Tencentyun-youtu-iOS
iOS sdk for [腾讯优图云人脸服务](http://open.youtu.qq.com/)  
by : Mony(YueFeng) / CielHe(HeXue) / Vittle(ChenYuanfu)
#### PS: Demo正在加紧制作中，如有什么疑问，咨询QQ：369749721
#### 时间较短，如有问题，请多多提出，必将改正
## 安装（直接下载源码集成）
### 直接下载源码集成
从github下载源码装入到您的程序中。[下载地址](https://github.com/monycn/youtuSDK-iOS)
## 名词
- `AppId` 平台添加应用后分配的AppId
- `SecretId` 平台添加应用后分配的SecretId
- `SecretKey` 平台添加应用后分配的SecretKey
- `签名` 接口鉴权凭证，由`AppId`、`SecretId`、`SecretKey`等生成，详见<http://open.youtu.qq.com/welcome/authentication>
- `UserId` 接入业务自行定义的用户id，用于唯一标识一个用户

##API
```
// 引入头文件
#import "YouTu.h"
```
### `ConfigModel`
#### 开发授权信息
- 1.填充完整开发信息在Config.plist
- 2.把Config.plist文件放在根路径（与应用程序info.plist同级）
- 3.剩下的就不需要开发者操心，SDK需要的时候会直接调用
#### 其它
- `#define API_YOUTU_URL @"http://api.youtu.qq.com/"` 请求的优图服务器地址 默认为 api.youtu.qq.com

### `AuthModel`
#### 签名相关
- 1.根据官方文档，完成签名组装。并已经封装在发送请求中。
- 2.签名使用默认10天过期，如需修改，在网络HttpModel.m中修改下方代码

```
NSString *expired = [NSString stringWithFormat:@"%ld",[Tools getExpiredTime10Day]];
```
- 3.过期时间计算方法已写在Tools工具类中，可以查阅头文件使用。
- 4.非特殊情况，请不要修改AuthModel.m文件，（毕竟签名的拼接太麻烦，老鸟无视本条）。

### `ErrorModel`
#### 错误相关
- 1.根据官方文档，总结出目前可能出现的错误代码，网络请求返回后，先行判断是否错误。
- 2.如需要添加错误代码，请打开`YHCError/Error.plist`追加。

### `YouTu`
#### 优图相关API封装，返回信息都为异步获取
#### 可直接在`success`和`failure`回调Block中编写逻辑代码。
#### 其他详细方法，请查看YouTu.h文件
#### Demo制作完成后，必将补全此段













