# Sistema de Monitoreo de Recursos Cloud con Grafana

Repositorio correspondiente al proyecto **Sistema de Monitoreo de Recursos Cloud con Grafana**, desarrollado como solución de monitoreo de infraestructura en la nube mediante herramientas de código abierto.

## Fase actual

**Fase 2 – Implementación**

Durante esta fase se implementó una infraestructura de monitoreo utilizando máquinas virtuales en Microsoft Azure, Prometheus para la recopilación de métricas, Node Exporter para la exposición de métricas del sistema operativo y Grafana para su visualización.

El sistema permite supervisar el comportamiento y el consumo de recursos de las máquinas virtuales mediante un dashboard centralizado.

## Objetivo general

Implementar un sistema de monitoreo de recursos cloud que permita recopilar, almacenar y visualizar métricas de infraestructura mediante Prometheus, Node Exporter y Grafana.

## Arquitectura implementada

La solución está compuesta por dos máquinas virtuales con Ubuntu Server 22.04 desplegadas en Microsoft Azure.

| Componente | Función |
|---|---|
| VM-MONITOREO | Servidor central que aloja Prometheus y Grafana. |
| VM-MONITOREADA | Servidor cuyos recursos son supervisados mediante Node Exporter. |

### Flujo de monitoreo

1. Node Exporter recopila y expone métricas del sistema operativo.
2. Prometheus consulta periódicamente el endpoint de Node Exporter.
3. Prometheus almacena las métricas recopiladas.
4. Grafana utiliza Prometheus como fuente de datos para visualizar los indicadores.

**Puerto de Node Exporter:** TCP 9100.  
**Intervalo de recopilación:** 15 segundos.

> Por seguridad, las direcciones IP reales de las máquinas virtuales no se incluyen en este repositorio.

## Tecnologías utilizadas

- **Microsoft Azure:** infraestructura de máquinas virtuales.
- **Ubuntu Server 22.04:** sistema operativo.
- **Prometheus:** recopilación y almacenamiento de métricas.
- **Node Exporter:** exposición de métricas del sistema operativo.
- **Grafana:** visualización de métricas mediante dashboards.
- **Git y GitHub:** control de versiones y almacenamiento del código fuente.

## Dashboard de Grafana

El dashboard implementado contiene los siguientes paneles:

| Panel | Descripción |
|---|---|
| Uso de CPU | Visualización del consumo del procesador. |
| Uso de RAM | Visualización del consumo de memoria. |
| Uso de disco | Porcentaje de espacio utilizado en la partición raíz (`/`). |
| Disponibilidad | Estado del objetivo monitoreado mediante Prometheus. |

### Consultas PromQL

**Disponibilidad de VM-MONITOREADA**

```promql
up{job="VM-MONITOREADA"}
```

Un valor de `1` indica que Prometheus puede recopilar métricas del objetivo. Un valor de `0` indica que no puede recopilar métricas de dicho objetivo.

**Uso de disco**

```promql
100 * (
  1 -
  (
    node_filesystem_avail_bytes{
      instance="<IP_PRIVADA_VM_MONITOREADA>:9100",
      mountpoint="/",
      fstype!~"tmpfs|overlay|squashfs"
    }
    /
    node_filesystem_size_bytes{
      instance="<IP_PRIVADA_VM_MONITOREADA>:9100",
      mountpoint="/",
      fstype!~"tmpfs|overlay|squashfs"
    }
  )
)
```

El resultado representa el porcentaje de espacio utilizado en la partición raíz del servidor monitoreado.

## Configuración de Prometheus

Prometheus utiliza el archivo `prometheus.yml` para definir los objetivos de recopilación.

La configuración implementada contempla:

- `localhost:9090`: instancia local de Prometheus.
- `<IP_PRIVADA_VM_MONITOREADA>:9100`: endpoint de Node Exporter de la máquina monitoreada.

El intervalo de recopilación configurado es de 15 segundos.

Para adaptar la configuración a otro entorno, se debe reemplazar el marcador de IP por la dirección privada correspondiente.

## Seguridad de infraestructura

Se configuraron reglas de seguridad mediante Azure Network Security Groups (NSG) para controlar el acceso a los servicios.

Las medidas contempladas incluyen:

- **SSH (TCP 22):** acceso restringido a una dirección IP administrativa autorizada.
- **Node Exporter (TCP 9100):** acceso permitido desde el servidor de monitoreo.
- **Otros orígenes de la red virtual:** acceso al puerto 9100 restringido mediante una regla de denegación.

Las direcciones IP y los detalles específicos de las reglas se mantienen fuera de la documentación pública.

## Estructura del repositorio

```text
sistema-monitoreo-cloud/
│
├── dashboards/
│   └── dashboard-monitoreo.json
│
├── docs/
│   ├── roles_equipo.md
│   ├── comunicacion.md
│   ├── recursos_tecnologicos.md
│   ├── acuerdos_iniciales.md
│   ├── backlog.md
│   ├── bitacoras/
│   └── evidencias/
│
├── infra/
│   ├── prometheus.service
│   └── prometheus-node-exporter.service
│
├── monitoring/
│   ├── prometheus.yml
│   ├── install_prometheus.sh
│   └── install_node_exporter.sh
│
├── tests/
│
├── README.md
└── .gitignore
```

## Scripts de instalación

El repositorio incluye procedimientos de instalación para:

- `install_prometheus.sh`: procedimiento para instalar y configurar Prometheus.
- `install_node_exporter.sh`: procedimiento para instalar y configurar Node Exporter.

**Nota:** estos scripts fueron preparados como procedimientos de instalación reproducibles, pero no han sido ejecutados nuevamente para validar su funcionamiento. Se requiere realizar pruebas antes de utilizarlos en un entorno nuevo.

## Validaciones realizadas

Durante la implementación se realizaron las siguientes comprobaciones:

- Conectividad desde VM-MONITOREO hacia el endpoint de Node Exporter de VM-MONITOREADA.
- Respuesta HTTP `200 OK` del endpoint de métricas.
- Consulta de la métrica `up` en Prometheus.
- Verificación de los objetivos de recopilación mediante la API de Prometheus.
- Visualización de métricas de CPU, RAM y disco en Grafana.
- Visualización del indicador de disponibilidad del objetivo monitoreado.

## Equipo de trabajo

| Integrante | Rol |
|---|---|
| Marcela Menjívar | Líder de proyecto |
| Adonay Menjívar | Ingeniero Cloud |
| Rolando Ruano | DevOps |
| Luis Reyes | Analista de métricas |
| Edy Lopez | Documentador Técnico |

## Evidencias y documentación

La carpeta `docs/` contiene documentación complementaria del proyecto, incluyendo registros de actividades, acuerdos y evidencias de implementación.

Los archivos de configuración y el dashboard exportado permiten consultar los componentes utilizados en la solución.

## Consideraciones de seguridad

- No publicar claves privadas, contraseñas, tokens ni credenciales.
- No incluir direcciones IP públicas o privadas reales en los archivos de ejemplo públicos.
- Sustituir los marcadores de configuración por los valores correspondientes al entorno de implementación.
- Mantener las configuraciones reales en ubicaciones privadas y protegidas.

---

**Proyecto académico – Sistema de Monitoreo de Recursos Cloud con Grafana.**