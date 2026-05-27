#import "cola-template.typ": *
#import "@preview/fontawesome:0.5.0": fa-icon

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
      涂馨予 #h(1.1em) 蔡欣哲 #h(1.1em) 顏苓蓁
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
  #v(-1cm)
  #align(center)[
    #table-block(
      [口味 SKU 與對應需求],
      ([圖片], [口味], [對應需求], [圖片], [口味], [對應需求]),
      (
        (
          [#image("figures/flavor/口味-經典.png", height: 3cm)],
          [經典],
          [維持核心市場 #linebreak() 屬主力口味],
          [#image("figures/flavor/口味-纖維+.png", height: 3cm)],
          [纖維+],
          [加入機能訴求 #linebreak() 擴大差異化],
        ),
        (
          [#image("figures/flavor/口味-Zero.png", height: 3cm)],
          [Zero Sugar],
          [減糖 #linebreak() 無負擔需求],
          [#image("figures/flavor/口味-特殊.png", height: 3cm)],
          [特殊口味],
          [提供新鮮感 #linebreak() 吸引年輕族群],
        ),
      ),
      (3cm, 2.5cm, 4.2cm, 3cm, 3cm, 4.2cm),
    )
  ]
]

#cola-slide(title: [包裝 SKU 分析])[
  #v(-1cm)
  #align(center)[
    #table-block(
      [包裝 SKU 與通路需求],
      ([圖片], [包裝], [常見容量], [對應需求], [圖片], [包裝], [常見容量], [對應需求]),
      (
        (
          [#image("figures/wrap/包裝-鋁罐.png", height: 3cm)],
          [鋁罐],
          [200 / 330 ml],
          [即飲、冰鎮 #linebreak() 單次飲用],
          [#image("figures/wrap/包裝-玻璃.png", height: 3cm)],
          [玻璃瓶],
          [192 ml],
          [復古經典 #linebreak() 象徵性高],
        ),
        (
          [#image("figures/wrap/包裝-寶特瓶.png", height: 3cm)],
          [寶特瓶],
          [350 / 600 ml],
          [攜帶方便 #linebreak() 屬主力規格],
          [#image("figures/wrap/包裝-家庭號.png", height: 3cm)],
          [家庭號],
          [1.25 / 2 L],
          [聚會分享 #linebreak() 單位價格低],
        ),
      ),
      (2.5cm, 2.5cm, 4cm, 3.5cm, 2.5cm, 2.5cm, 3.5cm, 3.5cm),
    )
  ]
]

#cola-section-slide(
  title: [7-11 通路 <section-711>],
  subtitle: [即飲導向的便利商店場景],
)

#cola-slide(title: [7-11 勘查背景與通路特色])[
  #grid(
    columns: (1.22fr, 0.78fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(1.2cm)
        - 地點位於#link("https://maps.app.goo.gl/6mKwD21AEyCy3kNM6")[桃園成達門市]
        - 通路型態是便利商店，決策速度快
        - 主戰場在冷藏飲料櫃，不靠大量囤貨
        - 競品集中在茶飲、水、咖啡與能量飲
        - 核心價值是冷藏即飲、快速拿取、順手加購
      ]
    ],
    [
      #v(0.8cm)
      #align(left)[
        #image("figures/711/7-11桃園成德店.jpeg", width: 90%)
      ]
    ],
  )
]

#cola-slide(title: [價格觀察])[
  #v(-2cm)
  #align(center)[
    #table-block(
      [7-11 小容量與中容量價格],
      ([品項], [容量], [原價], [促銷], [每100ml單價], [觀察]),
      (
        ([經典原味], [200ml], [\$16], [無], [\$8.00], [小容量單價高]),
        ([經典原味], [330ml], [\$25], [無], [\$7.58], [標準罐裝即飲]),
        ([經典原味], [435ml], [\$29], [第二件 6 折], [約 \$5.33], [用折扣刺激多買]),
        ([經典 / Zero #linebreak() 纖維+ /草莓], [600ml], [\$35], [2 件 \$49], [約 \$4.08], [主要促銷規格]),
        ([經典原味], [920ml], [\$45], [特價 \$36], [約 \$3.91], [大容量也有促銷感]),
        ([經典原味], [2L], [\$60], [無], [\$3.00], [單價最低且非即飲主力]),
      ),
      (4cm, 3cm, 3cm, 4cm, 4.5cm, 6.5cm),
      header-size: cola-font-size-table-header-compact,
    )
  ]
]

#cola-slide(title: [冷藏陳列])[
  #let section-tag(body) = box(
    fill: cola-red,
    inset: (x: 0.18cm, y: 0.2cm),
    radius: 0pt,
  )[
    #text(size: 20pt, weight: "bold", fill: white)[#body]
  ]

  #v(-1.5cm)

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 0.45cm,
    [
      #section-tag([600ml])
      #v(0.18cm)
      #text("選擇最多，主力即飲規格", size: 15pt)
    ],
    [
      #section-tag([435ml])
      #v(0.18cm)
      #text("第二件促銷明顯帶動加購", size: 15pt)
    ],
    [
      #section-tag([920ml])
      #v(0.18cm)
      #text("偏向帶回家，非即飲主力", size: 15pt)
    ],
    [
      #section-tag([2L])
      #v(0.18cm)
      #text("單價最低，用於分享囤貨", size: 15pt)
    ],
  )

  #v(1cm)

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: 0.25cm,
    [
      #align(center)[
        #image("figures/711/7-11冰箱陳列-3.jpeg", width: 90%)
      ]
    ],
    [
      #align(center)[
        #image("figures/711/7-11冰箱陳列-1.jpeg", width: 90%)
      ]
    ],
    [
      #align(center)[
        #image("figures/711/7-11冰箱陳列-2.jpeg", width: 90%)
      ]
    ],

    [
      #align(center)[
        #image("figures/711/7-11冰箱陳列-4.jpg", width: 90%)
      ]
    ],
  )
]

