select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 192 and ss.ss_hash <= 942 and hd.hd_hash >= 148 and hd.hd_hash <= 481 and i.i_hash >= 240 and i.i_hash <= 640
;
