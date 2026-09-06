varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_bloomIntensity;      // 0.0 - 1.0 (önerilen: 0.3)
uniform float u_vignetteIntensity;   // 0.0 - 1.0 (önerilen: 0.5)
uniform vec3 u_colorTint;            // RGB (sarı için: 1.0, 0.9, 0.6)
uniform float u_tintStrength;        // 0.0 - 1.0 (önerilen: 0.4)
uniform float u_contrast;            // 0.5 - 2.0 (önerilen: 1.15)
uniform float u_saturation;          // 0.0 - 2.0 (önerilen: 0.85)
uniform float u_grain;               // 0.0 - 1.0 (önerilen: 0.08)
uniform float u_time;                // Grain animasyonu için

// Basit hash fonksiyonu (grain için)
float hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

// Renk doygunluğu ayarlama
vec3 adjustSaturation(vec3 color, float sat) {
    float luminance = dot(color, vec3(0.299, 0.587, 0.114));
    return mix(vec3(luminance), color, sat);
}

// Kontrast ayarlama
vec3 adjustContrast(vec3 color, float contrast) {
    return clamp((color - 0.5) * contrast + 0.5, 0.0, 1.0);
}

// Vignette efekti
float vignette(vec2 uv, float intensity) {
    vec2 centered = uv * 2.0 - 1.0;
    float dist = length(centered);
    float vig = smoothstep(0.7, 0.4, dist);
    return mix(1.0, vig, intensity);
}

// Basit bloom approximation
vec3 bloomEffect(sampler2D tex, vec2 uv, float intensity) {
    vec3 bloom = vec3(0.0);
    float weight = 0.0;
    
    // 9-tap blur
    for(float x = -1.0; x <= 1.0; x += 1.0) {
        for(float y = -1.0; y <= 1.0; y += 1.0) {
            vec2 offset = vec2(x, y) * 0.003; // Blur miktarı
            vec3 sample = texture2D(tex, uv + offset).rgb;
            
            // Sadece parlak alanları bloom'a dahil et
            float brightness = max(sample.r, max(sample.g, sample.b));
            float bloomMask = max(0.0, brightness - 0.6) * 2.0;
            
            bloom += sample * bloomMask;
            weight += bloomMask;
        }
    }
    
    if(weight > 0.0) {
        bloom /= weight;
    }
    
    return bloom * intensity;
}

void main() {
    vec2 uv = v_vTexcoord;
    
    // Orijinal renk
    vec4 color = texture2D(gm_BaseTexture, uv);
    vec3 finalColor = color.rgb;
    
    // 1. Bloom efekti (2008 oyunlarında abartılı bloom vardı)
    vec3 bloom = bloomEffect(gm_BaseTexture, uv, u_bloomIntensity);
    finalColor += bloom;
    
    // 2. Renk tonu (sarımsı/sıcak ton)
    finalColor = mix(finalColor, finalColor * u_colorTint, u_tintStrength);
    
    // 3. Kontrast ve doygunluk ayarı
    finalColor = adjustContrast(finalColor, u_contrast);
    finalColor = adjustSaturation(finalColor, u_saturation);
    
    // 4. Vignette efekti
    float vig = vignette(uv, u_vignetteIntensity);
    finalColor *= vig;
    
    // 5. Film grain (eski görünüm için)
    vec2 grainUV = uv * 100.0 + u_time;
    float grainValue = hash(grainUV);
    finalColor += (grainValue - 0.5) * u_grain;
    
    // 6. Hafif renk bantları (2008 color banding)
    finalColor = floor(finalColor * 128.0) / 128.0;
    
    gl_FragColor = vec4(finalColor, color.a) * v_vColour;
}