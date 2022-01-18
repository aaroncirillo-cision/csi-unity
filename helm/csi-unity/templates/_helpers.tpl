{{/*
Return the appropriate sidecar images based on k8s version
*/}}
{{- define "csi-unity.attacherImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if eq ( trimSuffix "+" .Capabilities.KubeVersion.Minor ) "21" }}
      {{- print "k8s.gcr.io/sig-storage/csi-attacher:v3.2.1" -}}
    {{- else if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "22") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "23") -}}
      {{- print "k8s.gcr.io/sig-storage/csi-attacher:v3.3.0" -}}
    {{- else -}}
      {{- print "k8s.gcr.io/sig-storage/csi-attacher:v3.1.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.provisionerImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if eq ( trimSuffix "+" .Capabilities.KubeVersion.Minor ) "21" }}
      {{- print "k8s.gcr.io/sig-storage/csi-provisioner:v2.2.1" -}}
    {{- else if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "22") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "23") -}}
      {{- print "k8s.gcr.io/sig-storage/csi-provisioner:v3.0.0" -}}
    {{- else -}}
      {{- print "k8s.gcr.io/sig-storage/csi-provisioner:v2.1.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.snapshotterImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if eq ( trimSuffix "+" .Capabilities.KubeVersion.Minor ) "21" }}
      {{- print "k8s.gcr.io/sig-storage/csi-snapshotter:v4.1.0" -}}
    {{- else if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "22") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "23") -}}
      {{- print "k8s.gcr.io/sig-storage/csi-snapshotter:v4.2.1" -}}
    {{- else -}}
      {{- print "k8s.gcr.io/sig-storage/csi-snapshotter:v3.0.3" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.resizerImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if eq ( trimSuffix "+" .Capabilities.KubeVersion.Minor ) "21" }}
      {{- print "k8s.gcr.io/sig-storage/csi-resizer:v1.2.0" -}}
    {{- else if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "22") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "23") -}}
      {{- print "k8s.gcr.io/sig-storage/csi-resizer:v1.3.0" -}}
    {{- else -}}
      {{- print "k8s.gcr.io/sig-storage/csi-resizer:v1.1.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.registrarImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if eq ( trimSuffix "+" .Capabilities.KubeVersion.Minor ) "21" }}
      {{- print "k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.2.0" -}}
    {{- else if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "22") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "23") -}}
      {{- print "k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.3.0" -}}
    {{- else -}}
      {{- print "k8s.gcr.io/sig-storage/csi-node-driver-registrar:v2.1.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "csi-unity.healthmonitorImage" -}}
  {{- if eq .Capabilities.KubeVersion.Major "1" }}
    {{- if eq ( trimSuffix "+" .Capabilities.KubeVersion.Minor ) "21" }}
      {{- print "gcr.io/k8s-staging-sig-storage/csi-external-health-monitor-controller:v0.4.0" -}}
    {{- else if and (ge (trimSuffix "+" .Capabilities.KubeVersion.Minor) "22") (le (trimSuffix "+" .Capabilities.KubeVersion.Minor) "23") -}}
      {{- print "gcr.io/k8s-staging-sig-storage/csi-external-health-monitor-controller:v0.4.0" -}}
    {{- else -}}
      {{- print "gcr.io/k8s-staging-sig-storage/csi-external-health-monitor-controller:v0.4.0" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}