#cola-slide(title: [通路定位])[
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
  #v(-2cm)
  #grid(
    columns: (1.22fr, 0.78fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(1.5cm)
        - 勘查地點為#link("https://maps.app.goo.gl/TGA2jQQNpc8RWtWH8")[全家逸鑫店] #linebreak() #v(-0.1em) #text("位於信義區住商混合區一樓", size: 16pt, fill: gray)
        - 屬巷弄型微型超市
          - FamiSuper 生鮮冷凍
          - App 團購服務
        - 可口可樂主要放在店底封閉式冷藏櫃
        - 核心不是大量囤貨 $arrow.r$ 目的性購買 & 視覺聚焦
      ]
    ],
    [
      #v(2cm)
      #align(left)[
        #image("figures/FamiMart/全家逸鑫店.jpg", width: 90%)
      ]
    ],
  )
]

#cola-slide(title: [全家價格矩陣])[
  #v(-0.5cm)
  #align(center)[
    #table-block(
      [全家可口可樂價格矩陣],
      ([品項], [售價], [促銷], [每100ml單價], [策略定位]),
      (
        ([經典原味 600ml], [\$35], [2 件 \$49], [約 \$4.08], [黃金視線帶主促銷]),
        ([Zero 600ml], [\$35], [2 件 \$49], [約 \$4.08], [無糖即飲主力]),
        ([纖維+ 600ml], [\$35], [2 件 \$49], [約 \$4.08], [功能性高單價銷售]),
        ([水蜜桃 600ml], [\$35], [2 件 \$49], [約 \$4.08], [季節限定、創造話題與新鮮感]),
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
        ([經典原味 2L], [\$60], [無], [#impt[\$3.00]#note-ref(1)], [計畫性微囤貨]),
        ([Zero 330ml], [\$25], [無], [#expen[\$7.58]#note-ref(2)], [無糖小容量補貨]),
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

#cola-slide(title: [冰箱區陳列])[
  #v(-2cm)
  #grid(
    columns: (1.22fr, 0.78fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(1.5cm)
        - 全數放在玻璃門冷藏櫃，無常溫陳列
        - 600ml 主力集中在 7 層冰箱中段*第 4 層*
          #linebreak() $arrow.r$ *黃金視線帶*
        - 2L 在最底層，330ml 次之
          #linebreak() $arrow.r$ 整體 SKU 較其他通路精簡
        - 深店位與封閉櫃型
          #linebreak() $arrow.r$ 讓購買更偏向*目的明確的消費者*
      ]
    ],
    [
      #v(0.8cm)
      #align(center)[
        #image("figures/FamiMart/全家冰箱區陳列.jpeg", width: 85%)
      ]
    ],
  )
]

#cola-slide(title: [全家分流定價])[
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
  #v(-2cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(1.5cm)
        - 勘查地點為#link("https://maps.app.goo.gl/yW5KF31RnMVEkBNN7")[全聯內湖文湖店] #linebreak() #v(-0.1em) #text("位於住宅區大樓 B1", size: 16pt, fill: gray)
        - 動線
          1. 生鮮冷凍大冰箱
          2. 常溫日用飲料貨架
          3. 結帳
        - 可口可樂設於中後段
          #linebreak() $arrow.r$ *不靠入口搶眼位置*
      ]
    ],
    [
      #v(2.5cm)
      #align(left)[
        #image("figures/PXMart/全聯內湖文湖店.png", width: 100%)
      ]
    ],
  )
]

