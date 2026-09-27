# Northview Production

A static conference gear guide for Northview Church, intended for **https://www.nvprod.us**. Audio, Video, LED, Lighting, and Networking list the team-provided equipment, with manufacturer links where the products are identifiable. High-level project budgets are still pending.

Plain HTML and CSS; no JavaScript, package installation, or framework required. The existing Northview design system supplies the branding and photography.

## Preview locally

Requires Python 3 and Bash:

```sh
bash scripts/build.sh
python3 -m http.server 8766 --bind 127.0.0.1 --directory _site
```

Open http://127.0.0.1:8766. Re-run the build after editing source files, then refresh.

## Files and content

- `index.html` — homepage and the five linked department sections. Update the gear lists here and replace project-budget placeholders as pricing becomes available.
- `site.css` — site layout and responsive styles.
- `assets/led-raster.svg` — LED wall-size diagram; cells distinguish 128 × 256 px double panels from 128 × 128 px single corner panels. The wall-size table in `index.html` provides the same dimensions as text.
- `404.html` — missing-page response.
- `design-system/` — existing brand reference, shared CSS, and assets. The design-system examples are illustrative, not the conference gear inventory.
- `scripts/build.sh` — copies only public site files into `_site/`.
- `.github/workflows/pages.yml` — builds pull requests; deploys `main` through GitHub Pages.

For each department, collect gear model, purpose, quantity where useful, and manufacturer links. For project budgets, include scope, approximate cost or range, pricing date, and whether installation/tax are included. Leave unavailable prices explicitly pending.

Equipment quantities, installed configurations, and roles come from the production team. Product naming and links were checked against manufacturer sources on 2026-09-24. Product pages describe available capabilities, not necessarily the installed configuration. Official specifications or legacy documentation are linked when a suitable product page is unavailable. Fixture listings use the team-approved “style” wording where applicable, without links that imply they are original-brand products.

Details still to collect: the exact Acuity panel variant (two stripes alone does not distinguish 2X/2M and display variants), fixture manufacturers/model numbers and counts, and project pricing. Do not infer missing quantities or price the installed projects from retail component listings.

The existing styles load Adobe Fonts with Google Fonts and system fallbacks. Confirm the Adobe kit permits `www.nvprod.us` before launch.

## Enable GitHub Pages

A repository admin must complete the initial setup at:
https://github.com/Northview-Church/production-website/settings/pages

1. Under **Build and deployment**, choose **GitHub Actions** as the source.
2. Merge the site setup into `main`. The Pages workflow deploys automatically. For a retry, use **Actions → Build and deploy GitHub Pages → Run workflow** on `main`.
3. Under **Custom domain**, save `www.nvprod.us` **before changing DNS**. With this Actions workflow, GitHub uses this setting, not a `CNAME` file.
4. Configure DNS as below, wait for GitHub's DNS check and certificate provisioning, then enable **Enforce HTTPS**.
5. Verify `https://www.nvprod.us`, the five section links, and a nonexistent URL to check the 404 page.

The GitHub-provided URL before a custom domain is configured is https://northview-church.github.io/production-website/.

## DNS for nvprod.us

The canonical domain is **www.nvprod.us**, configured in GitHub Pages. In Cloudflare, use this record:

| Type | Name | Value |
| --- | --- | --- |
| CNAME | www | northview-church.github.io |

Use **DNS only** so GitHub can validate and serve the domain directly. Do not include the repository name in the target. Enable **Enforce HTTPS** in Pages settings once the certificate is ready.

The apex `nvprod.us` is separate and is not required for this site. If it should redirect to `www`, point its A records to GitHub Pages (`185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`) and verify the redirect and certificate afterward. Leave unrelated records alone.

GitHub's instructions: [custom domains and DNS](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site), [Pages workflows](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages).

## Project budgets

