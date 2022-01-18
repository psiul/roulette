select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 104 and ss.ss_hash <= 437 and hd.hd_hash >= 584 and hd.hd_hash <= 984 and i.i_hash >= 54 and i.i_hash <= 804
;
