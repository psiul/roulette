select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 537 and c.c_hash <= 637 and cd.cd_hash >= 740 and cd.cd_hash <= 940 and i.i_hash >= 583 and i.i_hash <= 633
;
