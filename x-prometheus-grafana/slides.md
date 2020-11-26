%titles RPI - Prometheus / Grafana
%author: xavki

# Monitoring : installation Prometheus / Grafana


<br>


PROMETHEUS

* base de données timeseries

* scarpping à intervalle de temps

<br>


* installation de prometheus

```
apt-get update -qq >/dev/null
apt-get install -qq -y wget unzip prometheus >/dev/null
```

* configuration

```
global:
  scrape_interval:     5s 
  evaluation_interval: 5s 
  external_labels:
    monitor: 'monitoring'
rule_files:
  - job_name: prometheus
    static_configs:
      - targets: ['localhost:9090']
```


-----------------------------------------------------------------


# Monitoring : installation Prometheus / Grafana

<br>


GRAFANA

* dashboarding

* graphiques, tableaux, alertes, schémas...

* multi-db : prometheus, influxdb, postgres, mysq, elasticsearch...

<br>


* installation de grafana

```
wget https://dl.grafana.com/oss/release/grafana-rpi_6.5.1_armhf.deb
dpkg -i grafana-rpi_6.5.1_armhf.deb
```