#cola-slide(title: [全聯價格矩陣])[
  #v(-0.5cm)
  #align(center)[
    #table-block(
      [全聯可口可樂價格矩陣],
      ([品項], [零售價], [促銷], [冰箱陳列], [每100ml單價], [策略定位]),
      (
        ([經典原味 600ml], [\$26], [任 4 瓶 \$89], [是], [\$3.71], [折扣力道最大 #linebreak() *吸引囤貨*]),
        ([Zero 600ml], [\$26], [任 4 瓶 \$89], [是], [\$3.71], [無糖即飲主力]),
        ([纖維+ 600ml], [\$28], [無], [否], [\$4.67], [功能性高單價銷售]),
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
        ([經典原味 1.25L], [\$35], [常態銷售], [否], [\$2.80], [家庭補貨主力]),
        ([經典原味 2L], [\$45], [常態低價], [否], [#impt[\$2.25]#note-ref(1)], [對標量販店 #linebreak() 全場最划算]),
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


#cola-slide(title: [常溫貨架分析])[
  #v(-2cm)
  #grid(
    columns: (1.22fr, 0.78fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(1.5cm)
        - 碳酸品類 $approx$ 60 格貨架，可口可樂 $approx$ 7 格
        - 視覺佔有率約 14%
          #linebreak() $arrow.r$ 低於家樂福但*仍維持完整存在感*
        - 由上到下都有可口可樂 SKU
          #linebreak() $arrow.r$ *垂直縱向佔據*
        - 重點不是 SKU 廣度，而以少量規格覆蓋多種家庭需求
      ]
    ],
    [
      // #v(0cm)
      #align(center)[
        #image("figures/PXMart/全聯常溫貨架分析.png", width: 85%)
      ]
    ],
  )
]

#cola-slide(title: [常溫貨架分析])[
  #v(-2cm)
  #let section-tag(body) = box(
    fill: cola-red,
    inset: (x: 0.18cm, y: 0.2cm),
    radius: 0pt,
  )[
    #text(size: 20pt, weight: "bold", fill: white)[#body]
  ]

  #grid(
    columns: (1.22fr, 0.78fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(1cm)
        #section-tag([底層])
        #v(0.18cm)
        #text(size: 17.5pt)[1.25L 與 2L 放底層，大瓶可直接平移進購物車]
        #v(0.35cm)
        #section-tag([中層])
        #v(0.18cm)
        #text(size: 17.5pt)[330ml 6 入組與 600ml 單瓶放中層，抬高最低消費門檻]
        #v(0.35cm)
        #section-tag([上層])
        #v(0.18cm)
        #text(size: 17.5pt)[纖維+與 Zero 放上層，承接健康與功能訴求]
        #v(0.35cm)
        #v(0.5cm) $arrow.r$ #text(size: 18pt)[全聯精選囤貨型規格，不追求量販店式的全面 SKU]
      ]
    ],
    [
      // #v(0cm)
      #align(center)[
        #image("figures/PXMart/全聯常溫區陳列原理.png", width: 85%)
      ]
    ],
  )
]

