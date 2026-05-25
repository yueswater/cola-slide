#import "cola-template.typ": *

#show: cola-theme.with(
  aspect-ratio: "16-9",
  font: ("Alibaba Sans", "Noto Sans TC"),
  slide-alignment: top,
  progress-bar: true,
  institute: [International Marketing Management],
  logo: [#image("figures/coca-cola-logo.svg", width: 3.2cm)],
  config-info(
    title: [Coca-Cola Mini Project],
    subtitle: [通路觀察與價格陳列分析],
    authors: [
      李冠儀 #h(1.1em) 宋品岳 #h(1.1em) 林容亘 #h(1.1em) 邱郁文
      #linebreak()
      涂馨予 #h(1.1em) 蔡欣哲 #h(1.1em) 顏苡蓁
    ],
    extra: [Group 6 | May 28, 2026],
    footer: [Coca-Cola Mini Project],
    download-qr: "",
  ),
  config-common(
    handout: false,
  ),
  config-colors(
    primary: rgb("e4154b"),
  ),
)

#cola-title-slide()

#cola-slide(title: [目錄])[
  1. 公司與品牌
  2. SKU 與包裝
  3. 7-11 通路觀察
  4. 家樂福通路觀察
  5. 結論
]

#cola-section-slide(
  title: [公司與品牌],
  subtitle: [企業背景與品牌意義],
)

#cola-slide(title: [可口可樂公司簡介])[
  #quote-block[
    1886 年創立，從單一汽水品牌發展為全球性飲料公司。
  ]

  - 佈局超過 200 個國家與地區
  - 每日飲品消費量約 22 億杯
  - 核心模式是品牌授權加在地裝瓶
  - 2025 年營收約 479 億美元
]

#cola-slide(title: [品牌介紹])[
  #two-col-figure(
    [
      - 品牌命名源自 coca 與 cola
      - 經典紅白識別強化記憶點
      - 核心情感是快樂、分享、陪伴
      - 行銷語境多綁節慶、聚會與即飲時刻
    ],
    [品牌主視覺 / 產品圖],
    title: [品牌主視覺 / 產品圖待補],
  )
]

#cola-section-slide(
  title: [SKU 分析],
  subtitle: [口味與包裝結構],
)

#cola-slide(title: [口味 SKU 分析])[
  #align(center)[
    #table-block(
      [口味 SKU 與對應需求],
      ([口味], [對應需求]),
      (
        ([經典], [維持核心市場，屬主力口味]),
        ([Zero Sugar], [對應減糖與無負擔需求]),
        ([纖維+], [加入機能訴求，擴大差異化]),
        ([特殊口味], [提供新鮮感，吸引年輕族群]),
      ),
      (4cm, 8.8cm),
    )
  ]
]

#cola-slide(title: [包裝 SKU 分析])[
  #align(center)[
    #table-block(
      [包裝 SKU 與通路需求],
      ([包裝], [常見容量], [對應需求]),
      (
        ([鋁罐], [200 / 330 ml], [即飲、冰鎮、單次飲用]),
        ([寶特瓶], [350 / 600 ml], [攜帶方便，屬主力規格]),
        ([玻璃瓶], [192 ml], [復古經典，象徵性高]),
        ([家庭號], [1.25 / 2 L], [聚會分享，單位價格低]),
      ),
      (4cm, 5.5cm, 8cm),
    )
  ]
]

#cola-section-slide(
  title: [7-11 通路],
  subtitle: [即飲導向的便利商店場景],
)

#cola-slide(title: [7-11 勘查背景與通路特色])[
  #two-col-figure(
    [
      - 地點位於#link("https://maps.app.goo.gl/6mKwD21AEyCy3kNM6")[桃園成達門市]
      - 通路型態是便利商店，決策速度快
      - 主戰場在冷藏飲料櫃，不靠大量囤貨
      - 競品集中在茶飲、水、咖啡與能量飲
      - 核心價值是冷藏即飲、快速拿取、順手加購
    ],
    [7-11 現場勘查照片],
    title: [7-11 現場照片待補],
  )
]

