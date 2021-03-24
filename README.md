# GitHub Action for building `.deb` packages

Build a .deb package for deploying to hosted or OS mender.io

## Inputs

### `artifact_name`:
**Required** Name of the artifact to deploy to mender
### `device_type`
**Required** Device type for categorization of targets in mender
### `packages`
**Required** Space delimited list of deb packages to include in the artifact
### `server_address`
**Required** Address of the mender server to upload to (defaults to https://hosted.mender.io)
### `username`
**Required** Username on the server specified in the server_address
### `password`
**Required** Password for the user on the server specified in the server_address

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE-MIT.txt).

