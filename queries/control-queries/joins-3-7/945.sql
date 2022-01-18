select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 338 and ss.ss_hash <= 671 and c.c_hash >= 21 and c.c_hash <= 771 and cd.cd_hash >= 533 and cd.cd_hash <= 933
;
