# docker-stunnel

A simple Docker image for stunnel that supports both client and server modes.

## Client Mode (Default)

``` yaml
stunnel-client:
  image: kurmisrainas/stunnel:latest
  environment:
    - CLIENT=yes
    - ACCEPT=8000
    - CONNECT=your.server.com:443
  ports:
    - "8000:8000"
```

## Server Mode

``` yaml
stunnel-server:
  image: kurmisrainas/stunnel:latest
  environment:
    - CLIENT=no
    - ACCEPT=8000
    - CONNECT=nginx:80
  ports:
    - "8000:8000"
```

## Environment Variables

- `CLIENT`: Set to "no" for server mode, "yes" for client mode (defaults to "yes")
- `ACCEPT`: Port to accept connections on
- `CONNECT`: Target to connect to (host:port)

## Contributing

This project uses [Semantic Release](https://github.com/semantic-release/semantic-release) for automatic versioning and releases. To contribute:

1. Make your changes
2. Use [Conventional Commits](https://www.conventionalcommits.org/) for your commit messages:
   - `feat:` for new features (triggers minor version bump)
   - `fix:` for bug fixes (triggers patch version bump)
   - `BREAKING CHANGE:` for breaking changes (triggers major version bump)
   - `docs:` for documentation changes
   - `style:` for formatting changes
   - `refactor:` for code refactoring
   - `test:` for adding tests
   - `chore:` for maintenance tasks

3. Push to the `main` branch
4. The CI will automatically:
   - Analyze your commits
   - Generate a new version if needed
   - Create a GitHub release
   - Build and push Docker images with the new version tags

### Example commit messages:
- `feat: add support for custom SSL certificates`
- `fix: resolve connection timeout issue`
- `docs: update README with new configuration options`
- `BREAKING CHANGE: change default port from 8000 to 8443`
