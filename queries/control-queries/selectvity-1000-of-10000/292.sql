select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 133 and ss.ss_hash <= 883 and c.c_hash >= 595 and c.c_hash <= 928 and i.i_hash >= 101 and i.i_hash <= 501
;
