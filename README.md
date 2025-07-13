# Enhertz

[![Release](https://github.com/TeamTaoist/enhertz/actions/workflows/release.yml/badge.svg)](https://github.com/TeamTaoist/enhertz/actions/workflows/release.yml)

A cross-platform desktop application built with Tauri and Vue.js.

## Recommended IDE Setup

- [VS Code](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) + [Tauri](https://marketplace.visualstudio.com/items?itemName=tauri-apps.tauri-vscode) + [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)

## Development

To get started with development, clone the repository and install the dependencies.

```bash
git clone https://github.com/TeamTaoist/enhertz.git
cd enhertz
npm install
```

To run the application in development mode (with hot-reloading):

```bash
npm run tauri dev
```

## Available Scripts

- `npm run dev`: Starts the frontend development server (Vite).
- `npm run build`: Compiles the frontend for production.
- `npm run tauri dev`: Runs the full Tauri application in development mode.
- `npm run tauri build`: Builds the application for production.
- `npm run release -- <patch|minor|major>`: Bumps the version, creates a git tag, and pushes to trigger a new release.

## Releasing a New Version

This project uses an automated release workflow powered by GitHub Actions. To release a new version, use the `release` script.

1.  **For a patch release (e.g., 0.1.0 -> 0.1.1):**

    ```bash
    npm run release -- patch
    ```

2.  **For a minor release (e.g., 0.1.1 -> 0.2.0):**

    ```bash
    npm run release -- minor
    ```

3.  **For a major release (e.g., 0.2.0 -> 1.0.0):**
    ```bash
    npm run release -- major
    ```

Pushing a new version tag will automatically trigger the `release.yml` workflow, which builds the application for macOS, Windows, and Linux and attaches the binaries to a new GitHub Release.

## Code Formatting and Commit Linting

This project uses `prettier` for code formatting and `commitlint` to enforce the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification. Code is automatically formatted and commit messages are linted before each commit, thanks to `husky`.
