import requests
from bs4 import BeautifulSoup
import json

def add_item(data):
    url = "http://127.0.0.1:8000/api/news/"
    data_complete =data
        
    try:
        response = requests.post(url, json=data_complete)
        response.raise_for_status()  # Raise an HTTPError for bad responses (4xx and 5xx)
        print(f"POST Success: {response.status_code}")
        new_item = response.json()
        print(f"New Item ID: {new_item['id']}")
        print("Item added successfully.")
    except requests.exceptions.RequestException as e:
        print(f"POST Error: {e}")
        print(f"POST Error: {e}")
        if response.status_code == 400:
            print(f"Server Response: {response.text}")

Dataset = [
    {
        "title": "Billionaire and Polaris Dawn astronauts safely return to Earth following private spacewalk\n\nAfter conducting the first private spacewalk, billionaire and Polaris Dawn astronauts landed back on Earth without any complications. The crew successfully completed their mission in space and returned home as scheduled.",
        "link": [
            "https://abcnews.go.com/US/wireStory/tech-billionaire-returns-earth-after-private-spacewalk-113696539",
            "https://abcnews.go.com/US/wireStory/tech-billionaire-returns-earth-after-private-spacewalk-113696539",
            "https://www.nytimes.com/2024/09/15/us/spacex-polaris-dawn-landing.html"
        ],
        "text": "Billionaire and crew return from record-breaking private spacewalk, splashing down near Gulf of Mexico\n\nTech entrepreneur Jared Isaacman, along with two SpaceX engineers and a former Air Force Thunderbird pilot, successfully completed the first private spacewalk orbiting 460 miles above Earth, higher than the ISS and Hubble Space Telescope. The crew landed safely near the Gulf of Mexico following a five-day voyage reaching a peak altitude of 875 miles, demonstrating SpaceX's capabilities for future Mars missions. The mission was part of Isaacman's Polaris exploration program, sharing costs with SpaceX and using the opportunity to test new spacesuit technologies."
    },
    {
        "title": "911 calls released from Georgia high school shooting reveal 'high call volume' on the day of the incident",
        "link": [
            "https://abcnews.go.com/US/emergency-dispatch-center-overwhelmed-georgia-high-school-shooting/story?id=113692311",
            "https://abcnews.go.com/US/emergency-dispatch-center-overwhelmed-georgia-high-school-shooting/story?id=113692311",
            "https://www.foxnews.com/us/georgia-high-school-shooting-911-calls-released-high-call-volume"
        ],
        "text": "Overwhelmed emergency dispatch center receives numerous 911 calls during Georgia high school shooting. 911 calls from witnesses and parents flooded during the shooting at Apalachee High School. Reports detail challenges faced by callers in reaching dispatchers as the situation unfolded, with the suspect being a 14-year-old charged with felony murder and his father facing multiple charges for allegedly allowing him access to the weapon used."
    },
    {
        "title": "911 calls from the Georgia high school shooting reveal overwhelming 'high call volume' at emergency dispatch center in Barrow County",
        "link": [
            "https://abcnews.go.com/US/emergency-dispatch-center-overwhelmed-georgia-high-school-shooting/story?id=113692311",
            "https://abcnews.go.com/US/emergency-dispatch-center-overwhelmed-georgia-high-school-shooting/story?id=113692311",
            "https://www.foxnews.com/us/georgia-high-school-shooting-911-calls-released-high-call-volume"
        ],
        "text": "911 calls at Georgia high school shooting highlight overwhelming 'high call volume' at dispatch center as the community attempted to reach emergency responders during the incident. Local reports reveal difficulties faced by callers seeking urgent assistance as they strived to understand the unfolding tragedy at Apalachee High School. The tragic event led to the loss of four lives and injuries to several individuals, with charges filed against the suspected gunman and his father for their alleged roles in the shooting."
    },
    {
        "title": "\u2018High call volume\u2019 reported in released 911 calls from Georgia high school shooting",
        "link": [
            "https://www.foxnews.com/us/georgia-high-school-shooting-911-calls-released-high-call-volume",
            "https://www.foxnews.com/us/georgia-high-school-shooting-911-calls-released-high-call-volume",
            "https://abcnews.go.com/US/emergency-dispatch-center-overwhelmed-georgia-high-school-shooting/story?id=113692311"
        ],
        "text": "Social media criticism arises towards Vice President Kamala Harris following a solo interview perceived as lacking substance regarding her economic policies and potentially affecting her suitability for the presidency. The Georgia high school shooting emergency dispatch center faced challenges handling numerous 911 calls amidst the tragic incident, as documented recordings revealed the overwhelming high call volume. Difficulties were reported in reaching dispatchers during the crisis at Apalachee High School, where a tragic shooting led to multiple fatalities and injuries."
    },
    {
        "title": "Billionaire and Polaris Dawn astronauts safely return to Earth following private spacewalk",
        "link": [
            "https://www.nytimes.com/2024/09/15/us/spacex-polaris-dawn-landing.html",
            "https://abcnews.go.com/US/wireStory/tech-billionaire-returns-earth-after-private-spacewalk-113696539"
        ],
        "text": "Tech entrepreneur Jared Isaacman and his crew returned to Earth following a successful private spacewalk, reaching orbital heights higher than any NASA moonwalkers previously. SpaceX\u2019s capsule splashed down near the Dry Tortugas after the crew completed their spacewalk while orbiting 460 miles above Earth, marking a milestone in private space exploration with Isaacman becoming the 264th person to perform a spacewalk. The mission was part of Isaacman's space exploration program Polaris, with the crew achieving their objectives and returning safely to Earth."
    },
    {
        "title": "'High call volume' reported in released Georgia high school shooting 911 calls",
        "link": [
            "https://www.foxnews.com/us/georgia-high-school-shooting-911-calls-released-high-call-volume",
            "https://www.foxnews.com/us/georgia-high-school-shooting-911-calls-released-high-call-volume",
            "https://abcnews.go.com/US/emergency-dispatch-center-overwhelmed-georgia-high-school-shooting/story?id=113692311"
        ],
        "text": "Bipartisan backlash against Kamala Harris after rocky interview contrasts with tragic aftermath of Georgia high school shooting. Harris criticized for answers in solo interview seen as lacking substance; Georgia high school shooting resulted in fatalities and injuries, with 911 calls detailing the chaos that ensued during the tragic incident. Harris's interview outcome raises concerns over her readiness for higher office, while the Georgia high school shooting exposes the devastating impact of gun violence in schools."
    },
    {
        "title": "Billionaire and Polaris Dawn astronauts safely return to Earth after landmark private spacewalk",
        "link": [
            "https://www.nytimes.com/2024/09/15/us/spacex-polaris-dawn-landing.html",
            "https://abcnews.go.com/US/wireStory/tech-billionaire-returns-earth-after-private-spacewalk-113696539"
        ],
        "text": "Billionaire Jared Isaacman and his crew, including SpaceX's Sarah Gillis, safely return to Earth after a historic private spacewalk, reaching altitudes higher than the International Space Station. The crew's successful mission included testing new spacesuit technology and marking a milestone in private space exploration, with Isaacman leading the way. Isaacman's space exploration program, Polaris, aims for further missions, showcasing a significant shift towards privately funded space endeavors."
    }
]



for i in Dataset:
    add_item(i)