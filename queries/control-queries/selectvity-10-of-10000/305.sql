select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 712 and ss.ss_hash <= 912 and i.i_hash >= 567 and i.i_hash <= 667 and c.c_hash >= 172 and c.c_hash <= 222
;
