package com.hongtang.easytbk

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class EasytbkPlugin(registrar: Registrar): MethodCallHandler {
    private val loginService = LoginServiceHandler(registrar)
    private val tradeHandler = TradeHandler(registry = registrar)

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "easytbk")
      channel.setMethodCallHandler(EasytbkPlugin(registrar))
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {

    when {
        "login" == call.method -> loginService.handleLogin(call, result)
        "initLogin" == call.method -> loginService.initLogin(result)
        "isLogin" == call.method -> loginService.handleIsLogin(result)
        "getUser" == call.method -> loginService.handleGetUser(result)
        "logout" == call.method -> loginService.handleLogout(result)
        "initTradeAsync" == call.method -> tradeHandler.initTradeAsync(call,result)
        "openItemDetail" == call.method -> tradeHandler.openItemDetail(call,result)
        "openUrl" == call.method -> tradeHandler.openUrl(call, result)
        "destroy" == call.method -> tradeHandler.destroy()
        "getPlatformVersion" == call.method -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
        else -> result.notImplemented()
    }

    // if (call.method == "getPlatformVersion") {
    //   result.success("Android ${android.os.Build.VERSION.RELEASE}")
    // } else {
    //   result.notImplemented()
    // }
  }
}
