
# ECommerce Application Deployment Automation

This script automates the deployment of an ECommerce application by setting up both the database server and the web server. It performs the necessary configurations and installations to ensure the smooth operation of the application.

## Prerequisites

- This script assumes you are running a Linux-based operating system.
- You must have sudo privileges.
- Internet connectivity is required to download packages.

## Usage

1. Download the shell script (`ecommerce_deployment.sh`) to your server.
2. Make the script executable by running the following command:

    ```bash
    chmod +x ecommerce_deployment.sh
    ```

3. Execute the script using the following command:

    ```bash
    ./ecommerce_deployment.sh
    ```

## Functionality

### Setup Database Server

- Installs and configures FirewallD.
- Installs and starts MariaDB server.
- Configures FirewallD rules for the database.
- Sets up the database schema and loads inventory data into the MySQL database.

### Setup Web Server

- Installs Apache HTTP server and PHP.
- Configures FirewallD rules for the web server.
- Updates the Apache configuration to use `index.php` as the default index file.
- Starts the Apache HTTP server.
- Downloads the ECommerce application code from a Git repository.
- Updates the application configuration to use `localhost`.

## Customization

You may customize the script according to your requirements by modifying the following sections:

- Database setup: Modify database credentials, schema, and inventory data.
- Web server setup: Customize Apache configurations, firewall rules, and application URLs.

## Testing

After executing the script, you can test the deployment by accessing the ECommerce application in your web browser. Additionally, the script performs a basic test by checking the presence of specific items on the web page.

## Note

- It's recommended to review the script and ensure compatibility with your environment before executing it.
- This script is provided as-is, and the authors hold no liability for any issues arising from its usage.