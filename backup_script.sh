
#!/bin/bash

# Configuration
DB_TYPE="mysql"  # Change to 'postgres' for PostgreSQL
DB_NAME="your_database"
DB_USER="your_username"
DB_PASSWORD="your_password"
BACKUP_DIR="/backups"
UPLOAD_TO="s3"  # Change to 'gdrive' for Google Drive
S3_BUCKET="s3://your-bucket-name"
GDRIVE_FOLDER_ID="your-google-drive-folder-id"
RETENTION_DAYS=7

# Timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$TIMESTAMP.sql.gz"

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Perform database backup
if [ "$DB_TYPE" == "mysql" ]; then
    mysqldump -u "$DB_USER" -p"$DB_PASSWORD" "$DB_NAME" | gzip > "$BACKUP_FILE"
elif [ "$DB_TYPE" == "postgres" ]; then
    PGPASSWORD="$DB_PASSWORD" pg_dump -U "$DB_USER" -d "$DB_NAME" | gzip > "$BACKUP_FILE"
else
    echo "Unsupported database type: $DB_TYPE"
    exit 1
fi

# Upload backup
if [ "$UPLOAD_TO" == "s3" ]; then
    aws s3 cp "$BACKUP_FILE" "$S3_BUCKET"
elif [ "$UPLOAD_TO" == "gdrive" ]; then
    gdrive upload --parent "$GDRIVE_FOLDER_ID" "$BACKUP_FILE"
else
    echo "Unsupported upload destination: $UPLOAD_TO"
    exit 1
fi

# Cleanup old backups
find "$BACKUP_DIR" -type f -name "${DB_NAME}_backup_*.sql.gz" -mtime +$RETENTION_DAYS -exec rm {} \;

# Completion message
echo "Backup completed successfully: $BACKUP_FILE"
```
