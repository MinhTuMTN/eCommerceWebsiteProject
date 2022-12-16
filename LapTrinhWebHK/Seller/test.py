import cloudscraper

scraper = cloudscraper.create_scraper()  # returns a CloudScraper instance
# Or: scraper = cloudscraper.CloudScraper()  # CloudScraper inherits from requests.Session
print(scraper.get(
    "https://www.webtoon.xyz/?s&post_type=wp-manga&adult=1&m_orderby=latest").text)
