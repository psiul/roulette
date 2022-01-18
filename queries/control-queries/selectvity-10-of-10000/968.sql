select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 489 and ss.ss_hash <= 689 and i.i_hash >= 688 and i.i_hash <= 788 and cd.cd_hash >= 937 and cd.cd_hash <= 987
;
