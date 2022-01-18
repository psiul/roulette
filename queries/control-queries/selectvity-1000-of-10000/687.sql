select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 117 and ss.ss_hash <= 867 and c.c_hash >= 182 and c.c_hash <= 582 and hd.hd_hash >= 238 and hd.hd_hash <= 571
;
