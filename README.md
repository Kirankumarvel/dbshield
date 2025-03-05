
# DBShield: Automated MySQL/PostgreSQL Backup & Restore 🚀

DBShield automates database backups, compresses them, and securely uploads them to AWS S3 or Google Drive. Set it up once and never worry about losing your data again!

## 📌 Features

- ✔️ Supports MySQL & PostgreSQL databases
- ✔️ Automatic daily backups via cron jobs
- ✔️ Compression to save space
- ✔️ Securely uploads backups to AWS S3 or Google Drive
- ✔️ Auto-deletes old backups (retains last 7 days)
- ✔️ Easy restoration when needed

## 📂 Project Structure

```plaintext
📁 dbshield/
 ├── 📄 backup_script.sh   # Main backup script
 ├── 📄 restore_script.sh  # Restore script
 ├── 📂 backups/           # Local backup storage
 ├── 📄 README.md          # Documentation
```

## 🛠️ Prerequisites

- Linux/macOS (or Git Bash for Windows)
- MySQL/PostgreSQL installed and running
- AWS CLI configured (if using S3) OR Google Drive CLI installed (if using GDrive)

## 🚀 Installation & Setup

1️⃣ **Clone the Repository**

```sh
git clone https://github.com/yourusername/dbshield.git
cd dbshield
```

2️⃣ **Configure Database & Storage**

Edit `backup_script.sh` and update the following:

```sh
DB_TYPE="mysql"   # Change to 'postgres' for PostgreSQL
DB_NAME="your_database"
DB_USER="your_username"
DB_PASSWORD="your_password"
BACKUP_DIR="/backups"
UPLOAD_TO="s3"  # Change to 'gdrive' for Google Drive
S3_BUCKET="s3://your-bucket-name"
GDRIVE_FOLDER_ID="your-google-drive-folder-id"
```

3️⃣ **Make Scripts Executable**

```sh
chmod +x backup_script.sh restore_script.sh
```

## 💾 Running the Backup

To manually take a backup:

```sh
./backup_script.sh
```

## 📅 Automate with Cron Jobs

To run the script daily at 2 AM:

```sh
crontab -e
```

Add this line:

```plaintext
0 2 * * * /path/to/dbshield/backup_script.sh >> /var/log/db_backup.log 2>&1
```

## 🔄 Restoring a Backup

To restore the latest backup:

```sh
./restore_script.sh
```

## 📜 Future Enhancements

- 🔹 Add email notifications after backup completion
- 🔹 Store logs in a database for analytics
- 🔹 Implement a user-friendly CLI menu for easier usage

## 📌 Contributing

Feel free to submit issues, pull requests, and suggestions!

## 📃 License

MIT License © 2025 Your Name

🚀 Secure your data with DBShield – automated & reliable backups!
```