#cola-slide(title: [冰箱區陳列])[
  #v(-2cm)
  #grid(
    columns: (1.22fr, 0.78fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(1.5cm)
        - 冷藏櫃位於後段
          #linebreak() $arrow.r$ 主力集中在成人視線附近的黃金層
        - 排面設計
          - 經典原味 600ml $approx$ 3 格排面
          - Zero 600ml $approx$ 2 格排面
        - 冰櫃承接晚餐搭配生鮮、熟食的現喝需求
        - *任 4 瓶 \$89*
          #linebreak() $arrow.r$ 冷藏即飲 & 常溫囤貨*共享同一組促銷邏輯*
      ]
    ],
    [
      #v(0.2cm)
      #align(center)[
        #image("figures/PXMart/全聯冰箱區陳列原理.png", width: 85%)
      ]
    ],
  )
]

#cola-slide(title: [全聯的分流定價])[
  - 常溫區以 2L 與 1.25L 對標量販店，吸引社區家庭一次補貨
  - 冷藏冰箱以 600ml 大排面與低門檻促銷，*承接即時解渴需求*
  - 同一組價格結構同時服務囤貨與即飲兩種情境
  - 全聯用量販低價混搭超商冰櫃能見度，*擴大社區市佔*
]

#cola-section-slide(
  title: [家樂福通路 <section-carrefour>],
  subtitle: [量販店的分流定價與陳列],
)

#cola-slide(title: [家樂福勘查背景])[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        // #v(1.2cm)
        - 地點位於#link("https://maps.app.goo.gl/Af3dxwhe7yuxib5U9")[三峽北大店] B1 平面賣場
        - 動線
          1. 常溫貨架
          2. 生鮮調理
          3. 大冰箱 & 結帳小冰箱
        - 可口可樂設於賣場中後段
          #linebreak() $arrow.r$ *不靠入口搶眼位置*
      ]
    ],
    [
      #v(-0.2cm)
      #align(left)[
        #image("figures/Carrefour/家樂福三峽北大店.png", width: 100%)
      ]
    ],
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

#cola-slide(title: [常溫貨架分析])[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(1.2cm)
        - 碳酸品類約 40 格貨架
        - 可口可樂約占 20% 視覺空間
        - 大排面先搶視線，再壓縮競品曝光
        - 常溫區主要承擔家庭採購與組合促銷
      ]
    ],
    [
      #v(-0.2cm)
      #align(center)[
        #image("figures/Carrefour/家樂福常溫貨架分析.jpeg", width: 90%)
      ]
    ],
  )
]

#cola-slide(title: [常溫區陳列])[
  #v(-2cm)
  #let section-tag(body) = box(
    fill: cola-red,
    inset: (x: 0.18cm, y: 0.2cm),
    radius: 0pt,
  )[
    #text(size: 20pt, weight: "bold", fill: white)[#body]
  ]

  #grid(
    columns: (1.22fr, 0.78fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(1cm)
        #section-tag([中下層])
        #v(0.18cm)
        #text(size: 17.5pt)[330ml 組裝與迷你罐]
        #v(0.35cm)
        #section-tag([中層])
        #v(0.18cm)
        #text(size: 17.5pt)[600ml 與促銷 POP]
        #v(0.35cm)
        #section-tag([上層])
        #v(0.18cm)
        #text(size: 17.5pt)[2L 與大瓶，對應囤貨需求]
        #v(0.35cm)
        #v(0.5cm) $arrow.r$ #text(size: 18pt)[重點不是賣單瓶，而是*提高每次最低消費額*]
      ]
    ],
    [
      // #v(0cm)
      #align(center)[
        #image("figures/Carrefour/家樂福常溫區陳列原理.jpeg", width: 85%)
      ]
    ],
  )
]

