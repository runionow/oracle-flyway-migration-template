#!/bin/bash

FLYWAY_VERSION="11.5.0"
FLYWAY_DIR="flyway"
ORACLE_JDBC_URL="https://download.oracle.com/otn-pub/otn_software/jdbc/233/ojdbc8.jar"

# Detect CPU architecture
ARCH=$(uname -m)
case $ARCH in
  x86_64)
    FLYWAY_ARCH="linux-x64"
    ;;
  aarch64|arm64)
    FLYWAY_ARCH="macosx-arm64"
    ;;
  *)
    echo "Unsupported CPU architecture: $ARCH"
    exit 1
    ;;
esac

# Install latest Java (OpenJDK)
if ! command -v java &> /dev/null; then
  echo "Installing latest Java (OpenJDK)..."
  sudo apt update
  sudo apt install -y openjdk-17-jdk
else
  echo "Java already installed."
fi

# Download Flyway CLI
if [ ! -d "$FLYWAY_DIR" ]; then
  echo "Downloading Flyway CLI v$FLYWAY_VERSION for architecture $FLYWAY_ARCH..."
  curl -LJO "https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/$FLYWAY_VERSION/flyway-commandline-$FLYWAY_VERSION-$FLYWAY_ARCH.tar.gz"
  tar -xzf "flyway-commandline-$FLYWAY_VERSION-$FLYWAY_ARCH.tar.gz"
  mv "flyway-$FLYWAY_VERSION" "$FLYWAY_DIR"
  rm "flyway-commandline-$FLYWAY_VERSION-$FLYWAY_ARCH.tar.gz"
else
  echo "Flyway already installed."
fi

# Download Oracle JDBC driver
if [ ! -f "$FLYWAY_DIR/drivers/ojdbc8.jar" ]; then
  echo "Downloading Oracle JDBC driver..."
  mkdir -p "$FLYWAY_DIR/drivers"
  curl -L "$ORACLE_JDBC_URL" -o "$FLYWAY_DIR/drivers/ojdbc8.jar"
else
  echo "Oracle JDBC driver already exists."
fi

# Make Flyway executable
chmod +x "$FLYWAY_DIR/flyway"

echo "Flyway installation and Oracle JDBC driver setup complete!"

