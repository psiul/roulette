select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 579 and cd.cd_hash <= 912 and c.c_hash >= 463 and c.c_hash <= 863 and i.i_hash >= 145 and i.i_hash <= 895
;
