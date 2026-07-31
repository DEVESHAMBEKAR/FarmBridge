---
name: AgriTech Premium
colors:
  surface: '#fcf9f8'
  surface-dim: '#dcd9d9'
  surface-bright: '#fcf9f8'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f6f3f2'
  surface-container: '#f0edec'
  surface-container-high: '#ebe7e7'
  surface-container-highest: '#e5e2e1'
  on-surface: '#1c1b1b'
  on-surface-variant: '#40493d'
  inverse-surface: '#313030'
  inverse-on-surface: '#f3f0ef'
  outline: '#707a6c'
  outline-variant: '#bfcaba'
  surface-tint: '#1b6d24'
  primary: '#0d631b'
  on-primary: '#ffffff'
  primary-container: '#2e7d32'
  on-primary-container: '#cbffc2'
  inverse-primary: '#88d982'
  secondary: '#3c6a00'
  on-secondary: '#ffffff'
  secondary-container: '#b8f47a'
  on-secondary-container: '#407100'
  tertiary: '#884200'
  on-tertiary: '#ffffff'
  tertiary-container: '#ad5600'
  on-tertiary-container: '#ffeee6'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#a3f69c'
  primary-fixed-dim: '#88d982'
  on-primary-fixed: '#002204'
  on-primary-fixed-variant: '#005312'
  secondary-fixed: '#b8f47a'
  secondary-fixed-dim: '#9dd761'
  on-secondary-fixed: '#0e2000'
  on-secondary-fixed-variant: '#2c5000'
  tertiary-fixed: '#ffdcc6'
  tertiary-fixed-dim: '#ffb786'
  on-tertiary-fixed: '#311300'
  on-tertiary-fixed-variant: '#723600'
  background: '#fcf9f8'
  on-background: '#1c1b1b'
  surface-variant: '#e5e2e1'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 48px
    fontWeight: '700'
    lineHeight: 56px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '600'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '600'
    lineHeight: 36px
  title-lg:
    fontFamily: Inter
    fontSize: 22px
    fontWeight: '500'
    lineHeight: 28px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 26px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.1px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  margin-mobile: 24px
  gutter: 16px
---

## Brand & Style

The design system is engineered for "FarmBridge," an AgriTech platform that bridges the gap between sophisticated data analytics and the grounded reality of rural farming. The personality is **Trustworthy, Minimal, and Modern**, aiming for an "Apple meets Material Design 3" aesthetic.

The style leverages **Modern Minimalism** with a focus on tactile clarity. It avoids unnecessary decoration, prioritizing high-legibility and ease of use for a diverse demographic, including elderly users and those in outdoor environments. The interface uses a "Layered Surface" approach—utilizing subtle tonal shifts and M3-inspired containers to create a clear information hierarchy that feels premium yet ruggedly functional.

## Colors

The palette is rooted in nature but refined for digital precision.

- **Primary (#2E7D32):** A deep, authoritative green used for key actions and brand presence. It ensures high contrast against light backgrounds for outdoor readability.
- **Accent (#7CB342):** A vibrant leaf green used for growth indicators, positive states, and secondary visual interest.
- **Surface Strategy:** In light mode, we use pure white backgrounds with subtle "Tonal Palettes" (Primary container at 10% opacity) to group related content. In dark mode, a deep slate (#1A1C1E) is used to reduce glare, with surfaces elevated through lighter grey-blue overlays rather than pure black.
- **Accessibility:** All color pairings must meet WCAG AA standards. Interactive elements use high-contrast foregrounds (e.g., White text on Deep Green) to remain visible under direct sunlight.

## Typography

This design system utilizes **Inter** for its exceptional legibility and systematic weight distribution. 

- **Scale:** Sizes are intentionally larger than standard web defaults to accommodate rural users and ensure clarity on mobile devices in high-glare environments.
- **Hierarchy:** We use weight (Medium/SemiBold) rather than color alone to differentiate labels from body text. 
- **Readability:** Body text never drops below 16px. Line heights are generous (1.5x) to prevent "crowding" of data in information-heavy analytics screens.

## Layout & Spacing

The system follows a strict **8-point grid**. 

- **Margins:** A standard 24px side margin is enforced on mobile to prevent accidental touches near the screen edges and provide a premium "breathable" feel.
- **Thumb-Zone Optimization:** Interactive elements are concentrated in the bottom two-thirds of the screen. 
- **Grid:** For tablet and desktop, a 12-column fluid grid is used. On mobile, a single-column stack is preferred for product and analytics cards to maximize image and data visibility.

## Elevation & Depth

We utilize the **Material 3 Tonal Elevation** model. Instead of heavy drop shadows, depth is communicated through surface color:

1.  **Level 0:** Main Background (Pure White or Deep Slate).
2.  **Level 1:** Cards and Sheets. In Light Mode, these use a subtle 2px blur shadow with 5% opacity. In Dark Mode, these are 5% lighter than the background.
3.  **Level 2:** Modals and Floating Action Buttons. These use a more distinct "Ambient Shadow" (12px blur, 10% opacity) to indicate they are temporary overlays.

Outlines are used sparingly (1px, 10% stroke) for "Outlined" button variants and input fields to maintain a clean, modern look.

## Shapes

The shape language is **friendly and modern**. 

- **Primary Radius:** 16px (`rounded-lg`) is the standard for all cards, dialogs, and large buttons. This creates a soft, approachable feel.
- **Small Elements:** Chips and small badges use a fully rounded "Pill" shape for distinct contrast against square-ish cards.
- **Visual Consistency:** Ensure that internal elements (like images inside cards) use a nested radius of 12px to maintain geometric harmony.

## Components

### Buttons
- **Filled:** Primary Green background, White text. Use for the "Final" action in a flow.
- **Tonal:** 10% Primary Green background, Primary Green text. Use for secondary actions.
- **Outlined:** 1px stroke in Neutral-300, Primary Green text. Use for tertiary/dismissive actions.
- **Min Height:** All buttons are 56px tall for easy thumb-tapping.

### Product & Farmer Cards
- **Product Cards:** Feature a 1:1 aspect ratio image at the top with 12px internal radius. Use a 16px padding for the text area. Action buttons (Quick Add) are placed at the bottom right.
- **Farmer Cards:** Circular avatar (48px) on the left, Title and Subtitle in the center, and a "Verified" badge using the Leaf Green accent.

### Analytics Cards
- Use a Tonal Green background for the header section to distinguish data sets. Large "Headline-LG" typography for primary metrics (e.g., "98% Yield").

### Navigation
- **Bottom Navigation:** Uses M3-style active state indicators (a pill-shaped highlight behind the icon). Labels are always visible to ensure clarity. 
- **Floating Action Button (FAB):** Large, 16px radius, Primary Green, placed at the bottom right for "Create" or "Scan" actions.

### Inputs
- **Filled Text Fields:** Light grey background with a 1px bottom-border that transforms into a 2px Primary Green border on focus. Large hit areas (56px height).