select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 103 and ss.ss_hash <= 853 and cd.cd_hash >= 386 and cd.cd_hash <= 786 and c.c_hash >= 302 and c.c_hash <= 635
;
