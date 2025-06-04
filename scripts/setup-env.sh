echo "setting up .env"

if [ -f .env ]; then
    echo ".env exists. skipping"
else
    cat <<EOF > .env
DB_NAME=core-db
DB_USER=dev
DB_PASSWORD=pass
DB_HOST=db-core
DB_PORT=5432

ALLOWED_HOSTS=localhost,127.0.0.1,auth-service
CORS_ALLOWED_ORIGINS=localhost:3001
EOF
fi
