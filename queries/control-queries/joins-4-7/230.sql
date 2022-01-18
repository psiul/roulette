select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 281 and ss.ss_hash <= 681 and cd.cd_hash >= 203 and cd.cd_hash <= 953 and i.i_hash >= 351 and i.i_hash <= 684
;
