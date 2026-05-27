# Cola Price Analysis

Reusable analysis workspace for Coca-Cola channel price comparisons.

## Structure

- `data/`: analysis-ready data extracts or snapshots
- `notebooks/`: exploratory notebooks
- `src/`: reusable analysis and chart scripts
- `outputs/figures/`: generated chart files
- `reports/`: exported summaries or report drafts

## Run

From the repository root:

```bash
python analysis/cola_price_analysis/src/plot_channel_prices.py
```

The chart is exported to:

```text
analysis/cola_price_analysis/outputs/figures/channel_price_comparison.pdf
```