#cola-slide(title: [7-11 價格觀察])[
  #align(center)[
    #table-block(
      [7-11 小容量與中容量價格],
      ([品項], [原價], [促銷], [每100ml單價], [觀察]),
      (
        ([經典原味 200ml], [\$16], [無], [\$8.00], [小容量單價高]),
        ([經典原味 330ml], [\$25], [無], [\$7.58], [標準罐裝即飲]),
        ([經典原味 435ml], [\$29], [第二件 6 折], [約 \$5.33], [用折扣刺激多買]),
      ),
      (5cm, 3cm, 4.5cm, 5cm, 5.5cm),
      header-size: cola-font-size-table-header-compact,
    )
  ]
]

#cola-slide(title: [7-11 價格觀察])[
  #align(center)[
    #table-block(
      [7-11 大容量與主促銷規格],
      ([品項], [原價], [促銷], [每100ml單價], [觀察]),
      (
        ([經典 / Zero / 纖維+ / 草莓 600ml], [\$35], [2 件 \$49], [約 \$4.08], [主要促銷規格]),
        ([經典原味 920ml], [\$45], [特價 \$36], [約 \$3.91], [大容量也有促銷感]),
        ([經典原味 2L], [\$60], [無], [\$3.00], [單價最低 #linebreak() 不屬即飲主力]),
      ),
      (6.5cm, 3cm, 4cm, 4.5cm, 6cm),
      header-size: cola-font-size-table-header-compact,
    )
  ]
]

#cola-slide(title: [7-11 冷藏陳列])[
  #two-col-figure(
    [
      - 600ml 選擇最多，是即飲主力
      - 435ml 搭配明顯促銷標籤，放大第二件誘因
      - 920ml 與 2L 雖便宜，但更偏帶回家或多人分享
      - 陳列邏輯是冷藏即飲加多規格選擇
    ],
    [7-11 冷藏櫃陳列],
    title: [7-11 冷藏櫃 / 冰箱照片待補],
  )
]

#cola-slide(title: [7-11 通路定位])[
  - 消費情境：臨時解渴、搭餐、通勤外帶
  - 小容量適合即飲，但單位價格較高
  - 大容量單位價格較低，但偏離即時飲用情境
  - 通路核心不是最低價，而是方便取得與冷藏可喝
]

#cola-slide(title: [7-11 促銷策略])[
  - 600ml 用 *2 件 \$49* 作為主促銷規格
  - 435ml 用第二件 6 折提高加購率
  - 920ml 用*特價*製造大容量划算感
  - 促銷目的不是囤貨，而是把單瓶購買轉化成*雙件購買*
]

#cola-section-slide(
  title: [家樂福通路],
  subtitle: [量販店的分流定價與陳列],
)

#cola-slide(title: [家樂福通路背景])[
  #two-col-figure(
    [
      - 大型量販店，附設停車場
      - 購物動線長，會經過常溫貨架與生鮮區
      - 可口可樂同時布局常溫大量採購與冷藏即飲
      - 通路任務是兼顧銷量、毛利與衝動購買
    ],
    [家樂福外觀與通路背景],
    title: [家樂福外觀 / 封面圖待補],
  )
]

