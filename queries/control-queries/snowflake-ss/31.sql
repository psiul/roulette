select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 488 and ss.ss_hash <= 888 and i.i_hash >= 362 and i.i_hash <= 695 and c.c_hash >= 57 and c.c_hash <= 807
;
