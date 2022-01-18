select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 76 and ss.ss_hash <= 176 and i.i_hash >= 584 and i.i_hash <= 634 and c.c_hash >= 958 and c.c_hash <= 978
;
