# Homelab

This is my homelab configuration hosted on a Hetzner server.

## Requirements

- Hetzner Cloud account
    - Hetzner Cloud project
    - Hetzner Cloud API token with read and write permissions
- OpenTofu installed on your local machine
- Public SSH key found in `~/.ssh/id_rsa.pub`
- Mise (optional) for managing environment variables
- Task (optional) for running predefined tasks

## Setup 

### Server Configuration

Copy the `example.env` file to `.env` and fill in your Hetzner Cloud API token.

```bash
    cp infra/example.env infra/.env
```

Make sure that your environment variables are loaded. If you are using Mise, it
should automatically load the `.env` file. But if its your first time using
Mise, you have to run the following command:

```bash
    mise trust
```

Run the following command to create the server:

```bash
    cd infra
    tofu init
    tofu apply
```
