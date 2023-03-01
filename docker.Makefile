bot:
	@docker build . -q -t genesis/bot:latest -f bot.Dockerfile
notifier:
	@docker build . -q -t genesis/notifier:latest -f notifier.Dockerfile
down:
	@docker-compose down
up_bot:
	@docker-compose up -d bot
up_notifier:
	@docker-compose up -d notifier
restart_bot: down up_bot
up: up_bot up_notifier
restart_notifier: down up_notifier
restart: down up
local:
	@rm -rf genesis; cp -R ../genesis genesis/
submod:
	@rm -rf genesis; git checkout -- genesis; git submodule update --remote genesis
up_prod_notifier:
	@docker-compose -f docker-compose.prod.yaml up -d notifier_cs notifier_de notifier_en \
	notifier_es notifier_fr	notifier_it notifier_ko notifier_pl notifier_pt notifier_ru \
	notifier_sr notifier_tr notifier_uk notifier_zh
up_prod_bot:
	@docker-compose -f docker-compose.prod.yaml up -d bot
up_prod: up_prod_notifier up_prod_bot
