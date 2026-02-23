# OGM.Insy Helm Chart

This Helm chart deploys the OGM.Insy Streamlit application to a Kubernetes cluster.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+
- Access to pull images from GitHub Container Registry (GHCR)

## Installing the Chart

To install the chart with the release name `ogm-insy`:

```bash
helm install ogm-insy .
```

(From the helm/ directory)

## Uninstalling the Chart

To uninstall the `ogm-insy` deployment:

```bash
helm uninstall ogm-insy
```

## Publishing the Chart

### Package the Chart

```bash
# From the project root directory
# Create dist directory for releases
mkdir -p dist

# Package the chart to dist directory
helm package helm --destination dist/
```

This creates `dist/ogm-insy-0.1.0.tgz`

### Generate Repository Index

```bash
# From the project root directory
helm repo index helm/
```

This creates `helm/index.yaml`

## Publishing Options

### Option 1: GitHub Releases (Recommended for Simple Distribution)

1. Go to your repository releases: https://github.com/mksaraf/ogm.github.insy/releases
2. Click the **"Create a new release"** button
3. Fill in the release details:
   - **Tag version**: `v0.1.0`
   - **Release title**: `OGM.Insy Helm Chart v0.1.0`
   - **Description**: Include installation instructions
3. Upload the packaged chart: `dist/ogm-insy-0.1.0.tgz`
5. Click **"Publish release"**

Users can install directly from the release:

```bash
helm install ogm-insy https://github.com/mksaraf/ogm.github.insy/releases/download/v0.1.0/ogm-insy-0.1.0.tgz
```

### Option 2: GitHub Pages (Full Chart Repository)

1. Enable GitHub Pages in repository settings
2. Set source to "Deploy from a branch" → select "gh-pages" branch
3. Push the `helm/` directory contents to the `gh-pages` branch
4. Users can add your repository:

```bash
helm repo add ogm-insy https://mksaraf.github.io/ogm.github.insy/
helm repo update
helm install ogm-insy ogm-insy/ogm-insy
```

### Option 3: Artifact Hub (Maximum Discoverability)

1. Go to https://artifacthub.io
2. Sign in with GitHub
3. Add your repository URL: `https://mksaraf.github.io/ogm.github.insy/`
4. Artifact Hub will automatically index your charts

### Option 4: OCI Registry (GitHub Container Registry)

```bash
# Push to GHCR (requires Helm 3.8+)
helm push ogm-insy-0.1.0.tgz oci://ghcr.io/mksaraf/charts/

# Users can install with:
helm install ogm-insy oci://ghcr.io/mksaraf/charts/ogm-insy --version 0.1.0
```

## Configuration

The following table lists the configurable parameters of the ogm-insy chart and their default values.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `image.repository` | OGM.Insy image repository | `ghcr.io/mksaraf/ogm-insy` |
| `image.tag` | OGM.Insy image tag | `latest` |
| `image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `service.type` | Kubernetes service type | `ClusterIP` |
| `service.port` | Service port | `8501` |
| `deployment.replicas` | Number of replicas | `1` |
| `resources.limits.cpu` | CPU limit | `1000m` |
| `resources.limits.memory` | Memory limit | `1Gi` |
| `resources.requests.cpu` | CPU request | `500m` |
| `resources.requests.memory` | Memory request | `512Mi` |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```bash
helm install ogm-insy ./helm --set image.tag=v1.0.0
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example:

```bash
helm install ogm-insy ./helm -f values.yaml
```

## Accessing the Application

After deployment, the OGM.Insy Streamlit application will be available on port 8501.

For ClusterIP service:
```bash
kubectl port-forward svc/ogm-insy 8501:8501
```

Then access at http://localhost:8501

## Image Pull Secrets

If the image registry requires authentication, create a secret and reference it:

```bash
kubectl create secret docker-registry ghcr-secret \
  --docker-server=ghcr.io \
  --docker-username=mksaraf \
  --docker-password=$GITHUB_TOKEN
```

Then set in values:
```yaml
imagePullSecrets:
  - name: ghcr-secret
```

## Upgrading the Chart

To upgrade the `ogm-insy` deployment:

```bash
helm upgrade ogm-insy .
```

(From the helm/ directory)

## Troubleshooting

### Image Pull Issues
If you encounter image pull errors, ensure:
1. The image exists on GHCR
2. You have proper authentication
3. The image tag is correct

### Service Not Accessible
Check service status:
```bash
kubectl get svc ogm-insy
kubectl describe svc ogm-insy
```

### Pod Issues
Check pod status:
```bash
kubectl get pods -l app.kubernetes.io/name=ogm-insy
kubectl logs -l app.kubernetes.io/name=ogm-insy
```