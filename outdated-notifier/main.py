import requests
import xml.etree.ElementTree as ET
import json
import os

def get_sitemap_data(url="https://documentation.breadnet.co.uk/sitemap.xml"):
    """
    Fetches a sitemap, parses the XML, and converts it into a JSON array of objects.

    Args:
        url (str): The URL of the sitemap.xml file.

    Returns:
        A JSON formatted string of the sitemap data or None if an error occurs.
    """
    try:
        # Send a GET request to the sitemap URL
        response = requests.get(url, timeout=10)
        response.raise_for_status()  # Raise an exception for bad status codes

        # Parse the XML content
        root = ET.fromstring(response.content)

        # Define the namespace to find elements correctly
        namespace = {'sitemap': 'http://www.sitemaps.org/schemas/sitemap/0.9'}

        data = []

        # Iterate through each 'url' element in the XML
        for url_element in root.findall('sitemap:url', namespace):
            loc = url_element.find('sitemap:loc', namespace).text
            # Extract the title from the URL path
            # This is a heuristic and may need adjustment for different URL structures
            title = os.path.basename(loc.strip('/'))
            title = title.replace('-', ' ').replace('_', ' ').title()

            # Find lastmod and reviewdate, handling cases where they don't exist
            lastmod = url_element.find('sitemap:lastmod', namespace)
            reviewdate = url_element.find('sitemap:reviewdate', namespace)

            item = {
                "title": title,
                "url": loc,
                "last_modified": lastmod.text if lastmod is not None else None,
                "review_date": reviewdate.text if reviewdate is not None else None
            }
            data.append(item)

        # Convert the list of dictionaries to a JSON formatted string
        return json.dumps(data, indent=2)

    except requests.exceptions.RequestException as e:
        print(f"Error fetching the sitemap: {e}")
        return None
    except ET.ParseError as e:
        print(f"Error parsing XML: {e}")
        return None

if __name__ == "__main__":
    sitemap_json = get_sitemap_data()
    if sitemap_json:
        print(sitemap_json)