#cola-slide(title: [常溫區陳列：檔期活動])[
  #v(-2cm)
  #let section-tag(body) = box(
    fill: cola-red,
    inset: (x: 0.18cm, y: 0.2cm),
    radius: 0pt,
  )[
    #text(size: 20pt, weight: "bold", fill: white)[#body]
  ]

  #grid(
    columns: (1.22fr, 0.78fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(0.85cm)
        #section-tag([檔期活動])
        #v(0.22cm)
        #text(size: 18pt)[太古全系列滿 #strong[\$249]，即可用 #strong[\$599] 加購]
        #v(0.08cm)
        #text(size: 18pt, weight: "bold")[價值 #strong[\$1,299] 的芬達迷你相機]
        #v(0.48cm)
        #section-tag([陳列重點])
        #v(0.22cm)
        #text(size: 18pt)[
          - 將 #strong[迷你罐] 置於黃金視線
          - 搭配促銷 POP，放大加購誘因
        ]
        #v(0.5cm)
        #text(size: 18pt)[$arrow.r$ 讓消費者更快湊單、拉高客單價]
      ]
    ],
    [
      // #v(0cm)
      #align(center)[
        #image("figures/Carrefour/芬達相機.png", width: 85%)
      ]
    ],
  )
]

#cola-slide(title: [冰箱區陳列])[
  #v(-2cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(2cm)
        - 大冰箱設在生鮮調理走道
          #linebreak() $arrow.r$ #link(
            "https://www.coca-colahellenic.com/en/media/news/corporate_news/2026/coke-and-meals-making-coca-cola-the-preferred-choice-with-food",
          )[*Coke & Meals*]
        - 大冰箱放置容量
          #linebreak() $arrow.r$ 1250ml、600ml、330ml
        - #text("小冰箱設在結帳區，對應衝動購買", fill: rgb("f2f2f2"))
        - #text("小冰箱只留 600ml，即拿即走", fill: rgb("f2f2f2"))
      ]
    ],
    [
      #v(-0.2cm)
      #align(center)[
        #image("figures/Carrefour/家樂福冰箱區陳列原理-大冰箱.jpeg", width: 90%)
      ]
    ],
  )
]

#cola-slide(title: [冰箱區陳列])[
  #v(-2cm)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.45cm,
    [
      #box(inset: (left: 0.55cm))[
        #v(2cm)
        - #text("大冰箱設在生鮮調理走道", fill: rgb("f2f2f2"))
          #linebreak() #text(fill: rgb("f2f2f2"))[$arrow.r$ Coke & Meals]
        - #text("大冰箱放置容量", fill: rgb("f2f2f2"))
          #linebreak()
          #text(fill: rgb("f2f2f2"))[$arrow.r$ 1250ml、600ml、330ml]
        - 小冰箱設在結帳區，對應衝動購買
        - 小冰箱只留 600ml，即拿即走
      ]
    ],
    [
      #v(0.1cm)
      #align(center)[
        #image("figures/Carrefour/家樂福冰箱區陳列原理-小冰箱.jpeg", width: 90%)
      ]
    ],
  )
]

#cola-slide(title: [家樂福的分流定價])[
  - 常溫區負責衝銷量，以折扣與組合價吸引家庭採購
  - 冷藏冰箱負責賺毛利，以即飲便利承接熟食與結帳動線
  - 同品牌在不同區域，價格角色完全不同
  - 典型的*分流定價*與*場景定價*
]

#cola-section-slide(
  title: [結論 <section-conclusion>],
  subtitle: [跨通路的價格、陳列與配置整合],
)

