select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 54 and i.i_hash <= 804 and hd.hd_hash >= 177 and hd.hd_hash <= 510 and c.c_hash >= 545 and c.c_hash <= 945
;
