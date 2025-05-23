# Inception of Things (Kubernetes Project)

**Inception-of-Things** is a hands-on system administration and DevOps project built to explore Kubernetes through K3s, K3d, Argo CD, and GitOps best practices.

This project is structured into multiple parts to guide you from basic VM and cluster setup to advanced CI/CD workflows.

---

## Project Objectives

- Set up lightweight Kubernetes clusters using K3s and K3d
- Deploy and scale containerized applications
- Route external traffic using Ingress
- Automate deployments with Argo CD
- Bonus: Integrate GitLab for full local GitOps

---

## Project Structure

```
InceptionOfThings/
├── p1/      # K3s + Vagrant (2-node cluster setup)
├── p2/      # K3s + 3 Web Apps + Ingress
├── p3/      # K3d + Argo CD + GitHub Integration
└── bonus/   # Local GitLab deployment & GitOps integration
```

---

## Part 1 – K3s & Vagrant

- Set up 2 virtual machines using Vagrant
- One acts as the K3s **server** (control plane + worker)
- The other as a **worker** node
- SSH key-based authentication
- Static IPs configured

### Technologies: Vagrant, VirtualBox, K3s, kubectl

---

## Part 2 – K3s & Three Applications

- Deploy 3 lightweight web apps on the K3s server
- Setup Ingress to route based on `HOST`
- Demonstrates:
  - Replica scaling
  - Traffic routing
  - Default fallback service

### Technologies: K3s, kubectl, Ingress Controller

---

## Part 3 – K3d & Argo CD

- Setup K3d (K3s in Docker) for a local containerized cluster
- Install Argo CD
- Create 2 namespaces: `argocd`, `dev`
- App deployed from GitHub with CI/CD flow
- Version switching through Git commits (v1 to v2)

### Technologies: K3d, Docker, Argo CD, GitHub

---

## Bonus – GitLab Integration

- Setup full local GitLab instance in the cluster
- Create `gitlab` namespace
- Full GitOps flow using self-hosted GitLab
- Bonus folder includes:
  - Helm chart configs
  - GitLab setup scripts

### Technologies: GitLab, Helm, Kubernetes, GitOps

---

## How to Use

Each folder in part 1 and 2 contains its own `Vagrantfile`, configuration scripts, and manifests.
To these parts:

```bash
cd p1  # or p2
vagrant up
```

each folder in part 3 and bonus contains a makefile that runs configuration scripts and manifests.
to test part 3:

```bash
cd p3
make init
make install
make info
```

to test bonus:

```bash
cd p3
make init
make gitlab
make deploy
make info
make expose
```

## Authors
**Made with 💻, ☕, and a whole lot of YAML** by:
- Kaoutar Moutaouakil `kmoutaou`
- Jad Chehboune `cjad`
