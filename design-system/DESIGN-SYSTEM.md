# Northview Production — design system

Version 0.2 · 2026-09-24 · dark by default

A design system for the Northview Production department website. It is built on the Northview Church web brand at northviewchurch.us so the site reads as part of the family, then adds what a production team needs: a dark base that matches the room, and a live state.

Files:

| File | Purpose |
|---|---|
| `tokens.css` | Custom properties and base element styles. Load first. |
| `components.css` | Component classes. Requires `tokens.css`. |
| `index.html` | Living reference. Open in a browser to see every token and component rendered. |
| `assets/logos/` | Northview logo SVGs pulled from the church site. |
| `assets/patterns/topo.svg` | Northview's topo contour background. |
| `assets/photos/` | Approved photography. |

## 1. Principles

1. **Northview first, production second.** Every element starts from the church site: its fonts, its square buttons, its topo lines, its diagonal slab. We change the base to dark and add a live state. We do not invent a second brand.
2. **The room is the palette.** The base is a blue-black that matches an auditorium lit for a service. Photography is shot from where the team stands.
3. **Red means on air.** Tally red is used for the live state only. Never for errors, buttons, or emphasis.
4. **One bold thing per screen.** The offset-frame button, the display headline, or a featured photo. Everything else stays quiet.
5. **Structure carries meaning.** A colored card edge, a chip that turns amber, a left border on a slot. Decoration that does not say something gets cut.

## 2. Color

### Surfaces

| Token | Hex | Use |
|---|---|---|
| `--nv-black` | `#171a21` | Page base |
| `--nv-ink` | `#10131a` | Recessed sections, inputs, footer, photo washes |
| `--nv-surface` | `#1e222b` | Cards, tiles, slots, chips |
| `--nv-raised` | `#2a2f3a` | Raised elements, default card bottom border |
| `--nv-line` | `#3a404d` | Borders and dividers |

The ramp is tinted toward Northview navy `#00112b`. Each step is one tone apart, so hierarchy holds without drop shadows. There are no shadows in this system.

### Text

| Token | Hex | Use |
|---|---|---|
| `--nv-text` | `#f3f3f3` | Headings, emphasis, button labels |
| `--nv-text-2` | `#d3d3d3` | Body copy |
| `--nv-text-3` | `#9aa0ac` | Meta, counts, placeholders |

`#f3f3f3` and `#d3d3d3` are Northview's own lightest and light greys.

### Accents

| Token | Hex | Use |
|---|---|---|
| `--nv-cyan` | `#53daec` | Primary action, active nav, focus ring, accented word in display type |
| `--nv-teal` | `#4bbdb9` | Secondary. Rare. Data series if ever needed |
| `--nv-blue` | `#3d5ba8` | The logo mark. Nothing else |
| `--nv-navy` | `#00112b` | Wordmark on light backgrounds. Never a surface |

Cyan is Northview's `--color-primary`. It already carries their focus states and primary buttons, so it is the natural action color here.

### State

| Token | Hex | Use |
|---|---|---|
| `--nv-tally` | `#ff3b30` | Live, on air. Only this |
| `--nv-warn` | `#f0ad4e` | Open slot, pending confirmation |
| `--nv-error` | `#d9534f` | Form errors, failed actions. Northview's danger red |
| `--nv-success` | `#5cb85c` | Saved, sent. Northview's success green |

Tally and error are both red. That is deliberate: they must never appear in the same component. Live belongs on status pills, card edges, and the viewfinder. Error belongs on fields and toasts.

### Contrast

Body text `#d3d3d3` on `#171a21` is about 12:1. Muted text `#9aa0ac` on `#1e222b` is about 5.6:1. Cyan on the base is about 10:1. Black text on cyan buttons is about 12:1. All pass WCAG AA for normal text.

## 3. Typography

Family: **FF Good Web Pro** and **FF Good Web Pro Condensed** via Northview's Typekit kit `qqn7fdp`. The kit loads on localhost; confirm it is allowed on the production domain. Fallback: Barlow and Barlow Condensed from Google Fonts.

| Role | Class or element | Face | Size / line | Case | Tracking |
|---|---|---|---|---|---|
| Display | `.display` | Condensed 700 | 112 / 1 | Upper | -0.005em |
| H1 | `h1` | Condensed 700 | 88 / 1 | Upper | -0.005em |
| H2 | `h2` | Condensed 700 | 64 / 1 | Upper | 0 |
| H3 | `h3` | Condensed 700 | 34 / 1.05 | Sentence | 0 |
| H4 | `h4` | Condensed 700 | 22 / 1 | Sentence | 0 |
| Nav | `.nav` | Condensed 700 | 21 | Sentence | +0.5px |
| Button | `.btn` | Condensed 700 | 16 / 1.1 | Upper | +0.8px |
| Label | `.label` | Condensed 700 | 15 | Upper | +2.67px |
| Body | `p` | Good 400 | 17 / 1.5 | Sentence | 0 |
| Small | inline | Good 400 | 15 | | |
| Meta | `.meta` | Good 400 italic | 14 | | |
| Timecode | `.timecode` | Condensed 400 | 15 | Upper | +1.5px, tabular |

Mobile: display 64, h1 56, h2 44, h3 28.

