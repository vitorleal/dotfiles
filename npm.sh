#!/usr/bin/env bash

function installglobal() {
	npm install -g "${@}" 2> /dev/null
}

installglobal express
installglobal request
installglobal bleno
installglobal noble
installglobal mocha
installglobal harp
installglobal grunt-cli
installglobal gulp
