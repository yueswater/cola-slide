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
  #let toc-item(n, dest, body) = link(dest)[
    #grid(
      columns: (0.8cm, 1fr),
      column-gutter: 0.9cm,
      align: horizon,
      [
        #v(0.04cm)
        #box(fill: cola-red, inset: (x: 0.2cm, y: 0.2cm))[
          #text(size: 20pt, weight: "bold", fill: white)[#n]
        ]
      ],
      [
        #text(size: 20pt, weight: "medium", fill: cola-red)[#body]
      ],
    )
  ]

  #v(0.8cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: -2cm,
    row-gutter: 1.2cm,

    [#toc-item([1], <section-company>, [公司與品牌])], [#toc-item([4], <section-familymart>, [全家通路觀察])],

    [#toc-item([2], <section-sku>, [SKU & 包裝分析])], [#toc-item([5], <section-pxmart>, [全聯通路觀察])],

    [#toc-item([3], <section-711>, [7-11 通路觀察])], [#toc-item([6], <section-carrefour>, [家樂福通路觀察])],
  )
]

#cola-section-slide(
  title: [公司與品牌 <section-company>],
  subtitle: [企業背景與品牌意義],
)

#cola-slide(title: [可口可樂公司簡介])[
  #grid(
    columns: (0.95fr, 1.55fr, 0.9fr),
    column-gutter: 0.75cm,

    [
      #set text(size: 12.5pt)
      #set par(leading: 1.3em)

      #text(size: 17pt, weight: "bold")[品牌起點]
      #v(0.08cm)
      1886 年誕生於美國亞特蘭大，從一杯汽水擴展為全球飲料公司

      #v(0.38cm)
      #text(size: 17pt, weight: "bold")[全球規模]
      #v(0.08cm)
      產品銷售遍及 #impt[200 多個] 國家與地區，每日約 #impt[22 億] 杯飲品被消費

      #v(0.38cm)
      #text(size: 17pt, weight: "bold")[商業模式]
      #v(0.08cm)
      以濃縮液與品牌授權為核心，結合全球裝瓶夥伴完成在地通路
    ],

    [
      #align(center)[
        #image("figures/world-map.png", width: 125%)
      ]
    ],
    [
      #v(1.2cm)
      #set text(size: 16pt)
      #set par(leading: 1.2em)

      #grid(
        columns: (auto, 1fr),
        column-gutter: 0.3cm,
        row-gutter: 0.8cm,

        [#align(right)[#text(size: 18pt, weight: "bold", fill: cola-red)[200 +]]], [國家與地區],

        [#align(right)[#text(size: 18pt, weight: "bold", fill: cola-red)[2.2B]]], [每日飲品數],

        [#align(right)[#text(size: 18pt, weight: "bold", fill: cola-red)[32]]], [十億美元級品牌],

        [#align(right)[#text(size: 18pt, weight: "bold", fill: cola-red)[\$47.9B]]], [2025 年淨營收],
      )
    ],
  )
]

#cola-slide(title: [品牌介紹])[
  #let section-tag(body) = box(
    fill: cola-red,
    inset: (x: 0.18cm, y: 0.2cm),
    radius: 0pt,
  )[
    #text(size: 16pt, weight: "bold", fill: white)[#body]
  ]

  #grid(
    columns: (1.02fr, 0.92fr, 1.12fr),
    column-gutter: 0.8cm,
    align: top,

    [
      #v(-0.5cm)
      #section-tag([品牌背景])
      #v(0.18cm)
      #set text(size: 15pt)
      #set par(leading: 1.55em)
      1886 年由藥師 John S. Pemberton 使用 #strong[#link("https://zh.wikipedia.org/zh-tw/古柯")[古柯 (Coca)]、#link("https://zh.wikipedia.org/zh-tw/可樂果")[可樂果 (Cola)]]
      調配而成的飲品，故名 Coca-Cola。

      #v(0.5cm)
      #section-tag([品牌設計])
      #v(0.18cm)
      可口可樂長期使用紅配色與經典字體設計，其中紅色代表
      #strong[熱情、活力、快樂及刺激感]，強化品牌記憶點。
    ],

    [
      #align(center)[
        #image("figures/coca-cola.png", height: 10.1cm)
      ]
    ],

    [
      #v(0cm)
      #section-tag([品牌理念與行銷])
      #v(0.35cm)
      #set text(size: 15pt)
      #set par(leading: 1.6em)
      - #strong[快樂]：透過節慶活動、運動賽事等廣告情境，將喝可樂與快樂時刻做連結。
      - #strong[分享]：透過家庭號包裝、聚餐等廣告情境，將品牌打造為聚會中的陪伴者及情感交流媒介。
    ],
  )
]

