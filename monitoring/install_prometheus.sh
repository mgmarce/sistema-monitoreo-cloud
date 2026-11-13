
#!/bin/bash
set -euo pipefail

# Instalacion de Prometheus en VM-MONITOREO
# Ubuntu Server 22.04

if [ "$EUID" -ne 0 ]; then
    echo "Ejecuta este script con sudo."
    exit 1
fi

echo "Actualizando paquetes..."
apt-get update

echo "Instalando Prometheus..."
apt-get install -y prometheus

echo "Configurando objetivos de monitoreo..."
cat > /etc/prometheus/prometheus.yml <<'EOF'
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'VM-MONITOREADA'
    static_configs:
      - targets: ['IP_PRIVADA_VM_MONITOREADA:9100']
EOF

echo "Validando configuracion..."
promtool check config /etc/prometheus/prometheus.yml

echo "Habilitando Prometheus..."
systemctl enable prometheus
systemctl restart prometheus

echo "Estado del servicio:"
systemctl status prometheus --no-pager

echo "Instalacion de Prometheus finalizada."
