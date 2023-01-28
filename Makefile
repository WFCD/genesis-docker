bot:
	podman build -q -t genesis/bot:latest -f bot.Dockerfile
notifier:
	podman build -q -t genesis/notifier -f notifier.Dockerfile
down:
	podman-compose down
up_bot:
	podman-compose up bot
up_notifier:
	podman-compose up notifier
restart_bot: down up_bot
up: up_bot up_notifier
restart_notifier: down up_notifier
restart: down up
