resource "kubernetes_config_map_v1" "nginx-config" {
  metadata {
    name = "nginx-config"
  }

  data = {
    "index.html" = <<-EOT
        |
    <html>
    <h1 style="background-color:DodgerBlue; "color:Tomato;">Welcome to Arsenal Declan Rice</h1>
    <p style="background-color:DarkGoldenRod; "color:MintCream;">The Only Premier League Club to Go Invincible</p>
    <h3 style="background-color:Gold; "color:Navy;">With You, We Can Go The Distance</h3>
    </html>
      EOT
  }
}
