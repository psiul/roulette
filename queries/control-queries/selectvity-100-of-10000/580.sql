select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 110 and ss.ss_hash <= 610 and c.c_hash >= 682 and c.c_hash <= 882 and cd.cd_hash >= 464 and cd.cd_hash <= 564
;
