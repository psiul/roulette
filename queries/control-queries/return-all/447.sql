select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 20 and ss.ss_hash <= 770 and c.c_hash >= 438 and c.c_hash <= 838 and cd.cd_hash >= 524 and cd.cd_hash <= 857
;
