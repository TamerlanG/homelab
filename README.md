# Homelab

This is my homelab configuration hosted on a Hetzner server.

## Requirements

- Hetzner Cloud account
    - Hetzner Cloud project
    - Hetzner Cloud API token with read and write permissions
- OpenTofu installed on your local machine
- Public SSH key found in `~/.ssh/id_rsa.pub`

## Setup 

### Server Configuration

Copy the `example.env` file to `.env` and fill in your Hetzner Cloud API token.

```bash
    cp infra/example.env infra/.env
```

Run the following command to create the server:

```bash
    cd infra
    tofu init
    tofu apply
```
