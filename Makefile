bot:
	@podman build -q -t genesis/bot:latest -f bot.Dockerfile --no-cache
notifier:
	@podman build -q -t genesis/notifier -f notifier.Dockerfile --no-cache
down:
	@podman-compose down
up_bot:
	@podman-compose up bot
up_notifier:
	@podman-compose up notifier
restart_bot: down up_bot
up: up_bot up_notifier
restart_notifier: down up_notifier
restart: down up
local:
	@rm -rf genesis; cp -R ../genesis genesis/
submod:
	@rm -rf genesis; git checkout -- genesis; git submodule update --remote genesis
