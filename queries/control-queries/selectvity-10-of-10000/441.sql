select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 188 and hd.hd_hash <= 288 and i.i_hash >= 746 and i.i_hash <= 946 and cd.cd_hash >= 647 and cd.cd_hash <= 697
;
