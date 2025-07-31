import requests

def fetch_cloudflare_ips():
    url = "https://api.cloudflare.com/client/v4/ips"
    response = requests.get(url)
    response.raise_for_status()  # Raise error if request failed
    data = response.json()

    if not data.get("success"):
        raise Exception("API response not successful")

    ipv4 = data["result"]["ipv4_cidrs"]
    ipv6 = data["result"]["ipv6_cidrs"]

    lines = [
        "# nginx.conf",
        "real_ip_recursive on;",
        "real_ip_header CF-Connecting-IP;",
        "",
        "#v4"
    ]
    lines.extend(f"set_real_ip_from {ip};" for ip in ipv4)
    lines.append("")
    lines.append("# V6")
    lines.extend(f"set_real_ip_from {ip};" for ip in ipv6)

    with open("docs/kb/nginx/cloudflare.conf", "w") as f:
        f.write("\n".join(lines))

    print("cloudflare.conf written successfully.")

if __name__ == "__main__":
    fetch_cloudflare_ips()
