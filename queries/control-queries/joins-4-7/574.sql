select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 299 and ss.ss_hash <= 699 and cd.cd_hash >= 614 and cd.cd_hash <= 947 and c.c_hash >= 123 and c.c_hash <= 873
;
