varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// GameMaker'dan göndereceğimiz değişkenler
uniform vec4 u_tablet_rect;  // Tabletin konumu (x, y, genislik, yukseklik) - UV formatında (0.0 - 1.0 arası)
uniform float u_glow_radius; // Işığın ne kadar uzağa taşacağı (Örn: 0.2)
uniform float u_darkness;    // Arka planın karanlık seviyesi (0.0 zifiri karanlık, 1.0 normal)
uniform vec3 u_glow_color;   // Taşan ışığın rengi (Örn: Sarımsı bir renk için 1.0, 1.0, 0.8)
uniform float u_aspect;      // Ekranın en/boy oranı (ışığın elips değil yuvarlak yayılması için)

void main()
{
    // Orijinal piksel rengini al
    vec4 base_color = texture2D(gm_BaseTexture, v_vTexcoord);
    
    // En/Boy oranı düzeltmesi (Işığın kusursuz yayılması için)
    vec2 pos = v_vTexcoord;
    pos.x *= u_aspect;
    
    // Tabletin merkezini ve yarı boyutlarını hesapla
    vec2 center = vec2(u_tablet_rect.x + (u_tablet_rect.z * 0.5), u_tablet_rect.y + (u_tablet_rect.w * 0.5));
    center.x *= u_aspect;
    
    vec2 half_size = vec2(u_tablet_rect.z * 0.5, u_tablet_rect.w * 0.5);
    half_size.x *= u_aspect;
    
    // SDF (Signed Distance Field) - Mevcut pikselin tablete olan uzaklığı
    vec2 d = abs(pos - center) - half_size;
    float dist = length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
    
    // Renk hesaplama mantığı
    if (dist <= 0.0) {
        // PİKSEL TABLETİN İÇİNDE: Rengi normal (veya çok hafif daha parlak) çiz
        gl_FragColor = v_vColour * base_color; 
    } 
    else {
        // PİKSEL TABLETİN DIŞINDA: Parlama ve kararma efekti
        
        // Uzaklığa göre parlama şiddetini hesapla (1.0 = tablet sınırı, 0.0 = ışığın bittiği yer)
        float glow_intensity = 1.0 - clamp(dist / u_glow_radius, 0.0, 1.0);
        
        // Işığın yumuşakça sönümlenmesi için smoothstep
        glow_intensity = smoothstep(0.0, 1.0, glow_intensity);
        
        // Arka planı karart
        vec3 darkened_bg = base_color.rgb * u_darkness;
        
        // Karartılmış arka planın üzerine tablet ışığını ekle
        vec3 final_color = mix(darkened_bg, u_glow_color, glow_intensity * 0.4);
        
        // Ekstra: Sızan ışığın içinde arka planın detayları hafifçe görünsün
        final_color += (base_color.rgb * glow_intensity * 0.3);
        
        gl_FragColor = v_vColour * vec4(final_color, base_color.a);
    }
}