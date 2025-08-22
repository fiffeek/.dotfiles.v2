progress-color=source {{ colors.secondary.default.hex }}CC
background-color={{ colors.secondary_container.default.hex }}CC
text-color={{ colors.on_secondary_container.default.hex }}
border-color={{ colors.outline_variant.default.hex }}

[urgency=low]
progress-color=source {{ colors.surface_container_low.default.hex }}CC
background-color={{ colors.surface_container_high.default.hex }}CC
text-color={{ colors.on_surface.default.hex }}
border-color={{ colors.outline.default.hex }}

[urgency=normal]
background-color={{ colors.secondary_container.default.hex }}CC
text-color={{ colors.on_secondary_container.default.hex }}
border-color={{ colors.outline_variant.default.hex }}

[urgency=high]
background-color={{ colors.error_container.default.hex }}CC
text-color={{ colors.on_error_container.default.hex }}
border-color={{ colors.error.default.hex }}