#cola-slide(title: [家樂福價格矩陣])[
  #v(-1cm)
  #align(center)[
    #table-block(
      [家樂福常溫與家庭號價格矩陣],
      ([規格與品項], [特價], [原價], [折扣率], [每100ml單價]),
      (
        ([原味 2000ml], [\$45], [\$50], [10.0%], [#impt[\$2.25]#note-ref(1)]),
        ([原味 / Zero 1250ml], [\$35], [\$39], [10.3%], [\$2.80]),
        ([纖維+ 600ml #(sym.times) 4], [\$112], [\$120], [6.7%], [\$4.67]),
        ([原味 600ml #(sym.times) 4], [\$89], [\$111], [#impt[19.8%]#note-ref[2]], [\$3.71]),
        ([原味 / Zero 330ml #(sym.times) 24], [\$336], [\$376], [10.6%], [\$4.24]),
      ),
      (7cm, 3cm, 3cm, 3cm, 4.5cm),
      header-size: cola-font-size-table-header-compact,
    )
  ]
  #v(-0.5cm)
  #note-block((
    ("1", [全場最划算]),
    ("2", [折扣力道最大，吸引常溫囤貨]),
  ))
]

#cola-slide(title: [家樂福價格矩陣])[
  #align(center)[
    #table-block(
      [家樂福單瓶與組裝價格矩陣 (續)],
      ([規格與品項], [特價], [原價], [折扣率], [每100ml單價]),
      (
        ([原味 330ml #(sym.times) 6], [\$85], [\$95], [10.5%], [\$4.29]),
        ([原味 250ml #(sym.times) 24], [\$259], [\$259], [0.0%], [\$4.32]),
        ([大冰箱 600ml 單瓶], [\$28], [\$28], [0.0%], [\$4.67]),
        ([結帳小冰箱 330ml 單罐], [\$20], [\$20], [0.0%], [\$6.06]),
        ([迷你罐 220ml #(sym.times) 8], [\$109], [\$115], [5.2%], [#expen[\$6.19]#note-ref(3)]),
      ),
      (7cm, 3cm, 3cm, 3cm, 4.5cm),
      header-size: cola-font-size-table-header-compact,
    )
  ]

  #v(-0.5cm)
  #note-block((
    ("3", [單位最貴]),
  ))
]

#cola-slide(title: [家樂福勘查背景])[
  #two-col-figure(
    [
      - 地點位於#link("https://maps.app.goo.gl/Af3dxwhe7yuxib5U9")[三峽北大店] B1 平面賣場
      - 動線依序經過常溫貨架、生鮮調理、大冰箱與結帳小冰箱
      - 可口可樂設於賣場中後段，不在主入口
      - 代表品牌依靠分區任務，而非入口搶眼位置
    ],
    [家樂福勘查地點],
    title: [家樂福勘查地點照片待補],
  )
]

#cola-slide(title: [常溫貨架分析])[
  #two-col-figure(
    [
      - 碳酸品類約 40 格貨架
      - 可口可樂約占 20% 視覺空間
      - 大排面先搶視線，再壓縮競品曝光
      - 常溫區主要承擔家庭採購與組合促銷
    ],
    [家樂福常溫貨架排面],
    title: [常溫貨架照片待補],
  )
]

#cola-slide(title: [常溫區陳列原理])[
  #two-col-figure(
    [
      - 上層放 2L 與大瓶，對應囤貨需求
      - 黃金視線帶放 600ml 與促銷 POP
      - 中下層放 330ml 組裝與迷你罐
      - 重點不是賣單瓶，而是提高每次最低消費額
    ],
    [家樂福常溫區陳列細節],
    title: [常溫區細部照片待補],
  )
]

#cola-slide(title: [冰箱區陳列原理])[
  #two-col-figure(
    [
      - 大冰箱設在生鮮調理走道，綁定 Coke with Food
      - 小冰箱設在結帳區，對應衝動購買
      - 大冰箱可放 1250ml、600ml、330ml
      - 小冰箱只留 600ml，即拿即走
    ],
    [家樂福冰箱區陳列],
    title: [大冰箱 / 小冰箱照片待補],
  )
]

#cola-slide(title: [家樂福的分流定價])[
  - 常溫區負責衝銷量，以折扣與組合價吸引家庭採購
  - 冷藏冰箱負責賺毛利，以即飲便利承接熟食與結帳動線
  - 同品牌在不同區域，價格角色完全不同
  - 這是典型的分流定價與場景定價
]

#cola-section-slide(
  title: [結論],
  subtitle: [兩種通路，兩套邏輯],
)

#cola-slide(title: [結論])[
  #color-block(title: [通路對比])[
    - 7-11 重點是冷藏即飲、快速拿取、第二件促銷
    - 家樂福重點是常溫囤貨、冷藏即飲、分區定價
    - 便利商店賣的是便利與即時性
    - 量販店賣的是價格效率與分流獲利
  ]
]
