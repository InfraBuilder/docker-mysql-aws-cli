# infrabuilder/mysql-aws-cli

Command line clients for MySQL and AWS

You can use this image in your backup automation process to backup a MySQL and push backup onto S3, or restore a previous dump from s3 to MySQL.

Github : [![https://github.com/InfraBuilder/docker-mysql-aws-cli](https://img.shields.io/badge/Github-infraBuilder%2Fdocker--mysql--aws--cli-lightgrey)](https://github.com/InfraBuilder/docker-mysql-aws-cli)

Docker : [![https://hub.docker.com/r/infrabuilder/mysql-aws-cli](https://img.shields.io/badge/Docker-infraBuilder%2Fmysql--aws--cli-blue)](https://hub.docker.com/r/infrabuilder/mysql-aws-cli)

## Availables tags

- [mysql-8 (Dockerfile)](https://github.com/InfraBuilder/docker-mysql-aws-cli/blob/mysql-8/Dockerfile) - ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/infrabuilder/mysql-aws-cli/mysql-8)![GitHub last commit (branch)](https://img.shields.io/github/last-commit/InfraBuilder/docker-mysql-aws-cli/mysql-8)
- [mysql-5.7 (Dockerfile)](https://github.com/InfraBuilder/docker-mysql-aws-cli/blob/mysql-5.7/Dockerfile) - ![Docker Image Size (tag)](https://img.shields.io/docker/image-size/infrabuilder/mysql-aws-cli/mysql-5.7)![GitHub last commit (branch)](https://img.shields.io/github/last-commit/InfraBuilder/docker-mysql-aws-cli/mysql-5.7)

## Quickstart

To run this image with docker :

```bash
docker run -it --rm infrabuilder/mysql-aws-cli:mysql-8 bash
# or
docker run -it --rm infrabuilder/mysql-aws-cli:mysql-5.7 bash
```

## Configuration by env var

You can configure your AWS access with env variables (as in [Official documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)) :

| Env Variable          | Description                                                  |
| --------------------- | ------------------------------------------------------------ |
| AWS_ACCESS_KEY_ID     | Access key (Ex:  `AKIAIOSFODNN7EXAMPLE`)                     |
| AWS_SECRET_ACCESS_KEY | Secret key (Ex: `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`)  |
| AWS_DEFAULT_REGION    | Default aws region (Ex: `eu-west-3`, cf [Available regions](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)) |
| AWS_DEFAULT_OUTPUT    | Default output (Ex: `json`)                                  |

To configure AWS access with env var, just run :

```bash
docker run -it --rm \
    -e AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE" \
    -e AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY" \
    -e AWS_DEFAULT_REGION="eu-west-3" \
    -e AWS_DEFAULT_OUTPUT="table" \
    infrabuilder/mysql-aws-cli:mysql-8 bash
```

## How to use the dump to s3 script

Set env vars :

| Env Variable                  | Description                                                  |
| ----------------------------- | ------------------------------------------------------------ |
| DATABASES                     | Space separated database name list                           |
| BACKUP_DIR                    | Directory where local backup will be stored                  |
| PREFIX                        | Prefix for backup files                                      |
| S3_URL                        | URL to s3 folder where backup will be uploaded (s3://bucket/path) |
| AWS_ACCESS_KEY_ID             | Access key (Ex:  `AKIAIOSFODNN7EXAMPLE`)                     |
| AWS_SECRET_ACCESS_KEY         | Secret key (Ex: `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`)  |
| AWS_DEFAULT_REGION            | Default aws region (Ex: `eu-west-3`, cf [Available regions](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)) |
| AWS_DEFAULT_OUTPUT            | Default output (Ex: `json`)                                  |
| MYSQL_HOST                    | MySQL Host                                                   |
| MYSQL_USER and MYSQL_PASSWORD | Credentials to connect to MySQL                              |
| MYSQL_ROOT_PASSWORD           | If set, MYSQL_USER will be automatically set to `root`       |

And start : 

```bash
ibd-mysqldump-innodb-to-s3
```

