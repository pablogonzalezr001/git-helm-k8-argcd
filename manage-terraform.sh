#!/usr/bin/env bash

set -e
# ./manage-terraform.sh staging init
# ./manage-terraform.sh staging plan
# ./manage-terraform.sh staging apply
# ./manage-terraform.sh staging destroy
show_help() {
    echo "Uso: ./manage-terraform.sh <ambiente> <accion>"
    echo ""
    echo "Ambientes permitidos:"
    echo "  staging"
    echo "  prod"
    echo ""
    echo "Acciones permitidas:"
    echo "  init"
    echo "  plan"
    echo "  apply"
    echo "  destroy"
    echo ""
    echo "Ejemplo: ./manage-terraform.sh staging plan"
}

if [ "$#" -ne 2 ]; then
    show_help
    exit 1
fi

ENV=$1
ACTION=$2

if [[ "$ENV" != "staging" && "$ENV" != "prod" ]]; then
    echo "❌ Error: El ambiente '$ENV' no es válido."
    show_help
    exit 1
fi

if [[ "$ACTION" != "init" && "$ACTION" != "plan" && "$ACTION" != "apply" && "$ACTION" != "destroy" ]]; then
    echo "❌ Error: La acción '$ACTION' no es válida."
    show_help
    exit 1
fi

TARGET_DIR="terraform/environments/$ENV"

echo "=========================================================="
echo "🚀 Acción Automática: terraform $ACTION"
echo "📍 Ambiente Objetivo: $ENV"
echo "📁 Ingresando a:      $TARGET_DIR"
echo "=========================================================="

cd "$TARGET_DIR"

terraform $ACTION

echo "=========================================================="
echo "✅ Proceso '$ACTION' en '$ENV' completado."
echo "=========================================================="
