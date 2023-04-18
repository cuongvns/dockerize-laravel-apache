dockerize-laravel-5
#####


## How to use it

1. Clone this repository:

```bash
git clone https://github.com/cuongvns/dockerize-laravel-apache.git laravel
cd laravel
```

2. Clone your repo to `www` folder.

```
git clone {url} www
```

3. Edit `./.env` and run start.
```
chmod +rx start.sh
./start.sh
```
4. Copy `.env` and edit the file.
```
docker-compose exec www cp .env.example .env
```
5. Init your laravel.
```
docker-compose exec www composer install
docker-compose exec www php artisan key:generate
docker-compose exec www php artisan migrate
docker-compose exec www php artisan db:seed
```



#### Down your service
```
docker-compose down
docker network remove app_network
rm -rf .data
```