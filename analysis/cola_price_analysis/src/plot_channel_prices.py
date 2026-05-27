from __future__ import annotations

import csv
import colorsys
import os
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
MPLCONFIGDIR = ROOT / "analysis" / "cola_price_analysis" / ".matplotlib"
MPLCONFIGDIR.mkdir(parents=True, exist_ok=True)
os.environ.setdefault("MPLCONFIGDIR", str(MPLCONFIGDIR))

import matplotlib
import matplotlib.font_manager as fm

matplotlib.use("Agg")
import matplotlib.pyplot as plt


DATA_PATH = ROOT / "data" / "cola-survey.csv"
OUTPUT_PATH = (
    ROOT
    / "analysis"
    / "cola_price_analysis"
    / "outputs"
    / "figures"
    / "channel_price_comparison.pdf"
)

CHANNELS = ["7-11", "全家", "全聯", "家樂福"]
PRODUCTS = [
    "經典原味 330ml",
    "經典原味 600ml",
    "經典原味 2L",
    "Zero Sugar 600ml",
    "纖維+ 600ml",
]
BASE_COLOR = "#e4154b"


def adjust_lightness(hex_color: str, factor: float) -> str:
    red = int(hex_color[1:3], 16) / 255
    green = int(hex_color[3:5], 16) / 255
    blue = int(hex_color[5:7], 16) / 255
    hue, lightness, saturation = colorsys.rgb_to_hls(red, green, blue)
    lightness = max(0, min(1, lightness * factor))
    red, green, blue = colorsys.hls_to_rgb(hue, lightness, saturation)
    return f"#{round(red * 255):02x}{round(green * 255):02x}{round(blue * 255):02x}"


BAR_COLORS = [
    adjust_lightness(BASE_COLOR, 1.75),
    adjust_lightness(BASE_COLOR, 1.35),
    BASE_COLOR,
    adjust_lightness(BASE_COLOR, 0.72),
]


def register_fonts() -> None:
    font_paths = [
        ROOT / "fonts" / "NotoSansTC-Regular.ttf",
        ROOT / "fonts" / "NotoSansTC-Bold.ttf",
        ROOT / "fonts" / "AlibabaSans-Regular.ttf",
        ROOT / "fonts" / "AlibabaSans-Bold.ttf",
    ]
    for font_path in font_paths:
        fm.fontManager.addfont(font_path)

    plt.rcParams.update(
        {
            "font.family": ["Noto Sans TC", "Alibaba Sans", "sans-serif"],
            "pdf.fonttype": 42,
            "axes.unicode_minus": False,
        }
    )


def load_prices() -> dict[tuple[str, str], int]:
    prices: dict[tuple[str, str], int] = {}
    with DATA_PATH.open(newline="", encoding="utf-8") as file:
        reader = csv.DictReader(file)
        for row in reader:
            channel = row["店家"]
            product = row["品名"]
            if channel not in CHANNELS or product not in PRODUCTS:
                continue

            price = int(row["售價"] or 0)
            if price <= 0:
                continue

            prices[(channel, product)] = price

    return prices


def plot() -> None:
    register_fonts()
    prices = load_prices()

    fig, ax = plt.subplots(figsize=(11, 5.8))
    x_positions = range(len(PRODUCTS))
    bar_width = 0.18
    offsets = [-1.5 * bar_width, -0.5 * bar_width, 0.5 * bar_width, 1.5 * bar_width]

    for channel, offset, color in zip(CHANNELS, offsets, BAR_COLORS, strict=True):
        xs: list[float] = []
        ys: list[int] = []
        for index, product in enumerate(PRODUCTS):
            price = prices.get((channel, product))
            if price is None:
                continue
            xs.append(index + offset)
            ys.append(price)

        bars = ax.bar(
            xs,
            ys,
            width=bar_width,
            label=channel,
            color=color,
            edgecolor="white",
            linewidth=0.8,
        )
        ax.bar_label(bars, labels=[f"${value}" for value in ys], padding=3, fontsize=9)

    ax.set_xticks(list(x_positions), PRODUCTS)
    ax.set_ylabel("售價 (新台幣)")
    ax.set_ylim(0, 68)
    ax.grid(axis="y", color="#e8e8e8", linewidth=0.8)
    ax.set_axisbelow(True)
    ax.spines["top"].set_visible(False)
    ax.spines["right"].set_visible(False)
    ax.spines["left"].set_color("#cfcfcf")
    ax.spines["bottom"].set_color("#cfcfcf")
    ax.tick_params(axis="both", colors="#333333")

    legend = ax.legend(
        loc="upper center",
        bbox_to_anchor=(0.5, -0.13),
        ncol=len(CHANNELS),
        frameon=False,
        handlelength=1.4,
        columnspacing=1.8,
    )
    for text in legend.get_texts():
        text.set_color("#333333")

    OUTPUT_PATH.parent.mkdir(parents=True, exist_ok=True)
    fig.subplots_adjust(bottom=0.24, left=0.08, right=0.98, top=0.95)
    fig.savefig(OUTPUT_PATH, format="pdf", bbox_inches="tight")
    plt.close(fig)


if __name__ == "__main__":
    plot()
    print(OUTPUT_PATH)
