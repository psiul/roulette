select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 502 and i.i_hash <= 702 and hd.hd_hash >= 399 and hd.hd_hash <= 499 and c.c_hash >= 80 and c.c_hash <= 130
;
