# Detour Box Mini

This minimal Docker image provides an Apache-based HTTP server configured to redirect incoming traffic based on custom rules.
Each redirect is specified at build time, allowing you to bake permanent and temporary redirects directly into the image.

## Usage

1. **Define Redirect Rules**: Each redirect rule follows the format:
   ```
   path,target,type
   ```
   - **path**: The path to match (e.g., `/docs`).
   - **target**: The target URL to redirect to (e.g., `https://github.com/dgilli/docs`).
   - **type**: The HTTP status code for the redirect:
     - `301` for a permanent redirect
     - `302` for a temporary redirect

   Multiple redirects can be separated by semicolons (`;`).

2. **Build the Docker Image**: Use the `REDIRECTS` build argument to specify your redirects. Example:
   ```bash
   docker build -t redirect-server \
       --build-arg REDIRECTS="/docs,https://github.com/dgilli/docs,301; \
                              /blog,https://github.com/dgilli/blog,302" .
   ```

3. **Run the Container**:
   ```bash
   docker run -d -p 80:80 redirect-server
   ```

## Using the Makefile

For convenience, you can manage this project using the included `Makefile`, which provides common tasks such as building, running, and testing the image:
```bash
make build          # Builds the image
make run            # Runs the container
make test           # Tests if the redirects are applied
make deploy         # Deploys to Fly.io (ensure Fly.io setup is complete)
```

The `Makefile` makes it easy to manage and deploy the image without needing to run individual Docker commands.

