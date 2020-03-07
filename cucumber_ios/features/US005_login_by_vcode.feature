Feature: US-005 手机号 + 验证码登陆
  作为一名注册用户，我需要手机号登陆，使得我在忘记密码时候可以选择这种方式

  @reset_driver
  Scenario: AC-US005-01 错误手机号 + 验证码
    Given 我在 "主页面" 点击 "登录/注册" 进入 "密码登录页面"
    And 我点击 "手机验证码登录" 进入 "验证码登录页面"
    And 我在 "手机号" 输入 "136137777"
    And 我按下按钮 "获取验证码"
    Then 我应当看到浮动提示 "请输入有效的手机号码！"

  Scenario: AC-US005-02 正确的手机号 + 错误的验证码
    Given 我已经用手机号 18620318415 与密码 test123 注册过账号 (创建数据)
      |ac            |clear|mobile     |
      |AC_US003_04   |true |18620318415|
    And 我在 "验证码" 输入 "123abc"
    And 我在 "手机号" 输入 "18620318415"
    And 隐藏键盘
    And 等待 2 秒后
    And 打印调试 page
    And 我按下按钮 "登录"
    Then 我应当看到浮动提示 "验证码不匹配"

  Scenario: AC-US005-03 正确的手机号 + 正确的验证码
    Given 我已经用手机号 18620318415 与密码 test123 注册过账号 (创建数据)
      |ac            |clear|mobile     |
      |AC_US003_04   |true |18620318415|
    And 我在 "手机号" 输入 "18620318415"
    And 我按下按钮 "获取验证码"
    And 我在 "验证码" 输入 "123456"
    And 我按下按钮 "登录"
    Then 我应当到达 "主页面"