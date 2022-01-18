select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 151 and ss.ss_hash <= 551 and c.c_hash >= 162 and c.c_hash <= 912 and cd.cd_hash >= 581 and cd.cd_hash <= 914
;
