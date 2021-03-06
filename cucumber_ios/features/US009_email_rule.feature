Feature: US-009 邮箱规则
  作为一名用户，我需要邮箱格式的提醒
  使得我知道什么是正确的邮箱格式来完成注册

  @reset_driver
  Scenario: AC-US009-01 邮箱规则 不正确的邮箱格式
    Given 我在 "主页面" 点击 "登录/注册" 进入 "密码登录页面"
    And 我点击 "注册" 进入 "手机注册页面"
    And 我点击 "使用邮箱注册" 进入 "邮箱注册页面"
    And 我在 "邮箱" 输入 "ricky@desh"
    And 我在 "密码" 输入 "a123456"
    And 我按下按钮 "完成"
    Then 我应当看到浮动提示 "您的电子邮件格式不正确"

  Scenario: AC-US009-02 邮箱规则 不正确的邮箱格式
    And 我在 "邮箱" 输入 "13677665566"
    And 我在 "密码" 输入 "a123456"
    And 我按下按钮 "完成"
    Then 我应当看到浮动提示 "您的电子邮件格式不正确"
