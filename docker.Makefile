bot:
        @docker build -q -t genesis/bot:latest -f bot.Dockerfile
notifier:
        @docker build -q -t genesis/notifier:latest -f notifier.Dockerfile
down:
        @docker-compose down
up_bot:
        @docker-compose up bot
up_notifier:
        @docker-compose up notifier
restart_bot: down up_bot
up: up_bot up_notifier
restart_notifier: down up_notifier
restart: down up
local:
        @rm -rf genesis; cp -R ../genesis genesis/
submod:
        @rm -rf genesis; git checkout -- genesis; git submodule update --remote genesis
