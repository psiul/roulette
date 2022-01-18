select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 388 and ss.ss_hash <= 788 and i.i_hash >= 599 and i.i_hash <= 932 and cd.cd_hash >= 1 and cd.cd_hash <= 751
;
