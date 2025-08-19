[ColorEffects:Disabled]
ChangeSelectionColor=true
Color=112,115,122
ColorAmount=0.5
ColorEffect=1
ContrastAmount=0.2
ContrastEffect=1
Enable=true
IntensityAmount=0.1
IntensityEffect=2

[ColorEffects:Inactive]
ChangeSelectionColor=true
Color=112,115,122
ColorAmount=0.3
ColorEffect=1
ContrastAmount=0.1
ContrastEffect=1
Enable=true
IntensityAmount=0.0
IntensityEffect=2

[Colors:Window]
BackgroundNormal={{colors.surface_container_low.default.hex}}
BackgroundAlternate={{colors.surface_container.default.hex}}
ForegroundNormal={{colors.on_surface.default.hex}}
ForegroundInactive={{colors.on_surface_variant.default.hex}}
ForegroundActive={{colors.primary.default.hex}}
ForegroundLink={{colors.primary.default.hex}}
ForegroundVisited={{colors.secondary_container.default.hex}}
ForegroundNegative={{colors.error.default.hex}}
ForegroundNeutral={{colors.outline.default.hex}}
ForegroundPositive={{colors.tertiary_container.default.hex}}
DecorationFocus={{colors.primary.default.hex}}
DecorationHover={{colors.primary_container.default.hex}}

[Colors:View]
BackgroundNormal={{colors.surface_container_low.default.hex}}
BackgroundAlternate={{colors.surface_container.default.hex}}
ForegroundNormal={{colors.on_surface.default.hex}}
ForegroundInactive={{colors.on_surface_variant.default.hex}}
ForegroundActive={{colors.primary.default.hex}}
ForegroundLink={{colors.primary.default.hex}}
ForegroundVisited={{colors.secondary_container.default.hex}}
ForegroundNegative={{colors.error.default.hex}}
ForegroundNeutral={{colors.outline.default.hex}}
ForegroundPositive={{colors.tertiary_container.default.hex}}
DecorationFocus={{colors.primary.default.hex}}
DecorationHover={{colors.primary_container.default.hex}}

[Colors:Button]
BackgroundNormal={{colors.primary_container.default.hex}}
BackgroundAlternate={{colors.surface_container.default.hex}}
ForegroundNormal={{colors.on_primary_container.default.hex}}
ForegroundInactive={{colors.on_surface_variant.default.hex}}
ForegroundActive={{colors.on_primary_container.default.hex}}
ForegroundLink={{colors.primary.default.hex}}
ForegroundVisited={{colors.secondary_container.default.hex}}
ForegroundNegative={{colors.error.default.hex}}
ForegroundNeutral={{colors.outline.default.hex}}
ForegroundPositive={{colors.tertiary_container.default.hex}}
DecorationFocus={{colors.primary.default.hex}}
DecorationHover={{colors.primary_container.default.hex}}

[Colors:Selection]
BackgroundNormal={{colors.primary.default.hex}}
BackgroundAlternate={{colors.primary_container.default.hex}}
ForegroundNormal={{colors.on_primary.default.hex}}
ForegroundInactive={{colors.on_primary_container.default.hex}}
ForegroundActive={{colors.on_primary.default.hex}}
ForegroundLink={{colors.on_primary.default.hex}}
ForegroundVisited={{colors.on_primary_container.default.hex}}
ForegroundNegative={{colors.error_container.default.hex}}
ForegroundNeutral={{colors.outline_variant.default.hex}}
ForegroundPositive={{colors.tertiary_container.default.hex}}
DecorationFocus={{colors.primary.default.hex}}
DecorationHover={{colors.primary_container.default.hex}}

