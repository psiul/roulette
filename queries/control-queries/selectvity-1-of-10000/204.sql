select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 107 and c.c_hash <= 127 and hd.hd_hash >= 272 and hd.hd_hash <= 372 and i.i_hash >= 920 and i.i_hash <= 970
;
