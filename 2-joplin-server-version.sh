#!/usr/bin/env bash

source vars.sh

if [[ -d "${extract}" ]]; then
	echo "Extract directory already exists: ${extract}"
	exit 1
fi

./docker-image-extract.sh -o "${extract}" joplin/server

check_dirs=(
"${target}"
"${target}/packages"
"${target}/packages/server"
"${target}/packages/server/dist"
)

check_files=(
"${target}/packages/server/dist/app.js"
"${target}/packages/server/package.json"
)

for dir in "${check_dirs[@]}"; do
	if [[ ! -d "${dir}" ]]; then
		echo "Missing directory: ${dir}"
		exit 1
	fi
done

for file in "${check_files[@]}"; do
	if [[ ! -f "${file}" ]]; then
		echo "Missing file: ${file}"
		exit 1
	fi
done

ver=$(jq --raw-output '.version' "${target}/packages/server/package.json")
name=$(jq --raw-output '.name' "${target}/packages/server/package.json")

if [[ "${name}" != "@joplin/server" ]]; then
	echo "Joplin server name is not expected."
	exit 1
fi

if [[ "${ver}" == "null" ]]; then
	echo "Joplin version is not expected."
	exit 1
fi

echo "== Joplin server version discovered: ${ver}"
echo "GHCI_JOPLIN_VER=${ver}" >> "$GITHUB_ENV"