Team-provided project figures: camera integrator project **$325,000**, including cameras, lenses, and Cyanview; factory-direct LED panels **$81,000** plus processing **$7,000**, totaling **$88,000**, with a separate integrator quote of **$1,000,000**; lighting fixtures **$27,000**, purchased directly. The integrator quote is not added to the factory-direct total. These are team-provided figures, not current manufacturer quotes. The camera figure does not state the cost of the entire Video system. Audio pricing is pending.

## Audio content notes

Audio quantities distinguish loudspeakers and keyboards from wireless/preamp channels. The 20 M’elodie main-array speakers (10 per side) exclude front fills, whose quantity is unspecified. UPM-1P fill quantity is also unspecified. UPQ is listed as three outfills without a model suffix. The team confirmed two Rio3224-D2 and one Rio1608-D2 stage boxes. The AD2, ADX2FD, and ADX1 transmitter details confirm Axient Digital.

Pending clarification from the team: whether “Meyer HP 6 subs 700s” means six 700-HP subwoofers; the truncated “Floor pocket powe” line. Until confirmed, the page uses a general Meyer subwoofer name and omits the incomplete floor-pocket item.

The microphone/input cards record source assignments, not inventory quantities. No tom/overhead or wireless-mic counts, capsule colors, headset connectors, Warm Audio WA-DI active/passive variant, guitar processor models, or Ableton version are inferred. DVS means Dante Virtual Soundcard. Preserve the supplied SM7B hi-hat assignment.

## Camera setup content

The camera-by-camera inventory supersedes the earlier camera total: six RED KOMODO-X bodies and one original RED KOMODO 6K. Cam 4's “KOMODO, X” is interpreted as KOMODO-X. Camera bodies are listed only in the seven camera setups, not duplicated in the Video equipment list.

Cam 2's Sigma 24–70mm f/2.8 version and mount are unspecified, so its listing stays general. The team explicitly confirmed one **Kessler Second Shooter Pro 2**; retain that supplied name and use the team-provided [Second Shooter product link](https://kesslercrane.com/pages/second-shooter-pro). Cinekinetic Cinesaddle size/model and RED Pro I/O battery-mount variant are unspecified. The team supplied the RIO Live product link for the Cyanview camera interfaces; the shared Cyanview RCP is listed for shading without an unconfirmed quantity. Only list accessories on the cameras where the team supplied them.

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

## In-house purchase comparisons

LED: the team confirmed that the $1,000,000 integrator quote was for comparable scale and scope. Against the reported $88,000 panels/processing purchase, the difference is $912,000 (91.2%). Other in-house costs have not been itemized, so this is a purchase-cost comparison rather than a fully costed net-project saving.

Lighting: 36 K20-style washes, 26 Aura-style washes, 28 two-cell blinders, and 32 Atomic-style strobes (122 fixtures), purchased for $27,000. The September 26, 2026 retail benchmark uses Claypaky A.leda B-EYE K20 at $8,396 (B&H), Martin MAC Aura XB at $4,599 (NewLighting), CHAUVET STRIKE Array 2 at $1,318 (AVL Supply), and Martin Atomic 3000 LED at $4,626 (Sweetwater). Source links were researched for the original breakdown; the public breakdown was later removed at the team’s request. Total $606,766; difference $579,766 (95.6%). The selected models are comparison references, not verified exact equivalents. This is an equipment estimate, not an integrator quote; no labor or integrator markup is invented. Taxes, shipping, installation, console, rigging, and volume discounts are excluded from the benchmark.

## Camera retail comparison

The team requested a hypothetical retail-purchase comparison against its $325,000 integrator camera project. Training was included; the team reports it already had the relevant skills in house. The project predates its direct-purchasing approach. Four Cyanview RCPs are confirmed; the team states there is no separate licensing cost on its installed equipment. The purchase year remains unspecified.

