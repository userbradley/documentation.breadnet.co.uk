import requests
from datetime import datetime, timezone

def fetch_cloudflare_ips():
    """
    Fetches Cloudflare's IP ranges and writes them to an nginx configuration file.
    """
    url = "https://api.cloudflare.com/client/v4/ips"
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise HTTPError for bad responses (4xx or 5xx)
        data = response.json()

        if not data.get("success"):
            raise Exception("API response indicates failure.")

        ipv4 = data["result"]["ipv4_cidrs"]
        ipv6 = data["result"]["ipv6_cidrs"]

        # Get the current time in UTC
        now_utc = datetime.now(timezone.utc)
        # Format the timestamp string
        timestamp = now_utc.strftime('%Y-%m-%d %H:%M:%S %Z')

        lines = [
            f"# File last updated on: {timestamp}",
            "# Source: https://documentation.breadnet.co.uk/kb/nginx/get-real-ip-address-behind-cloudflare-nginx",
            "",
            "real_ip_recursive on;",
            "real_ip_header CF-Connecting-IP;",
            "",
            "# IPv4 Ranges"
        ]
        lines.extend(f"set_real_ip_from {ip};" for ip in ipv4)
        lines.append("")
        lines.append("# IPv6 Ranges")
        lines.extend(f"set_real_ip_from {ip};" for ip in ipv6)

        # Write to the file, ensuring a trailing newline
        with open("docs/kb/nginx/cloudflare.conf", "w") as f:
            f.write("\n".join(lines) + "\n")

        print("cloudflare.conf written successfully.")

    except requests.exceptions.RequestException as e:
        print(f"Error fetching data from Cloudflare: {e}")
    except (KeyError, TypeError) as e:
        print(f"Error parsing the API response: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


if __name__ == "__main__":
    fetch_cloudflare_ips()
