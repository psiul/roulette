select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 318 and i.i_hash <= 818 and c.c_hash >= 539 and c.c_hash <= 739 and hd.hd_hash >= 180 and hd.hd_hash <= 280
;