#cola-section-slide(
  title: [SKU & 包裝分析 <section-sku>],
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
  title: [7-11 通路 <section-711>],
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
  title: [全家通路 <section-familymart>],
  subtitle: [微型超市中的目的性即飲場景],
)

#cola-slide(title: [全家通路背景])[
  #two-col-figure(
    [
      - 勘查地點為#link("https://maps.app.goo.gl/TGA2jQQNpc8RWtWH8")[全家逸鑫店]，位於信義區住商混合區一樓
      - 屬巷弄型微型超市，兼具 FamiSuper 生鮮冷凍與 App 團購服務
      - 可口可樂主要放在店底封閉式冷藏櫃，需開門取用
      - 核心不是大量囤貨，而是目的性購買加視覺聚焦
    ],
    [全家勘查地點與通路特色],
    title: [全家勘查地點 / 冰箱照片待補],
  )
]

#cola-slide(title: [全家價格矩陣])[
  #v(-0.5cm)
  #align(center)[
    #table-block(
      [全家可口可樂價格矩陣],
      ([品項], [售價], [促銷], [每100ml單價], [策略定位]),
      (
        ([經典原味 2L], [\$60], [無], [#impt[\$3.00]#note-ref(1)], [計畫性微囤貨]),
        ([Zero 330ml], [\$25], [無], [#expen[\$7.58]#note-ref(2)], [無糖小容量補貨]),
        ([經典原味 600ml], [\$35], [2 件 \$49], [約 \$4.08], [黃金視線帶主促銷]),
        ([Zero 600ml], [\$35], [2 件 \$49], [約 \$4.08], [無糖即飲主力]),
      ),
      (5.5cm, 2.5cm, 3.6cm, 5cm, 7.2cm),
      header-size: cola-font-size-table-header-compact,
    )
  ]
]

#cola-slide(title: [全家價格矩陣])[
  #align(center)[
    #table-block(
      [全家可口可樂價格矩陣（續）],
      ([品項], [售價], [促銷], [每100ml單價], [策略定位]),
      (
        ([經典原味 330ml], [\$25], [無], [#expen[\$7.58]#note-ref(2)], [入門即飲、精準解渴]),
        ([纖維+ 600ml], [\$35], [2 件 \$49], [約 \$4.08], [功能性高單價銷售]),
        ([水蜜桃 600ml], [\$35], [2 件 \$49], [約 \$4.08], [季節限定、創造話題與新鮮感]),
      ),
      (5.5cm, 2.5cm, 3.6cm, 5cm, 7.2cm),
      header-size: cola-font-size-table-header-compact,
    )
  ]
  #v(-0.45cm)
  #note-block((
    ("1", [單位價格最低]),
    ("2", [單位價格最高]),
  ))
]

#cola-slide(title: [全家冰箱區陳列原理])[
  #two-col-figure(
    [
      - 全部放在玻璃門型冷藏櫃，沒有常溫陳列
      - 600ml 主力集中在 7 層冰箱中段第 4 層黃金視線帶
      - 2L 放最底層，330ml 次之，整體 SKU 比其他通路更精簡
      - 深店位加封閉櫃型，使購買更偏向目的明確的消費者
    ],
    [全家冰箱區陳列],
    title: [全家封閉式冰櫃照片待補],
  )
]

#cola-slide(title: [全家的分流定價])[
  - 開放式冷藏櫃偏配餐飲料，可口可樂則留在更冰的封閉式玻璃冰櫃
  - 中段視線帶的 600ml 承接即飲需求，最底層 2L 承接家庭型補貨
  - 封閉式冰櫃的整齊排面與低溫表現，強化可樂的冰感與氣泡感
  - 全家把即時解渴與計畫性購買壓縮在同一座店底冰櫃中完成
]

#cola-section-slide(
  title: [全聯通路 <section-pxmart>],
  subtitle: [社區超市的囤貨與即飲雙軌],
)

#cola-slide(title: [全聯通路背景])[
  #two-col-figure(
    [
      - 勘查地點為#link("https://maps.app.goo.gl/yW5KF31RnMVEkBNN7")[全聯內湖文湖店]，位於住宅區大樓 B1
      - 動線依序經過生鮮冷凍大冰箱、常溫日用飲料貨架，再到結帳
      - 可口可樂主要設在中後段，不靠入口搶眼位置
      - 通路任務同時包含家庭補貨與即時飲用
    ],
    [全聯勘查地點與賣場動線],
    title: [全聯勘查地點 / 動線照片待補],
  )
]

