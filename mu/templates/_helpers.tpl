{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "release" -}}
{{- default .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "fullname" -}}
{{- printf "%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified mysql name.
*/}}
{{- define "mysql.fullname" -}}
{{- printf "%s-%s" .Release.Name "mysql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

# call me as {{ template "nginx.path.groupping" (merge (dict "path" "myvalue") .) }}
{{- define "nginx.path.groupping" -}}
{{- if eq .path "/" }}
{{- printf "/(.*)" }}
{{- else }}
{{- printf "%s(/|$)(.*)" .path }}
{{- end }}
{{- end -}}

{{- define "mu.public.ui.url" -}}
{{- if .Values.tls.enabled }}
{{- printf "https://%s%s" .Values.ingress.ui.hostname .Values.ingress.ui.context }}
{{- else }}
{{- printf "http://%s%s" .Values.ingress.ui.hostname .Values.ingress.ui.context }}
{{- end }}
{{- end }}

{{- define "mu.public.fn.url" -}}
{{- if .Values.tls.enabled }}
{{- printf "https://%s%s" .Values.ingress.fn.hostname .Values.ingress.fn.context }}
{{- else }}
{{- printf "http://%s%s" .Values.ingress.fn.hostname .Values.ingress.fn.context }}
{{- end }}
{{- end }}

{{- define "mu.public.flow.url" -}}
{{- if .Values.tls.enabled }}
{{- printf "https://%s%s" .Values.ingress.flow.hostname .Values.ingress.flow.context }}
{{- else }}
{{- printf "http://%s%s" .Values.ingress.flow.hostname .Values.ingress.flow.context }}
{{- end }}
{{- end }}

{{- define "mu.public.api.url" -}}
{{- if .Values.tls.enabled }}
{{- printf "https://%s%s" .Values.ingress.api.hostname .Values.ingress.api.context }}
{{- else }}
{{- printf "http://%s%s" .Values.ingress.api.hostname .Values.ingress.api.context }}
{{- end }}
{{- end }}

{{- define "mu.public.grafana.url" -}}
{{- if .Values.tls.enabled }}
{{- printf "https://%s%s" .Values.ingress.grafana.hostname .Values.ingress.grafana.context }}
{{- else }}
{{- printf "http://%s%s" .Values.ingress.grafana.hostname .Values.ingress.grafana.context }}
{{- end }}
{{- end }}

{{- define "mu.private_api_url" -}}
{{- printf "http://%s.%s.svc.cluster.local:%d" .Release.Name .Release.Namespace (.Values.fn_api.service.port | int) }}
{{- end }}

{{- define "mu.private_mysql_url" -}}
{{- printf "mysql://%s:%s@tcp(%s-mysql.%s.svc.cluster.local)/%s"  .Values.mysql.mysqlUser .Values.mysql.mysqlPassword .Release.Name .Release.Namespace .Values.mysql.mysqlDatabase }}
{{- end }}
