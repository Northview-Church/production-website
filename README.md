# Northview Production

A static conference gear guide for Northview Church, intended for **https://nvprod.us**. Audio, Video, LED, and Lighting have space for gear lists and high-level project budgets. Content is intentionally pending; no equipment or prices are represented as confirmed.

Plain HTML and CSS; no JavaScript, package installation, or framework required. The existing Northview design system supplies the branding and photography.

## Preview locally

Requires Python 3 and Bash:

```sh
bash scripts/build.sh
python3 -m http.server 8766 --bind 127.0.0.1 --directory _site
```

Open http://127.0.0.1:8766. Re-run the build after editing source files, then refresh.

## Files and content

- `index.html` — homepage and the four linked department sections. Replace the gear and project-budget placeholders here as content becomes available.
- `site.css` — site layout and responsive styles.
- `404.html` — missing-page response.
- `design-system/` — existing brand reference, shared CSS, and assets. The design-system examples are illustrative, not the conference gear inventory.
- `scripts/build.sh` — copies only public site files into `_site/`.
- `.github/workflows/pages.yml` — builds pull requests; deploys `main` through GitHub Pages.

For each department, collect gear model, purpose, quantity where useful, and manufacturer links. For project budgets, include scope, approximate cost or range, pricing date, and whether installation/tax are included. Leave unavailable prices explicitly pending.

The existing styles load Adobe Fonts with Google Fonts and system fallbacks. Confirm the Adobe kit permits `nvprod.us` before launch.

## Enable GitHub Pages

A repository admin must complete the initial setup at:
https://github.com/Northview-Church/production-website/settings/pages

1. Under **Build and deployment**, choose **GitHub Actions** as the source.
2. Merge the site setup into `main`. The Pages workflow deploys automatically. For a retry, use **Actions → Build and deploy GitHub Pages → Run workflow** on `main`.
3. Under **Custom domain**, save `nvprod.us` **before changing DNS**. With this Actions workflow, GitHub uses this setting, not a `CNAME` file.
4. Configure DNS as below, wait for GitHub's DNS check and certificate provisioning, then enable **Enforce HTTPS**.
5. Verify `https://nvprod.us`, the four section links, and a nonexistent URL to check the 404 page.

The GitHub-provided URL before a custom domain is configured is https://northview-church.github.io/production-website/.

## DNS for nvprod.us

Nameservers currently point to Cloudflare. At setup inspection on 2026-09-24, the public apex A record was `10.0.14.227` and `www` was a CNAME to `nvprod.us`. Confirm that changing these records will not interrupt an intended existing use.

After saving the domain in GitHub Pages, replace the apex A record with these GitHub Pages records. Leave unrelated mail and verification records alone.

| Type | Name | Value |
| --- | --- | --- |
| A | @ | 185.199.108.153 |
| A | @ | 185.199.109.153 |
| A | @ | 185.199.110.153 |
| A | @ | 185.199.111.153 |
| CNAME | www | northview-church.github.io |

Use **DNS only** in Cloudflare during setup so GitHub can validate the destination directly. The `www` record is optional if only the apex will be used. Do not include the repository name in its target. Remove conflicting web-hosting A/AAAA records for these names if present.

GitHub's instructions: [custom domains and DNS](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site), [Pages workflows](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages).

## Design reference

The original reference remains in `design-system/index.html`, with its specification in `design-system/DESIGN-SYSTEM.md` and screenshot in `design-system/reference.png`. It is not included in the deployed site.

```sh
python3 -m http.server 8767 --bind 127.0.0.1 --directory design-system
```
