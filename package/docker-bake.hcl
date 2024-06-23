variable "VERSION" {
  default = "0.0.1"
}

variable "DOCKER_REGISTRY" {
  default = "laplace-prod.tencentcloudcr.com"
}

group "default" {
  targets = ["app"]
}


target "app" {
    labels = {
        "laplacelab.author" = "david"
        "laplacelab.image.name" = "laplacelab-tool-engine"
    }
    dockerfile = "package/Dockerfile"
    context  = "./"
    args = {
        VERSION="${VERSION}"
    }
    platforms = ["linux/amd64"]
    tags = ["${DOCKER_REGISTRY}/laplacelab-svc/test:${VERSION}"]
    output = ["type=image,push=true"]
}
