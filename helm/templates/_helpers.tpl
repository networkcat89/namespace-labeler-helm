{{/*
Return the proper namespace-labeler image name
*/}}
{{- define "namespace-labeler.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{- define "namespace-labeler-job.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.job "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "namespace-labeler.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.image) "global" .Values.global) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "namespace-labeler.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Compile all warnings into a single message.
*/}}
{{- define "namespace-labeler.validateValues" -}}
{{- $messages := list -}}
{{- $messages := append $messages (include "namespace-labeler.validateValues.ports" .) -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{- printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}

{{- define "namespace-labeler.validateValues.ports" -}}
{{- if not .Values.containerPorts }}
namespace-labeler: No container ports
    namespace-labeler should at least expose container ports. Please configure the containerPorts values using the following structure.
    containerPorts:
       - name: <NAME OF THE PORT>
         containerPort: <PORT NUMBER>
{{- end }}
{{- end }}