Rules:
- Body copy sits on `--nv-text-2`. `--nv-text` is for headings and `<strong>`.
- Line length caps at 62ch.
- The display line may accent one word in cyan, and that word is the noun the page is about. Nowhere else.
- Labels are the only tracked-out uppercase text. Use them for column heads and footer groups, not above every heading.

## 4. Spacing and shape

12px base, matching Northview's `--s1` to `--s16` scale.

| Token | px | Use |
|---|---|---|
| `--s1` | 12 | Inline gaps, label to control |
| `--s2` | 24 | Card padding, grid gaps |
| `--s3` | 36 | Page gutters |
| `--s4` | 48 | Heading to content |
| `--s6` | 72 | Section padding, mobile |
| `--s8` | 96 | Hero padding |
| `--s10` | 120 | Section padding, desktop |

Shape:
- `--radius: 0` on buttons, chips, pills, status. Square, as on the church site.
- `--radius-card: 6px` on cards, tiles, slots, viewfinder, band.
- Inputs use 2px, matching Northview's `--input-border-radius`.
- `--offset: 7px` for the offset-frame button, matching Northview's `--button-offset`.

Content width 1240px. Gutter 36px desktop, 20px mobile. Breakpoint 760px.

## 5. Components

### Buttons `.btn`

| Variant | Class | When |
|---|---|---|
| Offset frame | `.btn--offset` | The hero action. One per screen |
| Offset on cyan | `.btn--offset.on-cyan` | Same, on a photo band |
| Cyan | `.btn--cyan` | Primary in-page action |
| Solid | `.btn--solid` | Primary on a dark photo |
| Outline | `.btn` | Secondary |
| Ghost | `.btn--ghost` | Tertiary, header utilities |
| Text | `.btn--text` | Inline links that act |
| Small | `.btn--small` | Inside slots and table rows |

Every button ends with `<i class="arr"></i>`. On hover the arrow grows from 22px to 34px over 300ms. That is the only hover motion in the system.

Labels are verbs that say what happens: "Join a team", "Take it", "Send it". Not "Submit".

### Status `.status`

| Class | Meaning |
|---|---|
| `.status--live` | On air. Red border, glowing dot |
| `.status--standby` | Pending, waiting |
| `.status--ok` | Confirmed, ready |
| `.status` | Off, inactive |
| `.status--error` | Failed |

### Chips and pills

- `.chip` shows a count: `Audio <b>4/4</b>`. Add `.chip--need` when short.
- `.pill` is a filter toggle. Set `aria-pressed="true"` when on.

### Cards

- `.card` with `.card__media`, `.card__body`, `.card__kicker`, `.card__title`, `.card__meta`.
- `.card--accent` cyan edge for featured. `.card--live` red edge for a service in progress.
- `.tile` for a team: icon, name, one line, count.
- `.slot` for a position in a service. `.slot--mine` cyan edge, `.slot--open` amber edge and tint.

The bottom or left edge is the only place a card takes color.

### Photography

- `.viewfinder` for one featured photo. Adds the frame, corner marks, and overlay positions `__tl`, `__tr`, `__br`.
- `.band` for a photo behind a call to action, with `.band__wash` and `.band__in`.

Shoot from where the team stands. Rooms lit for a service. No posed people. No grading; the rig is already cool.

### Forms and tables

- `.field` wraps label, control, and `.field__help`. `.field--error` turns the border and help text red. Help text says what to do.
- `.table` with uppercase condensed column heads. `tr.is-open` tints a row that needs someone.

### Header and footer

- `.hdr` with `.brand` and `.nav`. Mark `aria-current="page"` on the active link; it turns cyan with an underline.
- `.ftr` on `--nv-ink` with `.ftr__cols` and `.ftr__legal`.

## 6. Layout devices

- `.section` and `.section--recessed` alternate down the page.
- `.topo` adds the Northview contour pattern, inverted at 6%. At most two per page.
- `.slab` is the diagonal recessed panel with a cyan edge. Hero only.

## 7. Logo

- Use `northview-logo-horizontal-white-blue.svg` on dark.
- Use `northview-logo-horizontal-navy.svg` on light only.
- The Production lockup is the white mark plus "NORTHVIEW" in FF Good Condensed 700 at 26px and "PRODUCTION" at 13px, 3px tracking, cyan. It is typeset with `.brand`, not a separate file.
- Mark at least 28px tall. Do not recolor the mark.

## 8. Motion and accessibility

- Transitions are 300ms ease-in-out, Northview's timing. Only arrows and card lift animate.
- `prefers-reduced-motion` disables all of it.
- Focus is the Northview cyan ring: `0 0 0 3px rgba(83,218,236,.6)`.
- All interactive elements are at least 44px tall.

## 9. Voice

Plain verbs, sentence case, no filler. Write from the volunteer's side: "your shifts", "open slots", "take it". Name things by what they are in the room: FOH, broadcast, Cam 2, ProPresenter. Errors say what went wrong and what to do. Empty states invite an action.

## 10. Source

Everything here was measured from northviewchurch.us on 2026-09-24: computed styles, the `:root` custom properties of theme NVC2021 (`/Themes/NVC2021/Styles/theme.css`), the Typekit kit `qqn7fdp`, and the inline logo SVGs. The topo pattern is `/Themes/NVC2021/Assets/_img/topo_bg.svg` on the church site.
