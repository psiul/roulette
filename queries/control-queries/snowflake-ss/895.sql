select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 201 and cd.cd_hash <= 951 and c.c_hash >= 146 and c.c_hash <= 479 and hd.hd_hash >= 133 and hd.hd_hash <= 533
;
