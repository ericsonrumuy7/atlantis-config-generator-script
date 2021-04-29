#!/bin/bash
EXTRA_ARGS=""

function generate_extra_args() {
    for FILE in `find values -name '*.tfvars' -type f`
    do
      EXTRA_ARGS="${EXTRA_ARGS}-var-file=../$FILE,"
    done
    EXTRA_ARGS=${EXTRA_ARGS::-1}
}

function render_template() {
  eval "echo \"$(cat $1)\""
}

generate_extra_args
render_template atlantis.yaml.tmpl > atlantis.yaml