select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 88 and ss.ss_hash <= 838 and c.c_hash >= 469 and c.c_hash <= 869 and i.i_hash >= 168 and i.i_hash <= 501
;