The September 26, 2026 price research underpins the comparison; detailed source links were removed from the public page at the team’s request. Bodies and six Canon lenses subtotal $76,555. Remaining priced accessories including the Sigma lens and a Second Shooter PRO starter bundle add $63,635.98 in the lower scenario. The user selected the lower scenario, using four Teradek Ranger Mk II 750-foot V-Mount TX/RX kits at $9,390 each. This is a pricing assumption, not confirmation of the installed kit variant. Dealer pricing may reduce the estimate further, but no unverified dealer discount is applied. The reference Sigma lens is the EF DG OS HSM Art; the CineSaddle reference is Original Australian Series 2; the Shuttle Dolly reference is the base kit without rails. The inventory retains the user's Second Shooter Pro 2 name while its pricing comparison identifies the current PRO starter bundle.

For Cyanview, Mediatec's complete RCP unlimited units are €4,600 each and RIO LAN (the successor name for RIO Live) units are €1,320 each. Four RCPs and five RIOs total €25,000, converted to $28,507.50 at the ECB September 25, 2026 reference rate of $1.1403 per euro. No separate license line is added. This is a European retail benchmark, not a US dealer quote; tax, freight, duties and transaction fees are not included. Sources:
- https://www.mediatec.de/cyanview-rcp-remote-control-panel-unlimited-cy-rcp-msu/
- https://www.mediatec.de/cyanview-rio-remote-control-io-panel-2-nur-lan-cy-rio-lan/
- https://www.ecb.europa.eu/stats/policy_and_exchange_rates/euro_reference_exchange_rates/html/index.cs.html

Selected scenario total: $168,698.48. Difference from $325,000: $156,301.52 (48.1%). Public headline rounds to about $169k equipment and $156k potential difference (48%), explicitly not realized. This is not a complete net-project savings estimate: excludes unlisted equipment, batteries, media, adapters, cabling, tally hardware, rails, tax, freight/duties and services. Do not present the difference as an integrator markup or as money definitely avoidable at the original purchase date.

RED's historical price changes must remain visible: KOMODO-X launched May 16, 2023 at $9,995 (https://www.reddigitalcinema.com/news/komodo-x-launch); September 3, 2024 prices became $6,995 X / $4,995 original (https://www.reddigitalcinema.com/stories/komodo-systems-new-prices); original KOMODO dropped to $2,995 March 26, 2025 (https://www.reddigitalcinema.com/stories/komodo-price-drop). Today's prices may differ from those available when the project was purchased.

## Public comparison framing

Use “integrator” for the company sourcing and installing church AV gear. Public budget cards emphasize purchasing options and in-house work, with concise scope notes. The user requested removal of the expandable estimate breakdowns and vendor-specific pricing examples; retain research here for provenance without publishing those breakdowns. Do not describe the lighting retail benchmark as an integrator quote or the camera potential savings as realized.

The team confirmed the Neve input system as the 1073OPX, with 16 input channels total and Dante connectivity. Use the supplied manufacturer URL: https://www.ams-neve.com/outboard/1073-range/1073opx/ .

## Networking inventory

The team-provided UniFi inventory screenshots identify 17 devices: one UDM-Pro-Max, one USW-Pro-Aggregation, ten USW-Pro-Max-24 switches, three USW-Pro-Max-48 switches, one USP-RPS, and one U7 Pro XGS. The ten 24-port rows are Broadcast Audio, Stage Lighting, FOH Audio, Stage Keys, Video Desk, Atrium, Stage Racks, Video Rack 4, FOH Lighting 24, and Stage Drums. The three 48-port rows are FOH Lighting 48, Catwalk, and Video Rack 3. Switch PoE variants are not shown; do not infer them. The public section aggregates model quantities and high-level roles. No networking project budget has been supplied.

Manufacturer names and links checked September 27, 2026. Ubiquiti currently names USW-Pro-Aggregation “Hi-Capacity Aggregation”; retain the SKU for recognition. USP-RPS is a redundant power system, not a UPS. Source screenshots and detailed uplink/port topology are not site assets.
