# Northview Production

A static conference gear guide for Northview Church, intended for **https://www.nvprod.us**. Audio, Video, LED, and Lighting list the team-provided equipment, with manufacturer links where the products are identifiable. High-level project budgets are still pending.

Plain HTML and CSS; no JavaScript, package installation, or framework required. The existing Northview design system supplies the branding and photography.

## Preview locally

Requires Python 3 and Bash:

```sh
bash scripts/build.sh
python3 -m http.server 8766 --bind 127.0.0.1 --directory _site
```

Open http://127.0.0.1:8766. Re-run the build after editing source files, then refresh.

## Files and content

- `index.html` — homepage and the four linked department sections. Update the gear lists here and replace project-budget placeholders as pricing becomes available.
- `site.css` — site layout and responsive styles.
- `assets/led-raster.svg` — LED wall-size diagram; cells distinguish 128 × 256 px double panels from 128 × 128 px single corner panels. The wall-size table in `index.html` provides the same dimensions as text.
- `404.html` — missing-page response.
- `design-system/` — existing brand reference, shared CSS, and assets. The design-system examples are illustrative, not the conference gear inventory.
- `scripts/build.sh` — copies only public site files into `_site/`.
- `.github/workflows/pages.yml` — builds pull requests; deploys `main` through GitHub Pages.

For each department, collect gear model, purpose, quantity where useful, and manufacturer links. For project budgets, include scope, approximate cost or range, pricing date, and whether installation/tax are included. Leave unavailable prices explicitly pending.

Equipment quantities, installed configurations, and roles come from the production team. Product naming and links were checked against manufacturer sources on 2026-09-24. Product pages describe available capabilities, not necessarily the installed configuration. Official specifications or legacy documentation are linked when a suitable product page is unavailable. Clone fixtures remain explicitly labeled, without links that imply they are original-brand products.

Details still to collect: the exact Acuity panel variant (two stripes alone does not distinguish 2X/2M and display variants), fixture manufacturers/model numbers and counts, and project pricing. Do not infer missing quantities or price the installed projects from retail component listings.

The existing styles load Adobe Fonts with Google Fonts and system fallbacks. Confirm the Adobe kit permits `www.nvprod.us` before launch.

## Enable GitHub Pages

A repository admin must complete the initial setup at:
https://github.com/Northview-Church/production-website/settings/pages

1. Under **Build and deployment**, choose **GitHub Actions** as the source.
2. Merge the site setup into `main`. The Pages workflow deploys automatically. For a retry, use **Actions → Build and deploy GitHub Pages → Run workflow** on `main`.
3. Under **Custom domain**, save `www.nvprod.us` **before changing DNS**. With this Actions workflow, GitHub uses this setting, not a `CNAME` file.
4. Configure DNS as below, wait for GitHub's DNS check and certificate provisioning, then enable **Enforce HTTPS**.
5. Verify `https://www.nvprod.us`, the four section links, and a nonexistent URL to check the 404 page.

The GitHub-provided URL before a custom domain is configured is https://northview-church.github.io/production-website/.

## DNS for nvprod.us

The canonical domain is **www.nvprod.us**, configured in GitHub Pages. In Cloudflare, use this record:

| Type | Name | Value |
| --- | --- | --- |
| CNAME | www | northview-church.github.io |

Use **DNS only** so GitHub can validate and serve the domain directly. Do not include the repository name in the target. Enable **Enforce HTTPS** in Pages settings once the certificate is ready.

The apex `nvprod.us` is separate and is not required for this site. If it should redirect to `www`, point its A records to GitHub Pages (`185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`) and verify the redirect and certificate afterward. Leave unrelated records alone.

GitHub's instructions: [custom domains and DNS](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site), [Pages workflows](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages).

## Camera setup content

The camera-by-camera inventory supersedes the earlier camera total: six RED KOMODO-X bodies and one original RED KOMODO 6K. Cam 4's “KOMODO, X” is interpreted as KOMODO-X. Camera bodies are listed only in the seven camera setups, not duplicated in the Video equipment list.

Cam 2's Sigma 24–70mm f/2.8 version and mount are unspecified, so its listing stays general. The team explicitly confirmed one **Kessler Second Shooter Pro 2**; retain that supplied name and use the team-provided [Second Shooter product link](https://kesslercrane.com/pages/second-shooter-pro). Cinekinetic Cinesaddle size/model, Cyanview CY-RIO variant, and RED Pro I/O battery-mount variant are unspecified. Only list accessories on the cameras where the team supplied them.

## LED raster diagram

The team confirmed the following dimensions on 2026-09-24. Double panels are 128 × 256 px; single panels are 128 × 128 px.

| Wall | Installed panels | Pixels (width × height) |
| --- | --- | --- |
| Left IMAG | 33 double | 1,408 × 768 |
| Wall 1 | 9 double + 12 single | 640 × 768 |
| Wall 2 | 24 double | 768 × 1,024 |
| Center wall | 80 double | 2,560 × 1,024 |
| Wall 3 | 24 double | 768 × 1,024 |
| Wall 4 | 9 double + 12 single | 640 × 768 |
| Right IMAG | 33 double | 1,408 × 768 |

Walls 1 and 4 each have four front-facing columns and one column returning at 90°. The two columns meeting at each corner contain six single panels each. In the flattened raster, Wall 1's first two columns are singles with the corner between columns 1 and 2; Wall 4's last two columns are singles with the corner between columns 4 and 5. Other walls use double panels throughout.

Total inventory: **212 double + 24 single = 236 physical panels**, equivalent in pixel area to the earlier 224-double-panel layout. Total active pixels remain **7,340,032**. The diagram is a flattened raster with corner markers; wall spacing and vertical alignment are illustrative, not processor mapping positions. Keep the SVG, HTML table, and inventory count in sync when dimensions change.

## Search and AI crawler opt-out

`robots.txt` blocks crawling by default, including compliant AI crawlers. Googlebot and Bingbot are allowed to fetch pages so they can read the `noindex` meta tags on the homepage and 404 page. Google-Extended is explicitly disallowed separately from Google Search. Both pages also request `nofollow`, `noarchive`, `nosnippet`, and `noimageindex` where supported. Preserve the robots meta tag when adding pages, and ensure each new page is included in the build.

These are voluntary crawler directives, not access control. The website stays public, bots can ignore the rules, and existing search listings may take time to disappear. Blocking a search crawler before it reads `noindex` can leave a URL-only listing. GitHub Pages does not provide configurable response headers here, so these directives use HTML and the root `robots.txt` file.

See [Google's noindex guidance](https://developers.google.com/search/docs/crawling-indexing/block-indexing) and [robots.txt guidance](https://developers.google.com/search/docs/crawling-indexing/robots/intro).

## Design reference

The original reference remains in `design-system/index.html`, with its specification in `design-system/DESIGN-SYSTEM.md` and screenshot in `design-system/reference.png`. It is not included in the deployed site.

```sh
python3 -m http.server 8767 --bind 127.0.0.1 --directory design-system
```