#cola-slide(title: [全聯價格矩陣])[
  #v(-0.5cm)
  #align(center)[
    #table-block(
      [全聯可口可樂價格矩陣],
      ([品項], [零售價], [促銷], [冰箱陳列], [每100ml單價], [策略定位]),
      (
        ([經典原味 2L], [\$45], [常態低價], [否], [#impt[\$2.25]#note-ref(1)], [對標量販店 #linebreak() 全場最划算]),
        ([經典原味 1.25L], [\$35], [常態銷售], [否], [\$2.80], [家庭補貨主力]),
        ([經典原味 600ml], [\$26], [任 4 瓶 \$89], [是], [\$3.71], [折扣力道最大 #linebreak() *吸引囤貨*]),
        ([Zero 600ml], [\$26], [任 4 瓶 \$89], [是], [\$3.71], [無糖即飲主力]),
      ),
      (5.5cm, 2.5cm, 4cm, 3cm, 4.5cm, 5.6cm),
      header-size: cola-font-size-table-header-compact,
    )
  ]
]

#cola-slide(title: [全聯價格矩陣])[
  #align(center)[
    #table-block(
      [全聯可口可樂價格矩陣（續）],
      ([品項], [零售價], [促銷], [冰箱陳列], [每100ml單價], [策略定位]),
      (
        (
          [330ml 6 入組 #linebreak() (拆算)],
          [約 \$18],
          [僅售組裝],
          [否],
          [#expen[\$5.45]#note-ref(2)],
          [鎖定罐裝囤貨需求],
        ),
        ([纖維+ 600ml], [\$28], [無], [否], [\$4.67], [功能性高單價銷售]),
      ),
      (5.5cm, 2.5cm, 4cm, 3cm, 4.5cm, 5.6cm),
      header-size: cola-font-size-table-header-compact,
    )
  ]
  #v(-0.45cm)
  #note-block((
    ("1", [單位價格最低]),
    ("2", [單位價格最高]),
  ))
]

#cola-slide(title: [全聯常溫貨架分析])[
  #two-col-figure(
    [
      - 碳酸品類約 60 格貨架，可口可樂約占 7 格
      - 視覺佔有率約 14%，低於家樂福但仍維持完整存在感
      - 由上到下都有可口可樂 SKU，形成垂直縱向佔據
      - 重點不是 SKU 廣度，而是用少量規格覆蓋多種家庭需求
    ],
    [全聯常溫貨架排面],
    title: [全聯常溫貨架照片待補],
  )
]

#cola-slide(title: [全聯常溫區陳列原理])[
  #two-col-figure(
    [
      - 底層放 1.25L 與 2L，大瓶可直接平移進購物車
      - 中層放 330ml 6 入組與 600ml 單瓶，抬高最低消費門檻
      - 上層放纖維+與 Zero，承接健康與功能訴求
      - 全聯精選囤貨型規格，不追求像量販店那樣的全面 SKU
    ],
    [全聯常溫區陳列細節],
    title: [全聯常溫區細部照片待補],
  )
]

#cola-slide(title: [全聯冰箱區陳列原理])[
  #two-col-figure(
    [
      - 冷藏櫃位於後段，主力集中在成人視線附近的黃金層
      - 經典原味 600ml 約有 3 格排面，Zero 600ml 約有 2 格排面
      - 冰櫃承接晚餐搭配生鮮、熟食的現喝需求
      - 任 4 瓶 \$89 讓冷藏即飲與常溫囤貨共享同一組促銷邏輯
    ],
    [全聯冰箱區陳列],
    title: [全聯冰箱照片待補],
  )
]

#cola-slide(title: [全聯的分流定價])[
  - 常溫區以 2L 與 1.25L 對標量販店，吸引社區家庭一次補貨
  - 冷藏冰箱以 600ml 大排面與低門檻促銷，承接即時解渴需求
  - 同一組價格結構同時服務囤貨與即飲兩種情境
  - 全聯用量販低價混搭超商冰櫃能見度，擴大社區市佔
]

#cola-section-slide(
  title: [家樂福通路 <section-carrefour>],
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
      - 重點不是賣單瓶，而是*提高每次最低消費額*
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
