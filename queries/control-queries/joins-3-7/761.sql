select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 327 and ss.ss_hash <= 660 and cd.cd_hash >= 381 and cd.cd_hash <= 781 and c.c_hash >= 111 and c.c_hash <= 861
;
