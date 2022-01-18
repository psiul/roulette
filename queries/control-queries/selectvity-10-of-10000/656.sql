select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 421 and ss.ss_hash <= 621 and c.c_hash >= 143 and c.c_hash <= 243 and hd.hd_hash >= 918 and hd.hd_hash <= 968
;
