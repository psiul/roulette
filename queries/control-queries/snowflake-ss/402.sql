select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 444 and ss.ss_hash <= 844 and i.i_hash >= 222 and i.i_hash <= 972 and cd.cd_hash >= 371 and cd.cd_hash <= 704
;
