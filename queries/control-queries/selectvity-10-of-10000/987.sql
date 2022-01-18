select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 209 and ss.ss_hash <= 409 and i.i_hash >= 682 and i.i_hash <= 732 and c.c_hash >= 483 and c.c_hash <= 583
;
