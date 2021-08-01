import Foundation

class AbstractAdsAdapter {
    // 初始化引擎
    func initializeEngine() {}
    // 加载广告
    func load() {}
    // 显示广告
    func showInterstitial() {}
}

class AdmobAdsAdapter: AbstractAdsAdapter {
    override func initializeEngine() {
        print("调用Admob初始化引擎接口")
    }
    
    override func load() {
        print("调用Admob加载广告API的接口")
    }
    
    override func showInterstitial() {
        print("调用Admob展示广告API的接口")
    }
}

class TencentAdsAdapter: AbstractAdsAdapter {
    override func initializeEngine() {
        print("调用广点通初始化引擎接口")
    }
    
    override func load() {
        print("调用广点通加载广告API的接口")
    }
    
    override func showInterstitial() {
        print("调用广点通展示广告API的接口")
    }
}

class AdsManager {
    enum Engine: String {
        case admob, tencent
    }
    private var map: [String: AbstractAdsAdapter] = [:]
    
    func initialize(_ engine: Engine) {
        var adapter: AbstractAdsAdapter?
        switch engine {
        case .admob :
            adapter = AdmobAdsAdapter()
        case .tencent :
            adapter = TencentAdsAdapter()
        }
        if adapter != nil {
            map[engine.rawValue] = adapter
            adapter!.initializeEngine()
        }
    }
    
    func load(engine: Engine) {
        if let adapter = map[engine.rawValue] {
            adapter.load()
        } else {
            print("广告引擎 \(engine.rawValue) 未初始化")
        }
    }
    
    func showInterstitial(engine: Engine) {
        if let adapter = map[engine.rawValue] {
            adapter.showInterstitial()
        } else {
            print("广告引擎 \(engine.rawValue) 未初始化")
        }
    }
}


let adsManager = AdsManager()
adsManager.initialize(.admob)
adsManager.load(engine: .admob)
adsManager.showInterstitial(engine: .admob)
adsManager.showInterstitial(engine: .tencent)


