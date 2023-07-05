Here's a DOCUMENTATION.md file that provides a walkthrough of the thinking process and decisions behind the steps taken to dockerize the application and set up the containers for the backend, proxy, and React frontend.

---
# Dockerizing Application with Nginx Proxy for Backend and React Frontend

This repository provides a Dockerized setup for an application that consists of a backend server (Flask) and a React frontend, served through Nginx acting as a reverse proxy.

## Architecture Overview

The architecture consists of the following components:

- **Backend**: A Flask application that provides a `/stats` endpoint to retrieve CPU and RAM statistics using the `psutil` library.
- **Frontend**: A React application that consumes the `/stats` endpoint and displays the CPU and RAM statistics.
- **Nginx Proxy**: Nginx acts as a reverse proxy, forwarding requests to the backend and serving the React frontend.

## Steps to Dockerize the Application

1. **Backend Dockerization**: The Flask backend is dockerized using a Dockerfile. It sets up the Python environment, installs dependencies from the `requirements.txt` file, and exposes port 5000. The Flask application is run using Gunicorn as the production-ready WSGI server.

2. **Frontend Dockerization**: The React frontend is dockerized using a Dockerfile. It sets up the Node.js environment, installs dependencies using `npm install`, and copies the frontend code into the container. The production-ready static files are generated using `npm run build`.

3. **Nginx Configuration**: An Nginx configuration file (`nginx.conf`) is created to define the reverse proxy setup. It listens on port 80 and forwards requests to the backend running on port 5000. For the frontend, Nginx serves the static files generated in the React container.

4. **Docker Compose**: The services for the backend, proxy, and frontend are defined in the `docker-compose.yml` file. The backend and frontend containers are built using their respective Dockerfiles. The Nginx container uses the Nginx image and mounts the `nginx.conf` file to configure the proxy. The necessary ports are mapped, with port 80 being exposed for accessing the application.

## Usage

1. Clone this repository:

```
git clone <repository-url>
cd <repository-directory>
```

2. Update the backend code (Flask) in the `api/` directory and the frontend code (React) in the `sys-stats/` directory.

3. Build and start the containers using Docker Compose:

```
docker-compose build
docker-compose up
```

4. Access the application in your web browser at `http://localhost:3000`. Nginx will serve the React frontend, and requests to `/stats` will be proxied to the backend, providing CPU and RAM statistics.

## Conclusion

This Dockerized setup allows you to run the application with ease, utilizing separate containers for the backend, proxy (Nginx), and React frontend. It provides a scalable and portable environment that encapsulates the necessary dependencies and configurations, making it easier to deploy and manage the application in different environments.