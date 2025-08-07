# 🎮 Esports Earnings Inequality Research

> This repository supports a research project investigating economic inequality within professional esports. The project draws from historical tournament data to quantify earnings distribution among players across different games and years. The research follows up on "McLeod et al. (2021)" and focuses on identifying patterns of prize concentration and inequality.

---

## 📌 Scope of Contribution

The scripts and datasets in this repository reflect the data **collection and cleaning pipeline** for the project. This includes scraping historical earnings, player rosters, and recent tournament results for popular esports titles. Specifically, a dataset of 45,371 esports players across 10 games was collected, cleaned, and analyzed using R Studio.

---

## 📁 Project Structure

```
esports-earning-inequality-research/
├── Base script.R                            # Initialization and helper functions
├── Collect earnings for each player...R     # Pulls player earnings by year
├── Collect player information for...R       # Scrapes player profiles by game
├── Collect recent tournaments.R             # Grabs recent tournament data
├── rbind scraped data together.R            # Combines and formats all scraped data
├── collected_data/                          # Cleaned and categorized data per game
│   ├── Apex Legends/
│   ├── Counter-Strike/
│   ├── ...
│   └── Star2/
├── McLeod et al. 2021.pdf                   # Reference paper
└── API_Key_...                              # API key used in scraping
```

---

## 🧹 Data Workflow

1. **Collect earnings** — `Collect earnings for each player...R`
2. **Scrape metadata** — `Collect player information for...R`
3. **Get tournaments** — `Collect recent tournaments.R`
4. **Clean and merge** — `rbind scraped data together.R`

Final data lives in `collected_data/`, organized by game.

---

## 🔍 Related Work

- McLeod, K., Zhang, J., & McCullough, B. P. (2021). *Prize Money Distributions and Inequality in Esports*. Journal of Sport Management.

---

## 👤 Contributor

- **Kyeongmo Kang** — Data scraping, cleaning, and preprocessing

---

## 📄 Citation

If referencing the research, cite McLeod et al. (2021). If referencing data engineering:

```
Kang, K. (2023). Esports Earnings Inequality Dataset. Research assistant contribution, based on McLeod et al. (2021) framework.
```

---

## 🔒 Disclaimer

API keys and source credentials are excluded from this repository for security purposes.

