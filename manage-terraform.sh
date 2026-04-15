#!/usr/bin/env bash

set -e
# ./manage-terraform.sh staging init
# ./manage-terraform.sh staging plan
# ./manage-terraform.sh staging apply
# ./manage-terraform.sh staging destroy
show_help() {
    echo "Uso: ./manage-terraform.sh <ambiente> <accion>"
    echo ""
    echo "Ambientes: Cualquier carpeta existente en terraform/environments/"
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

TARGET_DIR="terraform/environments/$ENV"

if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ Error: La infraestructura base para '$ENV' no existe en $TARGET_DIR."
    exit 1
fi

if [[ "$ACTION" != "init" && "$ACTION" != "plan" && "$ACTION" != "apply" && "$ACTION" != "destroy" ]]; then
    echo "❌ Error: La acción '$ACTION' no es válida."
    show_help
    exit 1
fi

echo "=========================================================="
echo "🚀 Acción Automática: terraform $ACTION"
echo "📍 Ambiente Objetivo: $ENV"
echo "📁 Ingresando a:      $TARGET_DIR"
echo "=========================================================="

cd "$TARGET_DIR"

if [[ "$ACTION" == "plan" ]]; then
    terraform plan -out=tfplan
elif [[ "$ACTION" == "apply" ]]; then
    if [ -f "tfplan" ]; then
        terraform apply "tfplan"
        rm tfplan
    else
        terraform apply
    fi
else
    terraform $ACTION
fi

echo "=========================================================="
echo "✅ Proceso '$ACTION' en '$ENV' completado."
echo "=========================================================="
