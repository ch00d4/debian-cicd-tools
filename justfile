image_name := "debian-cicd-tools"

build:
    podman build -t {{image_name}} .

test: build
    podman run --rm {{image_name}} kubectl version --client
    podman run --rm {{image_name}} aws --version
    podman run --rm {{image_name}} docker --version

default: test
