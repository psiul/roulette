select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 24 and ss.ss_hash <= 774 and i.i_hash >= 123 and i.i_hash <= 456 and c.c_hash >= 291 and c.c_hash <= 691
;
