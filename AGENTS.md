# AGENTS Guidelines for this Repo
1. Tooling & environment
- Use `mise` to load `.env` (configured in `mise.toml`).
- Primary stack: OpenTofu/Terraform in `infra/`, Ansible in `infra/ansible/`, Kubernetes manifests in `k8s/`.
- No Cursor (`.cursor/rules`) or Copilot (`.github/copilot-instructions.md`) rules exist yet.
2. Build / provision
- Preferred: `task provision` (runs `tofu init` + `tofu apply --auto-approve` in `infra/`).
- Manual: `cd infra && tofu init && tofu apply` (avoid changing commands/dirs unnecessarily).
3. Lint / validate
- Terraform/OpenTofu: `cd infra && tofu fmt && tofu validate`.
- Ansible (if installed): `ansible-lint infra/ansible`; keep playbooks idempotent and declarative.
- Kubernetes: keep manifests `kubectl apply`-friendly; prefer kustomize under `k8s/apps/*` for new apps.
4. Tests & dry-runs
- No automated unit tests today; treat `tofu plan` and `ansible-playbook ... --check` as “tests”.
- Example single-playbook dry-run: `ansible-playbook infra/ansible/playbook-install-k3s.yaml -i infra/inventory.yaml --check`.
- If you add a real test suite, document full-suite and single-test commands here (e.g. flags like `-run` or name filters).
5. Style & structure
- Keep Terraform modules, variables, and resources small and focused; prefer snake_case for variables and kebab-case for resource names.
- For YAML (Ansible/Kubernetes), use 2-space indents, order keys apiVersion/kind/metadata/spec, and choose descriptive DNS-safe names.
- Avoid hard-coding secrets or tokens; depend on `.env` + environment variables instead of committing sensitive data.
- Prefer explicit error handling and fail-fast behavior in scripts/tasks (e.g. `set -euo pipefail`, no silent ignores).
- Follow existing directory layout; do not rename or restructure `infra/` or `k8s/` without strong justification.
