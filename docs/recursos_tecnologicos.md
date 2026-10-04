# Plan de Recursos Tecnológicos

## Proyecto

Sistema de Monitoreo de Recursos Cloud con Grafana

## Fase

Fase 0 – Onboarding y planificación

## Objetivo

Identificar los recursos tecnológicos que serán considerados para el desarrollo del sistema de monitoreo y establecer su propósito, responsable y consideraciones iniciales.

## Recursos cloud propuestos en la fase 0 (aún definiendo)

| Recurso | Proveedor / Plataforma | Responsable | Uso previsto | Tipo / Plan | Límites / Observaciones |
|---|---|---|---|---|---|
| Instancia API | Por definir | Adonay | Recurso a considerar para monitoreo | Por definir | Confirmar proveedor, capacidad y acceso. |
| Instancia de base de datos | Por definir | Adonay | Recurso a considerar para monitoreo | Por definir | Confirmar disponibilidad y características. |
| Instancia Web | Por definir | Adonay | Recurso a considerar para monitoreo | Por definir | Confirmar acceso y servicio HTTP. |
| Instancia de documentación | Por definir | Adonay | Recurso de apoyo para documentación, si aplica | Por definir | Evaluar necesidad antes de crear el recurso. |
| Instancia de respaldo | Por definir | Adonay | Recurso propuesto para respaldos, si aplica | Por definir | Validar necesidad y costos. |

## Herramientas de monitoreo

| Herramienta | Propósito | Responsable |
|---|---|---|
| Prometheus | Recopilación y almacenamiento de métricas | Rolando |
| Node Exporter | Exposición de métricas del sistema operativo | Rolando |
| Grafana | Visualización de métricas mediante dashboards | Rolando |
| Alertmanager | Gestión y envío de alertas, si se incluye en el alcance | Rolando |

## Herramientas de apoyo

| Recurso | Propósito | Responsable |
|---|---|---|
| GitHub | Control de versiones y almacenamiento del proyecto | Equipo |
| WhatsApp | Comunicación del equipo | Marcela |
| Google Docs | Elaboración y colaboración en documentación | Equipo |
| Google Meet | Reuniones y coordinación | Equipo |

## Métricas iniciales consideradas

Las métricas identificadas inicialmente son:

- CPU
- RAM
- Disco
- Uptime
- Latencia
- HTTP Status

La prioridad y los umbrales definitivos serán establecidos durante la fase de análisis.

## Consideraciones de infraestructura

- Confirmar proveedor cloud antes de crear las instancias.
- Revisar los recursos disponibles y sus límites.
- Verificar los costos previstos antes de utilizar recursos de pago.
- Limitar los puertos y accesos a los estrictamente necesarios.
- Mantener protegidas las credenciales.
- No almacenar contraseñas, tokens o claves privadas en el repositorio.
- Evaluar el apagado de recursos cuando no sean necesarios.

## Estado

En curso.

La infraestructura definitiva y los proveedores serán confirmados durante las siguientes fases del proyecto.