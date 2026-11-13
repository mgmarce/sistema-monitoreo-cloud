
#!/bin/bash
set -euo pipefail

# Instalacion de Node Exporter en VM-MONITOREADA
# Ubuntu Server 22.04

if [ "$EUID" -ne 0 ]; then
    echo "Ejecuta este script con sudo."
    exit 1
fi

echo "Actualizando paquetes..."
apt-get update

echo "Instalando Node Exporter..."
apt-get install -y prometheus-node-exporter

echo "Habilitando Node Exporter..."
systemctl enable prometheus-node-exporter
systemctl restart prometheus-node-exporter

echo "Verificando servicio..."
systemctl status prometheus-node-exporter --no-pager

echo "Node Exporter instalado correctamente."
echo "Puerto de metricas: 9100"
