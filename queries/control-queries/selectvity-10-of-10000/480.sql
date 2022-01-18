select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 645 and hd.hd_hash <= 845 and i.i_hash >= 687 and i.i_hash <= 737 and c.c_hash >= 29 and c.c_hash <= 129
;
