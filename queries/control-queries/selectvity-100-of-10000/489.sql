select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 288 and c.c_hash <= 788 and i.i_hash >= 283 and i.i_hash <= 483 and hd.hd_hash >= 788 and hd.hd_hash <= 888
;
