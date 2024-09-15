from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from selenium import webdriver
from bs4 import BeautifulSoup
import os
import time
from bing_image_downloader import downloader

def news_sites(url, search_term):
    chrome_options = Options()
    chrome_options.add_argument('--log-level=3')
    chrome_options.add_experimental_option('excludeSwitches', ['enable-logging'])

    # Initialize the Chrome WebDriver
    driver = webdriver.Chrome(options=chrome_options)
    driver.get(url)

    # Wait for the page to fully load (this can be adjusted based on the site)
    try:
        # Example of waiting for a specific element to load (adjust based on site)
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.TAG_NAME, "body"))
        )
    except Exception as e:
        print(f"Error waiting for the page to load: {e}")
        driver.quit()
        return

    page_source = driver.page_source
    soup = BeautifulSoup(page_source, 'html.parser')
    
    if 'cnn' in url:
        titles = soup.find_all('p', class_="paragraph inline-placeholder")
    elif 'theguardian' in url:
        titles = soup.find_all('p', class_="dcr-1eu361v")
    elif 'nbcnews' in url:
        titles = soup.find_all('div', class_="article-body__content")
    elif 'bbc' in url:
        titles = soup.find_all('p', class_="sc-eb7bd5f6-0 fYAfXe")
    elif 'apnews' in url:
        titles_div = soup.find_all('div', class_="RichTextStoryBody RichTextBody")
        titles = titles_div.find('p')

    # Check if titles were found
    if titles:
        text_list = [title.get_text(strip=True) for title in titles]
        print(text_list)
    else:
        print("No titles found!")

    driver.quit()

    get_image(search_term, 1)

def get_image(term, num):
    downloader.download(term, limit=num, output_dir='image',
                        adult_filter_off=True, force_replace=False, timeout=60)
    print(f"Downloaded {num} images for search term: {term}")

# Example usage
news_sites('https://www.theguardian.com/us-news/2024/sep/14/more-bomb-threats-hit-springfield-ohio-after-trump-elevates-false-claims-about-haitians', 'theguardian')
