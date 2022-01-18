select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 625 and ss.ss_hash <= 958 and c.c_hash >= 66 and c.c_hash <= 816 and cd.cd_hash >= 244 and cd.cd_hash <= 644
;
