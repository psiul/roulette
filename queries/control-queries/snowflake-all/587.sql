select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 203 and i.i_hash <= 953 and cd.cd_hash >= 385 and cd.cd_hash <= 718 and c.c_hash >= 563 and c.c_hash <= 963
;