#cola-slide(title: [價格策略])[
  #v(-1cm)
  #align(center)[
    #table-block(
      [價格策略比較],
      ([面向], [小容量 (330/600ml)], [大容量 (1.25/2L)]),
      (
        ([定價邏輯], [高單位價，賣便利], [低單位價，賣量體]),
        ([主通路], [便利商店冷藏櫃], [超市/量販常溫架]),
        ([促銷手法], [第二件特價、折扣], [多入組、箱購價、任選]),
        ([消費情境], [即飲、搭餐、臨時解渴], [家庭補貨、聚會分享、囤貨]),
        ([商業效果], [提升加購率與周轉], [提高客單量與總銷量]),
      ),
      (3.2cm, 7cm, 7.5cm),
    )
  ]
]

#cola-slide(title: [商品陳列])[
  #align(center)[
    #table-block(
      [商品陳列比較],
      ([面向], [冷藏冰箱], [常溫貨架]),
      (
        ([主力規格], [600ml 即飲規格], [1.25L/2L 與多入組]),
        ([陳列位置], [黃金視線帶、搭餐動線], [大排面、補貨動線]),
        ([核心訴求], [拿取快、即開即喝], [單位價低、一次買足]),
        ([購買型態], [即時需求、衝動加購], [計畫採購、家庭囤貨]),
        ([營運效果], [提升即飲轉換率], [提升客單量與帶出量]),
      ),
      (3.2cm, 7.5cm, 7cm),
    )
  ]
]

#cola-slide(title: [通路商品配置])[
  #align(center)[
    #table-block(
      [通路商品配置比較],
      ([面向], [便利商店（7-11/全家）], [超市/量販（全聯/家樂福）]),
      (
        ([SKU 結構], [口味多元，含限定款], [家庭號與多入組占比高]),
        ([容量重心], [小容量、冷藏即飲], [大容量、常溫囤貨]),
        ([空間策略], [小空間，高周轉優先], [大空間，大排面導購]),
        ([陳列配置], [冷藏櫃為主], [冷藏 + 常溫雙區並行]),
        ([商業目標], [強化即飲與順手加購], [拉高單次購買量與總銷量]),
      ),
      (3.2cm, 6.5cm, 7.5cm),
    )
  ]
]

#cola-slide(title: [總結])[
  #let section-tag(body) = box(
    fill: cola-red,
    inset: (x: 0.18cm, y: 0.2cm),
    radius: 0pt,
  )[
    #text(size: 16pt, weight: "bold", fill: white)[#body]
  ]

  #let conclusion-row(icon, title, desc) = grid(
    columns: (1.8cm, 1fr),
    column-gutter: 0.55cm,
    align: (center + horizon, top),
    [
      #box(
        width: 1.8cm,
        height: 1.8cm,
        radius: 70%,
        fill: cola-red,
      )[
        #align(center + horizon)[
          #icon
        ]
      ]
    ],
    [
      #text(size: 22pt, weight: "bold")[#title]
      #v(0.06cm)
      #text(size: 18pt)[#desc]
    ],
  )

  #box(inset: (left: 1cm))[
    #v(-1cm)
    #conclusion-row(
      [#fa-icon("bullseye", solid: true, size: 22pt, fill: white)],
      [場景化策略],
      [同品牌分場景，價格、促銷、陳列隨通路調整。],
    )
    #v(1.8cm)
    #conclusion-row(
      [#fa-icon("cart-shopping", solid: true, size: 22pt, fill: white)],
      [通路分工],
      [便利商店衝即飲加購；超市量販拉補貨與囤貨。],
    )
    #v(1.8cm)
    #conclusion-row(
      [#fa-icon("chart-line", solid: true, size: 22pt, fill: white)],
      [成長方向],
      [以會員資料與數位促銷，持續提升轉換、客單與黏著。],
    )
  ]
]

#cola-section-slide(
  title: [感謝聆聽與指教 <section-thanks>],
  subtitle: [Thanks for Your Listening],
)
