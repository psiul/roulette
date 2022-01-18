select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 147 and i.i_hash <= 480 and hd.hd_hash >= 41 and hd.hd_hash <= 791 and c.c_hash >= 300 and c.c_hash <= 700
;
