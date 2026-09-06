//
// Fragment Shader - shd_color_filter (OPTIMIZE + Kontrast/Doygunluk)
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_colorTint;       // RGB renk filtresi
uniform float u_tintStrength;   // Filtre gücü (0.0 - 1.0)
uniform float u_contrast;       // Kontrast (0.5 - 2.0, varsayılan: 1.0)
uniform float u_saturation;     // Doygunluk (0.0 - 2.0, varsayılan: 1.0)

// Renk doygunluğu ayarlama
vec3 adjustSaturation(vec3 color, float sat) {
    float luminance = dot(color, vec3(0.299, 0.587, 0.114));
    return mix(vec3(luminance), color, sat);
}

// Kontrast ayarlama
vec3 adjustContrast(vec3 color, float contrast) {
    return clamp((color - 0.5) * contrast + 0.5, 0.0, 1.0);
}

void main() {
    // Orijinal rengi al
    vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
    vec3 finalColor = color.rgb;
    
    // 1. Renk filtresini uygula
    vec3 tinted = finalColor * u_colorTint;
    finalColor = mix(finalColor, tinted, u_tintStrength);
    
    // 2. Kontrast ayarla
    finalColor = adjustContrast(finalColor, u_contrast);
    
    // 3. Doygunluk ayarla
    finalColor = adjustSaturation(finalColor, u_saturation);
    
    gl_FragColor = vec4(finalColor, color.a) * v_vColour;
}