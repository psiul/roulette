select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 163 and ss.ss_hash <= 913 and c.c_hash >= 153 and c.c_hash <= 553 and cd.cd_hash >= 342 and cd.cd_hash <= 675
;
