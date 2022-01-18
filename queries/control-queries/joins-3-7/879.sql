select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 527 and ss.ss_hash <= 927 and c.c_hash >= 87 and c.c_hash <= 837 and cd.cd_hash >= 522 and cd.cd_hash <= 855
;
