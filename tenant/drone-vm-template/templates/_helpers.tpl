{{/*
Capitalize the first letter of a string
Usage: {{ include "drone-vm-template.capitalizeFirst" "hello" }}
Output: Hello
*/}}
{{- define "drone-vm-template.capitalizeFirst" -}}
{{- $s := printf "%s" . -}}
{{- substr 0 1 $s | upper -}}{{- substr 1 -1 $s -}}
{{- end -}}