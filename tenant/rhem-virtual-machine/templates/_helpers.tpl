{{/*
Do the required math to figure out what worker to schedule the VM on
Usage: {{ include "rhem-virtual-machine.determineWorker" (list "user1" "abc12-1" 10) }}
Output: worker-cluster-abc12-1
*/}}
{{- define "rhem-virtual-machine.determineWorker" -}}
{{- /* 1. Extract arguments from the list */ -}}
{{- $userString := index . 0 -}}
{{- $rawGuid := index . 1 -}}
{{- $groupSize := index . 2 | int -}} {{/* The variable for the math (e.g. 10) */ -}}

{{- /* 2. Strip "-1" from the end of the GUID if it exists */ -}}
{{- $cleanGuid := trimSuffix "-1" $rawGuid -}}

{{- /* 3. Strip "user" from string and convert to int */ -}}
{{- $userNum := trimPrefix "user" $userString | int -}}

{{- /* 4. Calculate the worker number dynamically */ -}}
{{- /* Logic: (UserNum - 1) / GroupSize + 1 */ -}}
{{- $workerNum := add (div (sub $userNum 1) $groupSize) 1 -}}

{{- /* 5. Print the formatted string using the cleaned GUID */ -}}
{{- printf "worker-cluster-%s-%d" $cleanGuid $workerNum -}}
{{- end -}}