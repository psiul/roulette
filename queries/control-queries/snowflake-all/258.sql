select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 117 and ss.ss_hash <= 450 and c.c_hash >= 121 and c.c_hash <= 871 and i.i_hash >= 104 and i.i_hash <= 504
;