[Colors:Tooltip]
BackgroundNormal={{colors.surface_container.default.hex}}
ForegroundNormal={{colors.on_surface_variant.default.hex}}
BackgroundAlternate[$d]
DecorationFocus[$d]
DecorationHover[$d]
ForegroundActive[$d]
ForegroundInactive[$d]
ForegroundLink[$d]
ForegroundNegative[$d]
ForegroundNeutral[$d]
ForegroundPositive[$d]
ForegroundVisited[$d]

[Colors:Complementary]
BackgroundNormal={{colors.surface_container_low.default.hex}}
BackgroundAlternate={{colors.surface_container.default.hex}}
ForegroundNormal={{colors.on_surface.default.hex}}
ForegroundInactive={{colors.on_surface_variant.default.hex}}
ForegroundActive={{colors.primary.default.hex}}
ForegroundLink={{colors.primary.default.hex}}
ForegroundVisited={{colors.secondary_container.default.hex}}
ForegroundNegative={{colors.error.default.hex}}
ForegroundNeutral={{colors.outline.default.hex}}
ForegroundPositive={{colors.tertiary_container.default.hex}}
DecorationFocus={{colors.primary.default.hex}}
DecorationHover={{colors.primary_container.default.hex}}

[Colors:Header]
BackgroundNormal={{colors.surface_container_low.default.hex}}
BackgroundAlternate={{colors.surface_container.default.hex}}
ForegroundNormal={{colors.on_surface.default.hex}}
ForegroundInactive={{colors.on_surface_variant.default.hex}}
ForegroundActive={{colors.primary.default.hex}}
ForegroundLink={{colors.primary.default.hex}}
ForegroundVisited={{colors.secondary_container.default.hex}}
ForegroundNegative={{colors.error.default.hex}}
ForegroundNeutral={{colors.outline.default.hex}}
ForegroundPositive={{colors.tertiary_container.default.hex}}
DecorationFocus={{colors.primary.default.hex}}
DecorationHover={{colors.primary_container.default.hex}}

[Colors:Header][Inactive]
BackgroundNormal={{colors.surface_container_low.default.hex}}
BackgroundAlternate={{colors.surface_container.default.hex}}
ForegroundNormal={{colors.on_surface_variant.default.hex}}
ForegroundInactive={{colors.on_surface_variant.default.hex}}
ForegroundActive={{colors.primary.default.hex}}
ForegroundLink={{colors.primary.default.hex}}
ForegroundVisited={{colors.secondary_container.default.hex}}
ForegroundNegative={{colors.error.default.hex}}
ForegroundNeutral={{colors.outline.default.hex}}
ForegroundPositive={{colors.tertiary_container.default.hex}}
DecorationFocus={{colors.primary.default.hex}}
DecorationHover={{colors.primary_container.default.hex}}

# --- WINDOW MANAGER COLORS ----------------------------------
# KDE expects R,G,B here; Matugen exposes channels.
[WM]
activeBackground={{ colors.surface.default.red }},{{ colors.surface.default.green }},{{ colors.surface.default.blue }}
activeForeground={{ colors.on_surface.default.red }},{{ colors.on_surface.default.green }},{{ colors.on_surface.default.blue }}
inactiveBackground={{ colors.surface_variant.default.red }},{{ colors.surface_variant.default.green }},{{ colors.surface_variant.default.blue }}
inactiveForeground={{ colors.on_surface_variant.default.red }},{{ colors.on_surface_variant.default.green }},{{ colors.on_surface_variant.default.blue }}
activeBlend={{ colors.primary.default.red }},{{ colors.primary.default.green }},{{ colors.primary.default.blue }}
inactiveBlend={{ colors.outline_variant.default.red }},{{ colors.outline_variant.default.green }},{{ colors.outline_variant.default.blue }}

[General]
ColorScheme=Matugen
font=Iosevka Nerd Font Propo,11,-1,5,50,0,0,0,0,0
fixed=Iosevka Nerd Font Mono,11,-1,5,50,0,0,0,0,0

[Icons]
Theme=Papirus-Dark

[KDE]
widgetStyle=Breeze
